//
//  PADataManager.swift
//  PAPhotoArchivingTimelineView
//
//  Created by Tony Forsythe on 11/8/16.
//  Copyright © 2016 Tony Forsythe. All rights reserved.
//

import Foundation
import Firebase
import UIKit

enum PAPhotoUploadError : Error {
    case Something
}
protocol PADataManagerDelegate {
    func PADataManagerDidGetNewRepository(_ newRepository : PARepository)
    func PADataMangerDidConfigure()
    func PADataManagerDidFinishUploadingPhotographWithError( error : PAPhotoUploadError? )
}

class PADataManager {
    
    static let sharedInstance = PADataManager()
    
    var database_ref : FIRDatabaseReference?
    var storage_ref : FIRStorageReference?
    var recordings_storage_ref : FIRStorageReference?
    var delegate : PADataManagerDelegate?
    
    var configTimer : Timer?
    
    
    var isConfigured = false
    
    init() {
        
    }
    func configure() {
        
        guard !self.isConfigured else {
            TFLogger.log(logString: "The data manger is already configured...")
            return
        }
        
        self.configTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(PADataManager.configureFireFunction), userInfo: nil, repeats: true)
    }
    
    @objc func configureFireFunction() {
        
        if self.isConfigured {
            if let time = self.configTimer {
                time.invalidate()
                self.configTimer = nil
            }
            
            return
        }
        
        //  If Firebase is already configured then stop the timer and do personal configuration
        
        if (FIRApp.defaultApp() != nil) {
            database_ref = FIRDatabase.database().reference()
            storage_ref = FIRStorage.storage().reference(forURL: Constants.DataManager.firebaseStorageURL)
            recordings_storage_ref = storage_ref?.child(Constants.DataManager.firebaseRecordingsPath)
            
            self.isConfigured = true
            self.delegate?.PADataMangerDidConfigure()
        }
        
    }
    func addStoryToPhotograph( story : PAStory, photograph : PAPhotograph) {
        
        //  First upload the file
        
        if let data_url = story.tempRecordingURL, let rec_ref = self.recordings_storage_ref, let db_ref = database_ref {
            
            let child_ref = rec_ref.child("\(story.uid).m4a")
            
            let upload_task = child_ref.putFile(data_url, metadata: nil, completion: { (storage_metadata, err) in
                if let err = err {
                    TFLogger.log(str: "There was an error uploading the file", err: err)
                    return
                }
                
                TFLogger.log(logString: "Uploaded the file with metadata %@", arguments: (storage_metadata?.description)!)
                
                if let storage_metadata = storage_metadata {
                    if let download_url = storage_metadata.downloadURL() {
                        story.recordingURL = download_url.absoluteString
                        let photo_ref = db_ref.child("photographs/\(photograph.uid)")

                        let stories_ref = photo_ref.child("stories")
                        let new_story_ref = stories_ref.child(story.uid)
                        
                        new_story_ref.setValue(story.getFirebaseFriendlyArray())
                    }
                }
                //  Now create the database entry
                
                
            })
            
            
            
            
        }
    }
    
    
    func pullRepositories() {
        
        guard let dbRef = self.database_ref else {
            TFLogger.log(logString: "I couldn't get the database reference")
            return
        }
        
        
        let _ = dbRef.child("repositories").observe(.childAdded, with: { (snapshot) -> Void in
            
            if let newRepo = PARepository.CreateWithFirebaseSnapshot(snap: snapshot) {
                self.delegate?.PADataManagerDidGetNewRepository(newRepo)
            } else {
                let repositoryInformation = snapshot.debugDescription
                
                TFLogger.log(logString: "I couldn't create the repository with the following information %@", arguments: repositoryInformation)
            }
        })
    }
}


extension PADataManager {
    
    func addPhotographToRepository( newPhoto : PAPhotograph, repository : PARepository ) {
        
        if !isConfigured { return }
        
        guard let mainImage = newPhoto.mainImage, let thumbImage = newPhoto.thumbnailImage else
        {
            TFLogger.log(logString: "Either the main image or thumb image was null, aborting")
            return
        }
        
        guard   let mainImageData = UIImageJPEGRepresentation(mainImage, 1.0),
                let thumbImageData = UIImageJPEGRepresentation(thumbImage, 1.0) else {
                
                TFLogger.log(logString: "Either the main image or the thumb image could not be converted into an NSData object")
                    
                return
        }
        
        guard let s_ref = self.storage_ref, let db_ref = self.database_ref else { return }
        
        let mainImageName = newPhoto.uid + ".jpg"
        let thumbImageName = newPhoto.uid + "_tn.jpg"
        
        let mainImagesPath = "images/main/"
        let thumbImagesPath = "images/thumbnail/"
        
        
        
        
        //let queue = DispatchQueue(label: "myDispatchQueue")
        let dbSetGroup = DispatchGroup()
        let uploadGroup = DispatchGroup()
        let uploadingQueue = DispatchQueue(label: "uploadQueue")
        
        var someError : Error?
        var thumbnailURL : String?
        var mainURL : String?
        
        
        let mData = FIRStorageMetadata()
        mData.contentType = "image/jpeg"
        
        
        let dateLocation = repository.whereDoesPhotoFall(photo: newPhoto)
        var datePathUpdate = "repositories/" + repository.uid
        
        var shouldUpdateRepoDate = false
        
        switch dateLocation {
        case .Before:
            datePathUpdate += "/" + Keys.Repository.startDate
            shouldUpdateRepoDate = true
            
        case .After:
            datePathUpdate += "/" + Keys.Repository.endDate
            shouldUpdateRepoDate = true
            
        default:
            break
        }
        
        var updateDateString = ""
        
        if shouldUpdateRepoDate {
            updateDateString = PADateManager.sharedInstance.getDateString(date: newPhoto.dateTaken!, formatType: .FirebaseFull)
        }
        
        uploadGroup.enter()
        uploadingQueue.async(group: uploadGroup) {
            let mainImageRef = s_ref.child(mainImagesPath + mainImageName)
            mainImageRef.put(mainImageData, metadata: mData, completion: { (metadata, error) in
                
                if error != nil {
                    //  Abort
                    someError = error!
                    
                }
                
                if let dURL = metadata?.downloadURL() {
                    mainURL = dURL.absoluteString
                }
                
                uploadGroup.leave()
            })
        }
        
        uploadGroup.enter()
        uploadingQueue.async(group: uploadGroup) {
            let thumbImageRef = s_ref.child(thumbImagesPath + thumbImageName)
            thumbImageRef.put(thumbImageData, metadata: mData, completion: { (metadata, error) in
                
                if error != nil {
                    someError = error
                }
                
                if let dURL = metadata?.downloadURL() {
                    thumbnailURL = dURL.absoluteString
                }
                
                uploadGroup.leave()
            })
        }
        
    
        
        uploadGroup.notify(queue: DispatchQueue.main) {
            
            if someError != nil {
                return
            }
            if mainURL != nil, thumbnailURL != nil {
                newPhoto.mainImageURL = mainURL!
                newPhoto.thumbnailURL = thumbnailURL!
            }
            else {
                TFLogger.log(logString: "One of the urls turned out to be nil")
            }
            
            
            if shouldUpdateRepoDate {
                
                dbSetGroup.enter()
                uploadingQueue.async(group: dbSetGroup) {
                    
                    let dateUpdateHandle = db_ref.child(datePathUpdate)
                    dateUpdateHandle.setValue(updateDateString, withCompletionBlock: { (dateUpdateError, dateUpdateRef) in
                        
                        if dateUpdateError != nil {
                            //  Uh Oh
                        }
                        
                        dbSetGroup.leave()
                    })
                }
            }
            
            dbSetGroup.enter()
            uploadingQueue.async(group: dbSetGroup) {
                let photographData = newPhoto.PAGetJSONCompatibleArray()
                let photosPath = "photographs/" + newPhoto.uid
                
                let photoRef = db_ref.child(photosPath)
                
                photoRef.setValue(photographData, withCompletionBlock: { (err, ref) in
                    if let err = err {
                        someError = err
                    }
                    
                    dbSetGroup.leave()
                })
            }
            
            
            dbSetGroup.enter()
            uploadingQueue.async(group: dbSetGroup) {
                let pathToRepoPhotos = "repositories/" + repository.uid + "/photos"
                
                let photosDBRef = db_ref.child(pathToRepoPhotos).child(newPhoto.uid)
                
                photosDBRef.setValue("true", withCompletionBlock: { (err, ref) in
                    
                    if let err = err {
                        someError = err
                    }
                    
                    dbSetGroup.leave()
                })
            }
            
            
            
            dbSetGroup.notify(queue: DispatchQueue.main) {
                self.delegate?.PADataManagerDidFinishUploadingPhotographWithError(error: nil)
            }
            
        }
        
    }
}

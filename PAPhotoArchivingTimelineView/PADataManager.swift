//
//  PADataManager.swift
//  PAPhotoArchivingTimelineView
//
//  Created by Tony Forsythe on 11/8/16.
//  Copyright © 2016 Tony Forsythe. All rights reserved.
//

import Foundation
import Firebase


protocol PADataManagerDelegate {
    func PADataManagerDidGetNewRepository(_ newRepository : PARepository)
    func PADataMangerDidConfigure()
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



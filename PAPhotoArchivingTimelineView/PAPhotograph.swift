//
//  PAPhotograph.swift
//  PAPhotoArchivingTimelineView
//
//  Created by Tony Forsythe on 11/9/16.
//  Copyright © 2016 Tony Forsythe. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation
import Firebase

class PAPhotograph {
    
    var uid = ""
    var title = ""
    var longDescription = ""
    var uploadedBy : PAUser?
    var dateUploaded : Date?
    var thumbnailURL = ""
    var thumbnailImage : UIImage?
    var mainImageURL = ""
    var mainImage : UIImage?
    var taggedPeople : [PAPerson]?
    var stories : [PAStory] = [PAStory]()
    var dateTaken : Date?
    var dateTakenConf : Float = 0.0
    var locationTaken : PALocation?
    
    var delegate : PAPhotographDelegate?
    
}

protocol PAPhotographDelegate {
    func PAPhotographDidFetchNewStory( story : PAStory )
}

extension PAPhotograph {
    
    func fetchStories() {
        
        let db_ref = FIRDatabase.database().reference()
        
        let curr_photo_ref = db_ref.child("photographs").child(self.uid)
        
        let stories_ref = curr_photo_ref.child("stories")
        
        stories_ref.observe(.childAdded, with: { snapshot in
         
            if let new_story = PAStory.PAStoryFromSnapshot(snapshot: snapshot ) {
                self.stories.append(new_story)
                self.delegate?.PAPhotographDidFetchNewStory(story: new_story)
            }
            
            
        })
        
        
        
        
        
    }
}
extension PAPhotograph {
    
    
    static func photographWithSnapshot( snap : FIRDataSnapshot ) -> PAPhotograph? {
        
        guard let snapData = snap.value as? Dictionary<String, AnyObject> else { return nil }
        
        let newPhoto = PAPhotograph()
        
        newPhoto.title = snapData[Keys.Photograph.title] as? String ?? ""
        
        newPhoto.longDescription = snapData[Keys.Photograph.description] as? String ?? ""
    
        newPhoto.uid = snap.key
        
        newPhoto.dateTakenConf = snapData[Keys.Photograph.dateTakenConf] as? Float ?? Float(0.1)
        
        if let date_taken = snapData[Keys.Photograph.dateTaken] as? String {
            
            newPhoto.dateTaken = PADateManager.sharedInstance.getDateFromString(str: date_taken, formatType: .FirebaseFull)
        }
        
        newPhoto.mainImageURL = snapData[Keys.Photograph.mainURL] as? String ?? ""
        newPhoto.thumbnailURL = snapData[Keys.Photograph.thumbURL] as? String ?? ""
        
        
        let location = PALocation()
        
        let lattitude = snapData[Keys.Photograph.locationLattitude] as? CGFloat ?? CGFloat(0.0)
        let longitude = snapData[Keys.Photograph.locationLongitude] as? CGFloat ?? CGFloat(0.0)
        //let location_conf = snapData[Keys.Photograph.locationConf] as? Float ?? Float(0.0)
        let location_city = snapData[Keys.Photograph.locationCity] as? String ?? "Any City"
        let location_country = snapData[Keys.Photograph.locationCountry] as? String ?? "Any Country"
        let location_state = snapData[Keys.Photograph.locationState] as? String ?? "Any State"
        
        location.coordinates = CLLocationCoordinate2D(latitude: CLLocationDegrees(lattitude), longitude: CLLocationDegrees(longitude))
        location.city = location_city
        location.country = location_country
        location.state = location_state
        
        newPhoto.locationTaken = location
        
        return newPhoto
        
    }
}


//  An extension to get an array of useful chunks
//  of data
extension PAPhotograph {
    
    func getPhotoInfoData() -> [AnyObject] {
        var info : [AnyObject] = [AnyObject]()
        
        let titleInfo = PAPhotoInfoText(_uuid: self.uid, _title: "Title", _mainText: self.title, _supplementaryText: "", _type: .Text)
        
        info.append(titleInfo)
        
        
        let dateTakenInfo = PAPhotoInfoDate(    _uid: self.uid,
                                                _title: "Date Taken",
                                                _type: .Date,
                                                _dateTaken: self.dateTaken,
                                                _dateTakenConf: self.dateTakenConf,
                                                _dateTakenString: PADateManager.sharedInstance.getDateString(date: (self.dateTaken ?? Date()),
                                                                                                             formatType: .Pretty))
        
        info.append(dateTakenInfo)
        
        let locationInfo = PAPhotoInfoLocation(_uuid: self.uid, _title: self.title, _type: .Location, _cityName: (self.locationTaken?.city)!, _stateName: (self.locationTaken?.state)!, _coordinates: (self.locationTaken?.coordinates!)!, _confidence: 0.4)
        
        info.append(locationInfo)
        
        
        return info
    }
}

//  For creating a mock photograph
extension PAPhotograph {
    
    static func Mock1() -> PAPhotograph {
        
        let newPhoto = PAPhotograph()
        
        newPhoto.uid = UUID().uuidString
        
        newPhoto.dateTaken = PADateManager.sharedInstance.getDateFromYearInt(year: 1922)
        newPhoto.dateTakenConf = 0.8
        newPhoto.dateUploaded = Date.dateBySubtractingDays(days: 600)
        newPhoto.longDescription = "What a day to be out!"
        newPhoto.title = "A day at the park"
        newPhoto.thumbnailURL = "https://www.chrishair.co.uk/assets/images/fifa/bayern-munchen.png"
        newPhoto.mainImageURL = "https://www.chrishair.co.uk/assets/images/fifa/bayern-munchen.png"
        
        let location = PALocation()
        location.city = "St. Louis"
        location.state = "Missouri"
        location.country = "U.S.A."
        location.zip = "63144"
        location.coordinates = CLLocationCoordinate2D(latitude: 38.6011179, longitude: -90.3681826)
        
        newPhoto.locationTaken = location
        
        let uploader = PAUser()
        
        uploader.dateJoined = Date.dateBySubtractingYears(years: 3)
        uploader.dateLastLoggedIn = Date.dateBySubtractingDays(days: 10)
        uploader.birthDate = Date.dateBySubtractingYears(years: 21)
        uploader.firstName = "Anthony"
        uploader.lastName = "F"
        uploader.profileImageURL = "http://i.imgur.com/0o3i6of.jpg"
        
        newPhoto.uploadedBy = uploader
        
        return newPhoto
    }
    
    
}

//  Logger extension
extension PAPhotograph {
    
    var PADescription : String {
        get {
            let objectLogger = PAObjectLogger()
            
            objectLogger.title = "PAPhotograph Description"
            
            //  UID
            objectLogger.addStringWithTitle(title: "UID", value: self.uid)
            
            //  Title
            objectLogger.addStringWithTitle(title: "Title", value: self.title)
            
            //  Long Description
            objectLogger.addStringWithTitle(title: "Long Description", value: self.longDescription)
            
            //  Date Uploaded
            objectLogger.addDateWithTitle(title: "Date Taken", val: self.dateTaken)
            
            //  Thumbnail URL
            objectLogger.addStringWithTitle(title: "Thumbnail URL", value: self.thumbnailURL)
            
            //  Main URL
            objectLogger.addStringWithTitle(title: "Main URL", value: self.mainImageURL)
            
            return objectLogger.getLogString()
        }
    }
}

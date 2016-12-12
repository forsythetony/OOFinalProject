//
//  LocationManager.swift
//  PAPhotoArchivingTimelineView
//
//  Created by Tony Forsythe on 12/12/16.
//  Copyright © 2016 Tony Forsythe. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

struct PAState : Equatable {
    var abbreviation : String?
    var fullName : String?
    
    public static func ==(lhs: PAState, rhs: PAState) -> Bool {
        guard let l = lhs.abbreviation, let r = rhs.abbreviation else {
            return false
        }
        
        return (l == r)
    }
}
enum PALocationManagerError : Error {
    case FailedToGetStates
}
class PALocationManager {
    
    lazy var fileMan = PAFileManager.sharedInstance
    
    static let sharedInstance = PALocationManager()
    
    
    func getAllStates( completion : ((PALocationManagerError?, [PAState]?) -> Void)) {
        
        guard let locationData = fileMan.getJSONDataWithFilename(fileName: "LocationData") else {
            completion(PALocationManagerError.FailedToGetStates, nil)
            return
        }
        
        let json = JSON(data: locationData)
        
        if let states = json["states"].array {
            
            var statesArr = [PAState]()
            
            for(stateVal) : (JSON) in states {
                
                let newState = PAState(abbreviation: stateVal["abbreviation"].string, fullName: stateVal["name"].string)
                
                statesArr.append(newState)
            }
            
            completion(nil, statesArr)
            return
        }
        else {
            completion(PALocationManagerError.FailedToGetStates, nil)
            return
        }
        
    }
    
}

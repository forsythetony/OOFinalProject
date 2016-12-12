//
//  PAFileManager.swift
//  PAPhotoArchivingTimelineView
//
//  Created by Tony Forsythe on 11/26/16.
//  Copyright © 2016 Tony Forsythe. All rights reserved.
//

import Foundation

class PAFileManager {
    static let sharedInstance = PAFileManager()
    
    private let fileMan = FileManager()
    private var docsDirectory : String?
    private var ready = true
    
    init() {
        
        getDocumentsDirectory()
        
        validateFilePaths()
        
    }
    
    func getRecordingURLForNewStory( story : PAStory ) -> URL? {
        
        if !ready {
            return nil
        }
        
        guard let docs_dir = self.docsDirectory else {
            ready = false
            return nil
        }
        let audio_type = "m4a"
        
        let recording_path = docs_dir.stringByAppendingPathComponent(path: Constants.FileManager.tempRecordingPath).stringByAppendingPathComponent(path: "\(story.uid).\(audio_type)")
        
        return URL(fileURLWithPath: recording_path)
        
    }
    private func getDocumentsDirectory() {
        
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        
        if paths.count > 0 {
            self.docsDirectory = paths.first
        }
        else {
            self.docsDirectory = nil
            ready = false
        }
    }
    
    func getJSONDataWithFilename( fileName : String ) -> Data? {
        
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            TFLogger.log(logString: "Couldn't get the url with string", arguments: fileName)
            return nil
        }
        
        do {
            let jsonData = try Data(contentsOf: url)
            
            return jsonData
            
        } catch let err {
            TFLogger.log(str: "Error reading the json data", err: err)
            return nil
        }
    }
    private func validateFilePaths() {
        
        if ready == false {
            return
        }
        
        guard let docs_dir = self.docsDirectory else {
            TFLogger.log(logString: "There was no documents directory set")
            return
        }
        
        let temp_path = docs_dir.stringByAppendingPathComponent(path: Constants.FileManager.tempPath)
        if !fileMan.fileExists(atPath: temp_path) {
            do {
                try fileMan.createDirectory(atPath: temp_path, withIntermediateDirectories: true, attributes: nil)
                ready = true
                
            }
            catch let err {
                TFLogger.log(str: "There was an error creating the directory", err: err)
                ready = false
            }
        }
        else {
            let temp_recordings_path = docs_dir.stringByAppendingPathComponent(path: Constants.FileManager.tempRecordingPath)
            
            if !fileMan.fileExists(atPath: temp_recordings_path) {
                do {
                    try fileMan.createDirectory(atPath: temp_recordings_path, withIntermediateDirectories: true, attributes: nil)
                    ready = true
                }
                catch let err {
                    TFLogger.log(str: "There was an error creating the directory", err: err)
                    ready = false
                }
            }
        }
    }
}

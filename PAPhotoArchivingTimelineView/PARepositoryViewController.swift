//
//  ViewController.swift
//  PAPhotoArchivingTimelineView
//
//  Created by Tony Forsythe on 10/26/16.
//  Copyright © 2016 Tony Forsythe. All rights reserved.
//

import UIKit
import Firebase
import Iconic

class PARepositoryViewController: UIViewController, PAChromeCasterDelegate {

    var ref : FIRDatabaseReference!
    var repositories : [FIRDataSnapshot]! = []
    var storageRef: FIRStorageReference!
    let chromecaster = PAChromecaster.sharedInstance
    
    var currentRepository : PARepository? {
        didSet {
            self.setupTimelineView()
        }
    }
    
    fileprivate var _refHandle: FIRDatabaseHandle!
    
    var can_use : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        chromecaster.delegate = self
        self.setupAddPhotographButton()
        
    }
    
    
    func showAlertViewWithDevice( device : GCKDevice ) {
        
        let a = UIAlertController(title: "Device Found", message: "Would you like to connect", preferredStyle: .alert)
        
        let noAction = UIAlertAction(title: "Take no action", style: .cancel, handler: { action in
            
            
            
        })
        
        let connectAction = UIAlertAction(title: "Connect", style: .default, handler: { action in
            
            self.chromecaster.connectToDevice(dev: device)
        })
        
        a.addAction(noAction)
        a.addAction(connectAction)
        
        self.present(a, animated: true, completion: nil)
        
    }
   
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.navigationController?.navigationItem.PAClearBackButtonTitle()
    }
    
    func didTapUploadStory( sender : UIBarButtonItem ) {
        
    }
    func setupTimelineView() {
        var viewRect = self.view.bounds
        viewRect.origin.x = 0.0
        viewRect.origin.y = 0.0
        
        
        let rInfo = self.currentRepository ?? PARepository.Mock1()
        
        let timelineView = PATimelineView(frame: viewRect, repoInfo: rInfo)
        timelineView.delegate = self
        
        
        self.title = rInfo.title
        
        self.view.addSubview(timelineView)
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let segueID = segue.identifier else { return }
        
        
        switch segueID {
            
        case Constants.SegueIDs.ToPhotoInformation:
            if let photoInfo = sender as? PAPhotograph {
                
                let dest = segue.destination as! PAPhotoInformationViewController
                
                dest.photoInfo = photoInfo
            }
            
        case Constants.SegueIDs.SegueFromTimelineToAddPhotograph:
            guard let repo = self.currentRepository else {
                self.PADisplayErrorAlert(message: "There was an error trying to access the repository")
                return
            }
            
            let dest = segue.destination as! PAPhotoUploadForm
            
            dest.repo = repo
            dest.delegate = self
            
        default:
            print("Default")
        }
    }
    
    func didConnectToDevice(device: GCKDevice) {
        
    }
    
    func didFindNewDevice(device: GCKDevice) {
        self.showAlertViewWithDevice(device: device)
    }
    
    
    
    private func setupInfoButton() {
        
        //let btnImg = UIImage(named: "info_icon")?.withRenderingMode(.alwaysOriginal)
        let icon = FontAwesomeIcon.InfoSign
        let btnSize = CGSize(width: 40.0, height: 40.0)
        let btnImg = icon.image(ofSize: btnSize, color: Color.white)
        
        
        let btn = UIBarButtonItem(image: btnImg, style: .plain, target: self, action: #selector(self.didTapAboutInfo(sender:)))
        
        self.navigationItem.rightBarButtonItem = btn
    }
    
    func didTapAboutInfo( sender : UIBarButtonItem ) {
        
        let infoController = PAAboutPageViewController()
        
        self.present(infoController, animated: true, completion: nil)
        
    }
    
    private func setupAddPhotographButton() {
        
        let icon = FontAwesomeIcon.PlusSign
        let iconSize = CGSize(width: 30.0, height: 30.0)
        let iconImage = icon.image(ofSize: iconSize, color: .black).withRenderingMode(.alwaysOriginal)
        
        let rightBarButtonItem = UIBarButtonItem(image: iconImage, style: .plain, target: self, action: #selector(self.didTapAddPhotograph(sender:)))
        
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    func didTapAddPhotograph( sender : UIBarButtonItem ) {
        self.performSegue(withIdentifier: Constants.SegueIDs.SegueFromTimelineToAddPhotograph, sender: nil)
    }

}

extension PARepositoryViewController: PATimelineViewDelegate {
    
    func PATimelineViewPhotographWasTapped(info: PAPhotograph) {
        
        TFLogger.log(logString: "Tapping image with information", arguments: info.getPhotoInfoData().description)
        self.chromecaster.sendPhoto(photo: info)
        self.performSegue(withIdentifier: Constants.SegueIDs.ToPhotoInformation, sender: info)
    }
}

extension PARepositoryViewController : PAPhotoUploadFormDelegate {
    
    func PAPhotoUploadFormDidCancel() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func PAPhotoUploadFormDidFinishUploadingPhotoWithError(error: PAPhotoUploadError?) {
        if let err = error {
            self.dismiss(animated: true, completion: {
                self.PADisplayErrorAlert(message: "There was an error uploading the image \(err.localizedDescription)")
            })
            
            return
        }
        
        self.dismiss(animated: true, completion: nil)
    }
}

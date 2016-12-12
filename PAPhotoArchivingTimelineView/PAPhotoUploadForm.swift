//
//  PAPhotoUploadForm.swift
//  PAPhotoArchivingTimelineView
//
//  Created by Tony Forsythe on 12/10/16.
//  Copyright © 2016 Tony Forsythe. All rights reserved.
//

import UIKit
import Eureka
import SwiftSpinner

protocol PAPhotoUploadFormDelegate {
    func PAPhotoUploadFormDidFinishUploadingPhotoWithError( error : PAPhotoUploadError?)
    func PAPhotoUploadFormDidCancel()
}
class PAPhotoUploadForm : FormViewController {
    
    var photoInformation : PAPhotograph = PAPhotograph()
    
    var photoPickerController : UIImagePickerController?
    var photoPickerChoice : UIImagePickerControllerSourceType = .photoLibrary {
        didSet {
            
            guard let pickerController = self.photoPickerController else { return }
            
            pickerController.sourceType = self.photoPickerChoice
        }
    }
    
    
    let headerImageView = UIImageView()
    
    var isShowingAlert = false
    
    let dataMan : PADataManager = PADataManager.sharedInstance
    
    var delegate : PAPhotoUploadFormDelegate?
    
    var repo : PARepository? {
        didSet {
            
            //  Set the value for center date
            if let startDate = self.repo?.startDate, let endDate = self.repo?.endDate {
                let centerDate = startDate <-> endDate
                
                self.form.PAsetValueForRowWithTag(value: centerDate, rowTag: Keys.Photograph.dateTaken)
            }
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataMan.delegate = self
        
        if !dataMan.isConfigured {
            dataMan.configure()
        }
        
        form = Section("Photograph") { section in
            
            section.tag = "Photograph"
            
            var header = HeaderFooterView<PACustomHeaderView>(.class)
            header.height = { PACustomHeaderView.height }
            
            
            
            section.header = header
            
            }
        
            <<< ButtonRow() { btnRow in
            
                btnRow.title = "Select Photograph"
            
            } . onCellSelection({ (cellOf, rowOf) in
                
                self.showPhotoOptions()
            })
        +++ Section("Basic Information")
            <<< TextRow() { row in
                row.title = "Title"
                row.placeholder = "Enter Title"
                row.tag = Keys.Photograph.title
            }
            <<< TextAreaRow() { row in
                
                row.title = "Description"
                row.value = ""
                row.placeholder = "Enter a description"
                row.tag = Keys.Photograph.description
            
            }
            
        +++ Section("Date Taken")
            <<< DateRow() { dateRow in
                    dateRow.title = "Date Taken"
                    dateRow.maximumDate = Date()
                    dateRow.value = self.getRandomDate()
                    dateRow.tag = Keys.Photograph.dateTaken
            }
            <<< SliderRow() { sRow in
                sRow.title = "Confidence"
                sRow.minimumValue = 0
                sRow.maximumValue = 100
                sRow.value = 50
                sRow.steps = 100
                sRow.tag = Keys.Photograph.dateTakenConf
                
            }
        +++ Section("Location")
            <<< PickerInlineRow<PAState>() { (row : PickerInlineRow<PAState>) -> Void in
                
                row.title = "State"
                row.displayValueFor = { (rowValue : PAState?) in
                    if let s = rowValue {
                        return s.abbreviation!
                    }
                    else {
                        return ""
                    }
                }
                row.tag = Keys.Photograph.locationState
            }
        +++ Section("Completion")
            <<< ButtonRow() { btnRow in
                btnRow.title = "Submit"
            } .onCellSelection({ (_, _) in
                self.didTapSubmit()
            })
            <<< ButtonRow() { btnRow in
                btnRow.title = "Cancel"
            }
        
        
        self.setupLocationData()
        self.setupPicker()
    }
    
    private func setupLocationData() {
        
        let locMan = PALocationManager.sharedInstance
        locMan.getAllStates { (err, states) in
            if err != nil {
                TFLogger.log(logString: "There was an error for real")
                return
            }
            
            let row = self.form.rowBy(tag: Keys.Photograph.locationState) as? PickerInlineRow<PAState>
            
            for state in states! {
                row?.options.append(state)
            }
        }
    }
    private func getRandomDate() -> Date {
        if let repository = self.repo {
            if let startDate = repository.startDate, let endDate = repository.endDate {
                
                let centerDate = startDate <-> endDate
                
                return centerDate
            }
        }
        
        return PADateManager.sharedInstance.randomDateBetweenYears(startYear: 1900, endYear: 2000)
    }
    func didTapSubmit() {
        getThumbnailImages()
        updatePhotoInfo()
        
        let p = self.photoInformation
        
        if p.mainImage == nil {
            self.PADisplayErrorNoticeBar(message: "You need to choose an image.", duration: 3.0, color: .PAErrorWarning)
            
            return
        }
        
        if dataMan.isConfigured {
            dataMan.addPhotographToRepository(newPhoto: p, repository: repo ?? PARepository.Mock2())
            SwiftSpinner.show("Uploading Photograph")
            
        }
        
    }
    
    func showAlertViewWithMessage( message : String ) {
        if self.isShowingAlert { return }
        
        let alert = UIAlertController(title: "Uh Oh", message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: { action in
            
            self.isShowingAlert = false
        })
        
        alert.addAction(okAction)
        
        self.present(alert, animated: true, completion: {
            self.isShowingAlert = true
        })
    }
    func valueForKey( key : String ) -> Any? {
    
        return self.form.rowBy(tag: key)?.baseValue

    }
    
    func updatePhotoInfo() {
        
        let p = self.photoInformation
        
        if let title = self.valueForKey(key: Keys.Photograph.title) as? String {
            p.title = title
        }
        
        if let desc = self.valueForKey(key: Keys.Photograph.description) as? String {
            p.longDescription = desc
        }
        
        if let dateTaken = self.valueForKey(key: Keys.Photograph.dateTaken) as? Date {
            p.dateTaken = dateTaken
        }
        
        if let dateTakenConf = self.valueForKey(key: Keys.Photograph.dateTakenConf) as? Float {
            p.dateTakenConf = dateTakenConf
        }
        
        
        
    }
    func getThumbnailImages() {
        let p = self.photoInformation
        guard let mainPhoto = p.mainImage else { return }
        
        if let thumbImage = UIImage.PAImageWithImage(img: mainPhoto, scaledTo: Constants.Photographs.thumbnailSize) {
            p.thumbnailImage = thumbImage
        }
        else {
            p.thumbnailImage = #imageLiteral(resourceName: "thumb_image_test")
        }
    }
    func didTapCancel() {
        
    }
    func setupPicker() {
        
        
        self.photoPickerController = UIImagePickerController()
        
        guard let pp = self.photoPickerController else { return }
        
        pp.delegate = self
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            pp.sourceType = .photoLibrary
        }
        
        
        pp.allowsEditing = true
    }
    
    func showPhotoOptions() {
        
        let typePicker = UIAlertController(title: "Source Pick", message: "Pick a source", preferredStyle: .actionSheet)
        
        let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default, handler: { (alertAction) in
            
            self.photoPickerChoice = .photoLibrary
            self.displayPhotoSelector()
        })
        
        
        let cameraAction = UIAlertAction(title: "Camera", style: .default, handler: { (alertAction) in
            
            self.photoPickerChoice = .camera
            self.displayPhotoSelector()
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: { (alertAction) in
            
            //  Cancel
        })
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            typePicker.addAction(photoLibraryAction)
        }
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            typePicker.addAction(cameraAction)
        }
        
        typePicker.addAction(cancelAction)
        
        
        self.present(typePicker, animated: true, completion: nil)

    }
    
    func displayPhotoSelector() {
        guard let pp = self.photoPickerController else { return }
        
        self.present(pp, animated: true, completion: nil)
    }
    
    func updateImage( newImage : UIImage ) {
        
        guard let sectionOne = self.form.sectionBy(tag: "Photograph") else {
            TFLogger.log(logString: "Couldn't get the section")
            return
        }
        
        
        if let customHeaderView = sectionOne.header as? HeaderFooterView<PACustomHeaderView> {
            
            if let v = customHeaderView.viewForSection(sectionOne, type: .header) as? PACustomHeaderView {
                v.imageView.image = newImage
            }
        }
    }
}

extension PAPhotoUploadForm : UINavigationControllerDelegate, UIImagePickerControllerDelegate {
 
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        picker.dismiss(animated: false, completion: nil)
        
        //guard let photoInfo = self.photoInformation else { return }
        
        if let editedImage = info[UIImagePickerControllerEditedImage] as? UIImage {
            self.photoInformation.mainImage = editedImage
            self.updateImage(newImage: editedImage)
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: false, completion: nil)
    }
}

class PACustomHeaderView : UIView {
    
    static let height : CGFloat = 200.0
    
    let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        var frm = frame
        frm.PASetOriginToZero()
        frm.size.width = 320.0
        frm.size.height = PACustomHeaderView.height
        
        imageView.frame = frm
        
        imageView.contentMode = .scaleAspectFit
        self.clipsToBounds = true
        self.backgroundColor = Color.PAGreyOne
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        
        self.addSubview(imageView)
        
        imageView.alignToParent(with: 0.0)
        
        
        let placeholderImage = UIImage.PABoxPlaceholderImageWithDimension(dim: PACustomHeaderView.height * 0.8, color: .PAWhiteTwo)
        
        imageView.image = placeholderImage
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension PAPhotoUploadForm : PADataManagerDelegate {
    
    func PADataMangerDidConfigure() {
    }
    
    
    func PADataManagerDidGetNewRepository(_ newRepository: PARepository) {
        
    }
    
    func PADataManagerDidFinishUploadingPhotographWithError(error: PAPhotoUploadError?) {
        SwiftSpinner.hide()
        self.delegate?.PAPhotoUploadFormDidFinishUploadingPhotoWithError(error: error)
    }
}

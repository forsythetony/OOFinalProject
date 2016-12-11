//
//  PAPhotoUploadForm.swift
//  PAPhotoArchivingTimelineView
//
//  Created by Tony Forsythe on 12/10/16.
//  Copyright © 2016 Tony Forsythe. All rights reserved.
//

import UIKit
import Eureka

class PAPhotoUploadForm : FormViewController {
    
    var photoInformation : PAPhotograph = PAPhotograph()
    
    var photoPickerController : UIImagePickerController?
    
    let headerImageView = UIImageView()
    
    var isShowingAlert = false
    
    let dataMan : PADataManager = PADataManager.sharedInstance
    
    let repo = PARepository.Mock2()
    
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
                
                self.displayPhotoSelector()
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
                    dateRow.value = PADateManager.sharedInstance.randomDateBetweenYears(startYear: 1900, endYear: 2000)
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
        +++ Section("Completion")
            <<< ButtonRow() { btnRow in
                btnRow.title = "Submit"
            } .onCellSelection({ (_, _) in
                self.didTapSubmit()
            })
            <<< ButtonRow() { btnRow in
                btnRow.title = "Cancel"
            } .onCellSelection({ (_, _) in
                self.didTapCancel()
            })
        
        
        self.setupPicker()
    }
    
    func didTapSubmit() {
        getThumbnailImages()
        updatePhotoInfo()
        
        let p = self.photoInformation
        
        if p.mainImage == nil {
            self.showAlertViewWithMessage(message: "You didn't pick an image...")
            return
        }
        
        if dataMan.isConfigured {
            dataMan.addPhotographToRepository(newPhoto: p, repository: repo)
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
        
        imageView.contentMode = .scaleAspectFill
        self.clipsToBounds = true
        self.backgroundColor = Color.orange
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        
        self.addSubview(imageView)
        
        imageView.alignToParent(with: 0.0)
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
}

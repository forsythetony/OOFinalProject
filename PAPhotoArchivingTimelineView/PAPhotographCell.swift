//
//  PAPhotographCell.swift
//  PAPhotoArchivingTimelineView
//
//  Created by Tony Forsythe on 11/8/16.
//  Copyright © 2016 Tony Forsythe. All rights reserved.
//

import UIKit
import AlamofireImage

protocol PAPhotographCellDelegate {
    func PAPhotographCellWasTapped( sender : PAPhotographCell )
}

class PAPhotographCell: UIView {

    var photographInfo : PAPhotograph?
    var delegate : PAPhotographCellDelegate?
    
    
    let photoImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupImageView()
        
    }
    
    convenience init(frame : CGRect, info : PAPhotograph) {
        
        var newFrame = CGRect()
        newFrame.size.width = Constants.Timeline.PhotographCell.Width
        newFrame.size.height = Constants.Timeline.PhotographCell.Height
        
        self.init(frame : newFrame)
        
        self.photographInfo = info
        
        updateInformation()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setupImageView() {
        
        var imgViewFrame = self.frame
        
        imgViewFrame.origin.x = 0.0
        imgViewFrame.origin.y = 0.0
        
        imgViewFrame.size.width = min(imgViewFrame.size.height, imgViewFrame.size.width)
        imgViewFrame.size.height = imgViewFrame.size.width
        
        photoImageView.frame = imgViewFrame
        photoImageView.contentMode = .scaleAspectFit
        photoImageView.image = UIImage.PAImageWithSizeAndColor(size: imgViewFrame.size, color: .orange)
        
        self.addSubview(photoImageView)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(PAPhotographCell.didTapPhotograph(sender:)))
        
        tap.numberOfTapsRequired = 1
        
        self.addGestureRecognizer(tap)
    }
    
    private func updateInformation() {
        
        if let info = self.photographInfo {
            let url = URL(string: info.mainImageURL)!
            let placeholder = UIImage.PABoxPlaceholderImageWithDimension(dim: self.frame.height * 0.7, color: .PAWhiteTwo)
            let filter = AspectScaledToFillSizeWithRoundedCornersFilter(size: self.frame.size, radius: 5.0)
            
            self.photoImageView.af_setImage(
                withURL: url,
                placeholderImage: placeholder,
                filter: filter,
                progress: { (progress) in
                    print("The progress is \(progress)")
                },
                progressQueue: DispatchQueue.main,
                imageTransition: .crossDissolve(0.5),
                runImageTransitionIfCached: true,
                completion: nil)
        }
        
    }
    
    func didTapPhotograph( sender : UITapGestureRecognizer ) {
    
        self.delegate?.PAPhotographCellWasTapped(sender: self)
    }
}

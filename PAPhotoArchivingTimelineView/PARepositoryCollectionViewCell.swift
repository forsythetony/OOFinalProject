//
//  PARepositoryCollectionViewCell.swift
//  PAPhotoArchivingTimelineView
//
//  Created by Tony Forsythe on 12/9/16.
//  Copyright © 2016 Tony Forsythe. All rights reserved.
//

import UIKit
import AlamofireImage

class PARepositoryCollectionViewCell: UICollectionViewCell {
    
    static let ReuseID = "PARepositoryCollectionViewCellReuseIdentifier"
    static let Height : CGFloat = 200.0
    static let Width : CGFloat = 200.0
    
    let ImageView = UIImageView()
    let TitleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        
        
        self.setupViews()
    }
    func setImageWithLink( link : String) {
        
        guard let url = URL(string: link) else {
            return
        }
        
        
        let placeholderImage = UIImage.PABoxPlaceholderImageWithDimension(dim: self.frame.height * 0.8, color: .PAWhiteTwo)
        let progressFunction : ((Progress) -> ()) = { (progress) in
            let totalWork = progress.totalUnitCount
            let currWork = progress.completedUnitCount
            
            let floatProgress = (Float(currWork) / Float(totalWork)) * Float(100.0)
            
            let progressString = String.init(format: "%.2f", floatProgress)
            
            let str = "\n\nTotal Progress:\t" + progressString + "\n"
            
            print(str)
        }
        let filter = AspectScaledToFillSizeWithRoundedCornersFilter(size: self.frame.size, radius: 5.0)
        
        self.ImageView.af_setImage(withURL: url, placeholderImage: placeholderImage, filter: filter, progress: progressFunction, progressQueue: DispatchQueue.main, imageTransition: .crossDissolve(0.5), runImageTransitionIfCached: true, completion: nil)
        
    }
    private func setupViews() {
        
        
        self.contentView.clipsToBounds = true
        
        
        //  Setup label
        var frm = self.frame
    
        frm.PASetOriginToZero()
        
        let titleLabelHeight : CGFloat = 25.0
        
        
        frm.size.height = titleLabelHeight
        
        TitleLabel.frame = frm
        TitleLabel.font = Font.PARegularFontWithSize(size: 10.0)
        
        //  Hide the title label for now
        TitleLabel.alpha = 0.0
        
        
        self.contentView.addSubview(TitleLabel)
        
        frm.size.height = self.frame.height - titleLabelHeight
        frm.origin.y = 0.0
        
        ImageView.frame = frm
        ImageView.contentMode = .scaleAspectFill
        ImageView.alpha = 0.8
        
        self.contentView.addSubview(ImageView)
        
        self.contentView.sendSubview(toBack: ImageView)
        
        ImageView.alignToParent(with: 0.0)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

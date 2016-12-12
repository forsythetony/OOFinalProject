//
//  TFImageHelpers.swift
//  PAPhotoArchivingTimelineView
//
//  Created by Tony Forsythe on 12/12/16.
//  Copyright © 2016 Tony Forsythe. All rights reserved.
//

import Foundation
import Iconic

extension UIImage {
    
    static func PABoxPlaceholderImageWithDimension( dim : CGFloat, color : Color = .white ) -> UIImage {
        let icon = FontAwesomeIcon.Picture
        let iconSize = CGSize(width: dim * 1.3, height: dim)
        
        let image = icon.image(ofSize: iconSize, color: color)
        
        return image
    }
}

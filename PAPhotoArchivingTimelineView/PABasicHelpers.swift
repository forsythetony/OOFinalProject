//
//  PABasicHelpers.swift
//  PAPhotoArchivingTimelineView
//
//  Created by Tony Forsythe on 12/12/16.
//  Copyright © 2016 Tony Forsythe. All rights reserved.
//

import Foundation

postfix operator >||

extension CGSize {
    mutating func PASetBoth( dim : CGFloat ) {
        self.width = dim
        self.height = dim
    }
}
extension CGFloat {
    static postfix func >|| (left : CGFloat) -> CGSize {
        return CGSize(width: left, height: left)
    }
}

extension Double {
    static postfix func >|| (left : Double) -> CGSize {
        return CGSize(width: left, height: left)
    }
}

//
//  UIImage+Extensions.swift
//  pituku-ios-tes-2
//
//  Created by Ferry Julian on 12/11/23.
//

import Foundation
import Kingfisher

public extension UIImageView {
    func setImageUrl(urlPath: String){
        if let url = URL(string: urlPath) {
            self.kf.indicatorType = .activity
            self.kf.setImage(
                with: url
            )
        }
    }
}

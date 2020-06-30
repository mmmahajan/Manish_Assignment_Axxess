//
//  UIImageView+Extension.swift
//  Manish_Assignment_Axxess
//
//  Created by Manish Mahajan on 30/06/20.
//  Copyright © 2020 Manish Mahajan. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

extension UIImageView {
    
    //Download image in background
    func getImage(_ path: String, placeholderImage: String = "ic_noImage") {
        if URL(string: path) != nil {
            self.sd_setImage(with: URL(string: path), placeholderImage: UIImage(named: placeholderImage) , options:.refreshCached)
        }
    }
}

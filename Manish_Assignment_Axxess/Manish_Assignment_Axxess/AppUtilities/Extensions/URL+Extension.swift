//
//  URL+Extension.swift
//  Manish_Assignment_Axxess
//
//  Created by Manish Mahajan on 29/06/20.
//  Copyright © 2020 Manish Mahajan. All rights reserved.
//

import Foundation

extension URL {
    
    //App server base path
    static var base: String {
        return "https://raw.githubusercontent.com/AxxessTech/Mobile-Projects/master/challenge.json"
    }
    
    static var getData: URL? {
        return URL(string: base + "")
    }
}

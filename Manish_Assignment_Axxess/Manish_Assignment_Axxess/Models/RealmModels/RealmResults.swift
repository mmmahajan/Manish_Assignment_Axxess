//
//  RealmResults.swift
//  Manish_Assignment_Axxess
//
//  Created by Manish Mahajan on 30/06/20.
//  Copyright © 2020 Manish Mahajan. All rights reserved.
//

import Foundation
import RealmSwift

class RealmResults: Object {
    
    @objc private dynamic var resultData: Data? = nil
    
    var result: DataModel? {
        get {
            if let data = resultData {
                return try? JSONDecoder().decode(DataModel.self, from: data)
            }
            return nil
        }
        set {
            resultData = try? JSONEncoder().encode(newValue)
        }
    }
}

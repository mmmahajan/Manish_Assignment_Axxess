//
//  RealmService.swift
//  Manish_Assignment_Axxess
//
//  Created by Manish Mahajan on 28/06/20.
//  Copyright © 2020 Manish Mahajan. All rights reserved.
//

import Foundation
import RealmSwift

class RealmService {

    var realm: Realm?

    init(_ realm: Realm) {
        self.realm = realm
    }

    //Save data to Realm database
    func saveToRealm(object: DataModel) {
        try! realm?.write {
            //Add provided data
            let realmResults = RealmResults()
            realmResults.result = object
            realm?.add(realmResults)
        }
    }

    //Get data from realm database
    func getRealmData() -> Results<RealmResults>? {
        return realm?.objects(RealmResults.self)
    }
    
    //Delete existing data from database
    func deleteAllData() {
        try! realm?.write {
            realm?.deleteAll()
        }
    }
}

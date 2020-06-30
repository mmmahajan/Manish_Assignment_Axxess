//
//  DataSource.swift
//  Manish_Assignment_Axxess
//
//  Created by Manish Mahajan on 29/06/20.
//  Copyright © 2020 Manish Mahajan. All rights reserved.
//

import Foundation
import UIKit

class DataSource: GenericDataSource<DataModel>, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: (controller as! ViewController).cellId, for: indexPath) as! DataTableViewCell        
        if (controller as! ViewController).isSaveData {
            if let currentItem = (controller as! ViewController).realmRecords?[indexPath.row].result {
                cell.data = currentItem
            }
        } else {
            let currentItem = data.value[indexPath.row]
            cell.data = currentItem
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (controller as! ViewController).isSaveData {
            return (controller as! ViewController).realmRecords?.count ?? 0
        } else {
            return data.value.count
        }
    }
}

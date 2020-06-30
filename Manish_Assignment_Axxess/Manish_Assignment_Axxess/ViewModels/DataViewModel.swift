//
//  DataViewModel.swift
//  Manish_Assignment_Axxess
//
//  Created by Manish Mahajan on 29/06/20.
//  Copyright © 2020 Manish Mahajan. All rights reserved.
//

import Foundation
import UIKit

class DataViewModel {
    
    weak var dataSource : GenericDataSource<DataModel>?
    
    init(dataSource : GenericDataSource<DataModel>?, controller: UIViewController) {
        self.dataSource = dataSource
        self.dataSource?.controller = controller
    }
    
    //API call for random user data
    func getUsersData() {
        
        Webservice().load(resource: DataModel.getData, onView: self.dataSource?.controller.view) {[weak self] result in
            switch result {
            case .success(let data):
                print("API success")
                self?.dataSource?.data.value = data
            case .failure(let error):
                switch error {
                case .domainError:
                    self?.dataSource?.controller.showMessageWithAction(INTERNET_ISSUE, completion: { (_) in })
                case .decodingError:
                    self?.dataSource?.controller.showMessageWithAction(LOAD_AGAIN, completion: { (_) in })
                default:
                    break
                }
            }
        }
    }
}

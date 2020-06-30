//
//  ViewController.swift
//  Manish_Assignment_Axxess
//
//  Created by Manish Mahajan on 29/06/20.
//  Copyright © 2020 Manish Mahajan. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: BaseViewController {
    
    let dataSource = DataSource()
    lazy var viewModel: DataViewModel = {
        let viewModel = DataViewModel(dataSource: dataSource, controller: self)
        return viewModel
    }()
    let tableView = UITableView()
    let cellId = CELL_ID
    
    var realmService: RealmService?
    var realmRecords: Results<RealmResults>?
    var isSaveData: Bool = false {
        didSet {
            if isSaveData {
                if (self.realmRecords?.count ?? 0) > 0 {
                    tableView.reloadData()
                } else {
                    isSaveData = false
                    self.showMessageWithAction(NO_SAVED) { (_) in }
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupView()
        viewModel.getUsersData()
        
        realmService = RealmService(try! Realm())
        
        //On API data update success
        self.dataSource.data.addAndNotify(observer: self) { [weak self] _ in
            //Delete all data in realm
            self?.realmService?.deleteAllData()
            //Save data in relam
            for obj in self?.dataSource.data.value ?? [] {
                self?.realmService?.saveToRealm(object: obj)
            }
            self?.showMessageWithAction(SAVED_DB, completion: { (_) in })
            self?.tableView.reloadData()
        }
    }
    
    //Setup Navigation Bar
    func setupView() {
        setupTableView()
        
        let addButton = UIBarButtonItem(title: SAVED_LIST, style: .plain, target: self,
                                        action: #selector(getSavedData))
        let listButton = UIBarButtonItem(title: RELOAD, style: .plain, target: self,
                                         action: #selector(reloadData))
        
        addButton.tintColor = UIColor.FlatColor.PrimaryColor
        listButton.tintColor = UIColor.FlatColor.PrimaryColor
        navigationItem.rightBarButtonItem = addButton
        navigationItem.leftBarButtonItem = listButton
    }
    
    //Table view setup
    func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true        
        tableView.dataSource = self.dataSource
        tableView.separatorColor = nil        
        tableView.delegate = self
        
        title = "Records"
        tableView.register(DataTableViewCell.self, forCellReuseIdentifier: cellId)
    }
    
    @objc func getSavedData() {
        //Realm initialise and get data
        realmRecords = realmService?.getRealmData()
        isSaveData = true
    }
    
    @objc func reloadData() {
        isSaveData = false
        viewModel.getUsersData()
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailsViewController()
        vc.data = self.dataSource.data.value[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}

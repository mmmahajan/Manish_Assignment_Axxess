//
//  BaseViewController.swift
//  Manish_Assignment_Axxess
//
//  Created by Manish Mahajan on 30/06/20.
//  Copyright © 2020 Manish Mahajan. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    var safeArea: UILayoutGuide!
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        safeArea = view.layoutMarginsGuide
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.isTranslucent = false
        // Do any additional setup after loading the view.
    }
}

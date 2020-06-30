//
//  DetailsViewController.swift
//  Manish_Assignment_Axxess
//
//  Created by Manish Mahajan on 29/06/20.
//  Copyright © 2020 Manish Mahajan. All rights reserved.
//

import Foundation
import UIKit

class DetailsViewController: BaseViewController {
    
    var data: DataModel? {
        didSet {
            if let name = data?.id {
                idLabel.text = name
            }
            if let date = data?.date {
                dateLabel.text = date
            }
            if data?.type == "image" {
                infoLabel.isHidden = true
                dataImage.getImage(data?.data ?? "")                
            } else {
                dataImage.isHidden = true
                if let data = data?.data {
                    infoLabel.text = data
                }
            }            
        }
    }
    private let idLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.boldSystemFont(ofSize: 20)
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let dateLabel  : UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 14)
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var infoLabel : UITextView =  {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 16)
        textView.backgroundColor = UIColor.FlatColor.SecondaryColor
        return textView
    }()
    
    var dataImage: UIImageView =  {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = UIColor.FlatColor.SecondaryColor
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    //Setup view
    func setupView() {
        
        
        title = data?.id ?? "Details"
        
        view.addSubview(idLabel)
        view.addSubview(dateLabel)
        view.addSubview(infoLabel)
        view.addSubview(dataImage)
        
        //Constraint for views
        idLabel.anchor(top: self.view.topAnchor, left: self.view.leftAnchor, bottom: dateLabel.topAnchor, right: self.view.rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 8, paddingRight: 10, width: 0, height: 20, enableInsets: false)
        
        dateLabel.anchor(top: idLabel.bottomAnchor, left: self.view.leftAnchor, bottom: data!.type == "image" ? dataImage.topAnchor : infoLabel.topAnchor, right: self.view.rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 8, paddingRight: 10, width: 0, height: 20, enableInsets: false)
        
        infoLabel.anchor(top: dateLabel.bottomAnchor, left: self.view.leftAnchor, bottom: self.view.bottomAnchor, right: self.view.rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 8, paddingRight: 10, width: 0, height: 0, enableInsets: false)
        
        dataImage.anchor(top: dateLabel.bottomAnchor, left: self.view.leftAnchor, bottom: self.view.bottomAnchor, right: self.view.rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 8, paddingRight: 10, width: 0, height: 0, enableInsets: false)
    }
}

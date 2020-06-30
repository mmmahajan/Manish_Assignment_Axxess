//
//  DataTableViewCell.swift
//  Manish_Assignment_Axxess
//
//  Created by Manish Mahajan on 29/06/8.
//  Copyright © 88 Manish Mahajan. All rights reserved.
//

import UIKit

class DataTableViewCell: UITableViewCell {
    
    //on set cell will update
    var data: DataModel? {
        didSet {
            if let name = data?.id {
                idLabel.text = name
            }
            if let date = data?.date {
                dateLabel.text = date
            }
            if data?.type == "image" {
                infoLabel.text = ""
                dataImage.getImage(data?.data ?? "")
                self.flowHeightConstraint?.constant = 200
            } else {
                self.flowHeightConstraint?.constant = 0
                if let data = data?.data {
                    infoLabel.text = data
                }
            }
            self.layoutIfNeeded()
        }
    }
    var flowHeightConstraint: NSLayoutConstraint?
    private let idLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.boldSystemFont(ofSize: 20)
        return lbl
    }()
    
    private let dateLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 14)
        lbl.numberOfLines = 0
        return lbl
    }()
    
    var infoLabel: UILabel =  {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.textAlignment = .left
//        label.backgroundColor = UIColor.FlatColor.SecondaryColor
        return label
    }()
    
    var dataImage: UIImageView =  {
        let imageView = UIImageView()
        return imageView
    }()
    
    //Cell UI update
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(idLabel)
        addSubview(dateLabel)
        addSubview(infoLabel)
        addSubview(dataImage)
        
        //Constraint for cell views
        idLabel.anchor(top: topAnchor, left: leftAnchor, bottom: dateLabel.topAnchor, right: rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 8, paddingRight: 10, width: 0, height: 0, enableInsets: false)
        dateLabel.anchor(top: idLabel.bottomAnchor, left: leftAnchor, bottom: infoLabel.topAnchor, right: rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 8, paddingRight: 10, width: 0, height: 0, enableInsets: false)
        infoLabel.anchor(top: dateLabel.bottomAnchor, left: leftAnchor, bottom: dataImage.topAnchor, right: rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 8, paddingRight: 10, width: 0, height: 0, enableInsets: false)
        dataImage.anchor(top: infoLabel.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 8, paddingRight: 10, width: UIScreen.main.bounds.width, height: 200, enableInsets: false)
        //Adding height constraint for image for update dynamically
        flowHeightConstraint = dataImage.heightAnchor.constraint(equalToConstant: 200)
        flowHeightConstraint?.isActive = true
        
        // Add shadow on cell
        layer.shadowOpacity = 2
        layer.shadowRadius = 4
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowColor = UIColor.gray.cgColor
        
        selectionStyle = .none
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

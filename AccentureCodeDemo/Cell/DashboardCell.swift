//
//  DashboardCell.swift
//  AccentureCodeDemo
//
//  Created by AjeetZone on 08/04/20.
//  Copyright © 2020 AjeetZone. All rights reserved.
//

import UIKit

class DashboardCell: UITableViewCell {

    private let imgvw = UIImageView()
    private let lblTitle = UILabel()
    private let lblDescription = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imgvw.setRoundCornder(0.6, .black)
        lblTitle.font = UIFont.boldSystemFont(ofSize: 16)
        lblDescription.textColor = .darkGray
        lblTitle.lineBreakMode = NSLineBreakMode.byWordWrapping
        lblDescription.lineBreakMode = NSLineBreakMode.byWordWrapping
        lblTitle.numberOfLines = 0
        lblDescription.numberOfLines = 0
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(with item:Row) {
        lblTitle.text = item.title ?? "N/A"
        lblDescription.text = item.description ?? "N/A"
        
        if let strImgURL = item.imageHref {
            imgvw.setImageFromAlmofireURL(strImgURL: strImgURL, isShowIndicator: true, placeholderimg: Placeholder.noImage, completionHandler: { (isSuccess) in
                debugPrint("image Downloaded successfully")
            })

        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {

        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(imgvw)
        contentView.addSubview(lblTitle)
        contentView.addSubview(lblDescription)

        imgvw.translatesAutoresizingMaskIntoConstraints = false
        imgvw.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor).isActive = true
        imgvw.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor).isActive = true
        imgvw.leftAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leftAnchor).isActive = true
        imgvw.rightAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.rightAnchor).isActive = true
        let heightConstraint = imgvw.heightAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.widthAnchor, multiplier: 0.6)
        heightConstraint.priority = UILayoutPriority.defaultLow
        heightConstraint.isActive = true

        lblTitle.translatesAutoresizingMaskIntoConstraints = false
        lblTitle.topAnchor.constraint(equalTo: imgvw.safeAreaLayoutGuide.topAnchor).isActive = true
        lblTitle.leftAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leftAnchor).isActive = true
        lblTitle.rightAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.rightAnchor).isActive = true
        lblTitle.numberOfLines = 0

        lblDescription.translatesAutoresizingMaskIntoConstraints = false
        lblDescription.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor).isActive = true
        lblDescription.leftAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leftAnchor).isActive = true
        lblDescription.rightAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.rightAnchor).isActive = true
        lblDescription.bottomAnchor.constraint(equalTo: imgvw.safeAreaLayoutGuide.bottomAnchor).isActive = true
        lblDescription.numberOfLines = 0

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



//
//  DashboardCell.swift
//  AccentureCodeDemo
//
//  Created by AjeetZone on 08/04/20.
//  Copyright © 2020 AjeetZone. All rights reserved.
//

import UIKit

class DashboardCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.imageView?.setRoundCornder(0.6, .black)
        self.textLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        self.detailTextLabel?.textColor = .darkGray
        self.textLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        self.detailTextLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        self.textLabel?.numberOfLines = 0
        self.detailTextLabel?.numberOfLines = 0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(with item:Row) {
        self.textLabel?.text = item.title ?? "N/A"
        self.detailTextLabel?.text = item.description ?? "N/A"
        
        if let strImgURL = item.imageHref {
            self.imageView?.setImageFromAlmofireURL(strImgURL: strImgURL, isShowIndicator: true, placeholderimg: Placeholder.noImage, completionHandler: { (isSuccess) in
                debugPrint("image Downloaded successfully")
            })

        }
    }

}



//
//  DashboardCell.swift
//  AccentureCodeDemo
//
//  Created by AjeetZone on 08/04/20.
//  Copyright © 2020 AjeetZone. All rights reserved.
//

import UIKit

class DashboardCell: UITableViewCell {
    static let cellIdentifier = "DashboardCell"

    @IBOutlet weak var btnImage: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        btnImage.setRoundCornder(0.6, .black)

        lblTitle.lineBreakMode = NSLineBreakMode.byWordWrapping
        lblDesc.lineBreakMode = NSLineBreakMode.byWordWrapping
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(with item:Row) {
        lblTitle.text = item.title ?? "N/A"
        lblDesc.text = item.description ?? "N/A"
        
        if let strImgURL = item.imageHref {
            btnImage.setImageFromAlmofireURL(strImgURL: strImgURL, isShowIndicator: true, placeholderimg: UIImage(named: placeholderImg)) { (isSuccess) in
                debugPrint("image downloaded successfully.")
            }
        }
    }
}

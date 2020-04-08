//
//  Extension.swift
//  AccentureCodeDemo
//
//  Created by AjeetZone on 07/04/20.
//  Copyright © 2020 AjeetZone. All rights reserved.
//





import Foundation
import UIKit
import AlamofireImage



let placeholderImg = "person.circle.fill"


extension UIView {
    func setRoundCornder(_ borderWid:CGFloat = 1.0, _ borderClr:UIColor = .lightGray) {
        self.layer.masksToBounds = true
        self.clipsToBounds = true
        self.layer.cornerRadius = self.bounds.size.height / 2
        self.layer.borderColor = borderClr.cgColor
        self.layer.borderWidth = borderWid
    }
    
}

extension UIButton {
    func setImageFromAlmofireURL(strImgURL:String, isShowIndicator:Bool = false, placeholderimg:UIImage? = UIImage(named: placeholderImg), completionHandler:(_ success:Bool) -> () ) {
        
        let activityIndicator = UIActivityIndicatorView()
        if isShowIndicator {
            self.layoutIfNeeded()
            activityIndicator.color = .black
            activityIndicator.hidesWhenStopped = true
            self.addSubview(activityIndicator)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                activityIndicator.center = CGPoint(x: self.bounds.width / 2, y: self.bounds.height / 2)
                activityIndicator.startAnimating()
            }
        }
        
        guard let url = URL(string: strImgURL) else {return}
        
        self.af_setImage(for: .normal, url: url, placeholderImage: placeholderimg, filter: nil, progress: nil, progressQueue: DispatchQueue.main) { (imgData) in
            if (isShowIndicator && imgData != nil) {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
                    activityIndicator.stopAnimating()
                })
            }
        }
        
    }
    
    func showSpinnerInMiddle(upto timeDuration:TimeInterval) {
        self.setImage(UIImage(named: placeholderImg), for: .normal)
        
        let activityIndicator = UIActivityIndicatorView()
        self.layoutIfNeeded()
        activityIndicator.color = .black
        activityIndicator.hidesWhenStopped = true
        self.addSubview(activityIndicator)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            activityIndicator.center = CGPoint(x: self.bounds.width / 2, y: self.bounds.height / 2)
            activityIndicator.startAnimating()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + timeDuration, execute: {
            activityIndicator.stopAnimating()
        })
        
    }
    
}



//
//  DashboardViewModel.swift
//  AccentureCodeDemo
//
//  Created by AjeetZone on 07/04/20.
//  Copyright © 2020 AjeetZone. All rights reserved.
//

import UIKit



protocol DashboardDelegate: class {
    func getResponse()
    func updateView()
}

extension DashboardDelegate {
    func getResponse() {}
    func updateView() {}
}


class DashboardViewModel: NSObject {
    static var shared = DashboardViewModel()
    weak var delegate:DashboardDelegate?
    
    var refreshCtrl = UIRefreshControl()
    var canadaInfoModel = CanadaInfo()
    let dispatchGrp = DispatchGroup()
    
    
    override init() {
        super.init()
    }
    
    func apiCallForDashboard(_ isShowLoader:Bool, completionHandler:@escaping(_ success:Bool) -> Void) {
        if isShowLoader {
            Helper.sharedInstance.showLoader()
        }
        
        dispatchGrp.enter()
        
        APIManager.shared.getCanadaInfo { (result) in
            if result != nil {
                
                self.canadaInfoModel = result
                completionHandler(true)
                
            } else {

                completionHandler(false)
                
            }
            
        }
            
            
        self.dispatchGrp.leave()
        
        dispatchGrp.notify(queue: .main) {
            if isShowLoader {
                Helper.sharedInstance.hideLoader()
            }
            
            self.delegate?.updateView()
        }
    }
}

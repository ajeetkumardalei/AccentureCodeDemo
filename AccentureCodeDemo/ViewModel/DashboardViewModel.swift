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
    
    var canadaInfoModel = CanadaInfo()
    let dispatchGrp = DispatchGroup()
    
    
    override init() {
        super.init()
    }
    
    func apiCallForDashboard(_ isShowLoader:Bool, completionHandler:@escaping(_ success:Bool) -> Void) {
        dispatchGrp.enter()

        APIManager.shared.getCanadaInfo { (result) in
            self.canadaInfoModel = result
            completionHandler(true)
        }
            
        self.dispatchGrp.leave()
        
        dispatchGrp.notify(queue: .main) {
            
            self.delegate?.updateView()
        }
    }
}

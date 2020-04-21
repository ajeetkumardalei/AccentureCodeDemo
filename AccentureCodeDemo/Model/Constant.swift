//
//  Constant.swift
//  AccentureCodeDemo
//
//  Created by AjeetZone on 07/04/20.
//  Copyright © 2020 AjeetZone. All rights reserved.
//



import Foundation
import UIKit


struct Constant {
    struct SERVER {
        static let baseURL = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"
    }
    
}



struct NetWorkManager {
    static let nonetworkMessage = "Offline! Please check your internet connection"
}

struct CellManager {
    static let cellIdentifier = "DashboardCell"
}

struct Placeholder {
    static let imgName = "noimage"
    static let noImage = UIImage(named: imgName)
}



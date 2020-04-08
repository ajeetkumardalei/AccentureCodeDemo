//
//  Model.swift
//  AccentureCodeDemo
//
//  Created by AjeetZone on 07/04/20.
//  Copyright © 2020 AjeetZone. All rights reserved.
//

import Foundation


/*
 {
   "title": "About Canada",
   "rows": [
     {
       "title": "Beavers",
       "description": "Beavers are second only to humans in their ability to manipulate and change their environment. They can measure up to 1.3 metres long. A group of beavers is called a colony",
       "imageHref": "http://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/American_Beaver.jpg/220px-American_Beaver.jpg"
     },
     {
       "title": "Flag",
       "description": null,
       "imageHref": "http://images.findicons.com/files/icons/662/world_flag/128/flag_of_canada.png"
     },
    ]
 }
 */

struct CanadaInfo: Codable {
    var title: String?
    var rows: [Row]?
}

struct Row: Codable {
    var title:String?
    var description:String?
    var imageHref:String?
    
//    private enum CodingKeys: String, CodingKey {
//        case title
//        case description
//        case imageHref
//    }
    
//    init(from decoder: Decoder) throws{
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//            title = try container.decode(String.self, forKey: .title)
//            description = try container.decode(String.self, forKey: .description)
//            imageHref = try container.decode(String.self, forKey: .imageHref)
//    }

}



//
//  GamesModel.swift
//  TestSearch
//
//  Created by Mario Azevedo on 03/02/2020.
//  Copyright © 2020 AppWeleuc Inc. All rights reserved.
//

import UIKit


class GamesModel: NSObject {
    
    let nameLL:String
    let sectionLL:String
    
    let icon: String
    let imageURls: [String]
    let signedImage = "https://api.appweleux.com/AppWeleux/App/Sections/Signed"
    
    init(appName:String,section:String, icon:String, images:[String]) {
        self.nameLL = appName
        self.sectionLL = section
        self.imageURls = images
        self.icon = icon
    }
}


class ModelFactory {
    
    static func create() -> [GamesModel] {
        
        var modelAry = [GamesModel]()
        
        let pubgImages = [
            "https://content.appweleux.com/AppWeleux/Sections/Games-Hacked/Screenshots/pubg1",
            "https://content.appweleux.com/AppWeleux/Sections/Games-Hacked/Screenshots/pubg2",
            "https://content.appweleux.com/AppWeleux/Sections/Games-Hacked/Screenshots/pubg3"
        ]
        
        modelAry.append(GamesModel(appName: "Pubg Mobile",
                                   section: "Games",
                                   icon: "https://content.appweleux.com/AppWeleux/Sections/Games-Hacked/Icons/pubg",
                                   images: pubgImages))
        
        
        let codImages = [
            "https://content.appweleux.com/AppWeleux/Sections/Games-Hacked/Screenshots/call-of-duty1",
            "https://content.appweleux.com/AppWeleux/Sections/Games-Hacked/Screenshots/call-of-duty2",
            "https://content.appweleux.com/AppWeleux/Sections/Games-Hacked/Screenshots/call-of-duty3"
        ]
        
        modelAry.append(GamesModel(appName: "Call of Duty",
                                   section: "Games",
                                   icon: "https://content.appweleux.com/AppWeleux/Sections/Games-Hacked/Icons/call-of-duty",
                                   images: codImages))
        
        let pollImages = [
            "https://content.appweleux.com/AppWeleux/Sections/Games-Hacked/Screenshots/8-ball-pool1",
            "https://content.appweleux.com/AppWeleux/Sections/Games-Hacked/Screenshots/8-ball-pool2",
            "https://content.appweleux.com/AppWeleux/Sections/Games-Hacked/Screenshots/8-ball-pool3"
        ]
        
        modelAry.append(GamesModel(appName: "8 Ball Poll",
                                   section: "Games",
                                   icon: "https://content.appweleux.com/AppWeleux/Sections/Games-Hacked/Icons/8ballpool",
                                   images: pollImages))
        
        return modelAry
    }
}



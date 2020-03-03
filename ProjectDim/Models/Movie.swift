//
//  Movie.swift
//  ProjectDim
//
//  Created by  on 03/03/2020.
//  Copyright © 2020 Yannick VERON. All rights reserved.
//

import Foundation
import UIKit

enum Category : String{
    case Action="Action"
}

struct Movie {
    var title : String
    var subtitle : String
    var realeaseDate : Date
    var duration : Int //duration in minutes
    var categories : [Category]
    var synopsis : String
    var poster : UIImage
    var banner : UIImage
    
    func humanReadableDuration()-> String{
        if duration<60{
            return "\(duration) mn"
        }
        let (hours, minutes) = duration.quotientAndRemainder(dividingBy: 60)
        return "\(hours) h \(minutes) mn"
    }
    func categoriesString()->String{
        return categories.map({(cat) -> String in
            return cat.rawValue
        }).joined(separator: " ")
    }
}


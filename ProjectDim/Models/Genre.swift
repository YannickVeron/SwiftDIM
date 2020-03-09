//
//  Genre.swift
//  ProjectDim
//
//  Created by  on 05/03/2020.
//  Copyright © 2020 Yannick VERON. All rights reserved.
//

import Foundation

struct Genre : Decodable{
    var id:Int
    var name:String
    
    init?(response : GenreResponse){
        guard let responseId = response.id,let responseName = response.name else {
            return nil
        }
        id=responseId
        name=responseName
    }
}

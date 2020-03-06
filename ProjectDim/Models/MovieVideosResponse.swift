//
//  MovieVideoResponse.swift
//  ProjectDim
//
//  Created by  on 06/03/2020.
//  Copyright © 2020 Yannick VERON. All rights reserved.
//

import Foundation

struct MovieVideosResponse : Decodable {
    var id: Int?
    var results: [MovieVideoResponse]?
}

struct MovieVideoResponse : Decodable {
    var id : String?
    /*var iso_639_1: String?
    var iso_3166_1: String?*/
    var key : String?
    var name : String?
    var site : String?
    var size : Int?
    var type : String?
}

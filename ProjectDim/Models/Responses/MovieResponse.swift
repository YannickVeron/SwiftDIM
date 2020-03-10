//
//  MovieRequest.swift
//  ProjectDim
//
//  Created by  on 05/03/2020.
//  Copyright © 2020 Yannick VERON. All rights reserved.
//

import Foundation

struct MovieResponse : Decodable {
    var popularity:Float?
    var voteCount:Int?
    var video:Bool?
    var posterPath:String?
    var id:Int?
    var adult:Bool?
    var backdropPath:String?
    var originalLanguage:String?
    var originalTitle:String?
    var genreIds:[Int]?
    var title:String?
    var voteAverage:Float?
    var overview:String?
    var releaseDate:String?
}

//
//  MovieDetailResponse.swift
//  ProjectDim
//
//  Created by  on 05/03/2020.
//  Copyright © 2020 Yannick VERON. All rights reserved.
//

import Foundation

struct MovieDetailResponse : Decodable{
    var adult : Bool?
    var backdropPath : String?
    //var belongs_to_collection : //obj?,
    var budget : Int?
    var genres : [Genre]?
    var homepage: String?
    var id: Int?
    var imdbId: String?
    var originalLanguage: String?
    var originalTitle: String?
    var overview: String?
    var popularity: Float
    var posterPath: String?
    //var production_companies: //[obj]
    //var production_countries: //[obj]
    var releaseDate: String?
    var revenue: Int?
    var runtime: Int?
    //var spoken_languages : // [obj]
    var status: String?
    var tagline: String?
    var title: String?
    var video: Bool?
    var voteAverage: Float?
    var voteCount: Int?
}

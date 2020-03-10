//
//  Request.swift
//  ProjectDim
//
//  Created by  on 05/03/2020.
//  Copyright © 2020 Yannick VERON. All rights reserved.
//

import Foundation

struct MoviesResponse : Decodable{
    var page: Int?
    var totalResults: Int?
    var totalPages: Int?
    var results : [MovieResponse]?
}

//
//  GenreResponse.swift
//  ProjectDim
//
//  Created by  on 09/03/2020.
//  Copyright © 2020 Yannick VERON. All rights reserved.
//

import Foundation

struct GenresResponse: Decodable {
    var genres : [GenreResponse]?
}
struct GenreResponse: Decodable {
    var id: Int?
    var name: String?
}

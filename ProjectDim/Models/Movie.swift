//
//  Movie.swift
//  ProjectDim
//
//  Created by  on 03/03/2020.
//  Copyright © 2020 Yannick VERON. All rights reserved.
//

import Foundation
import UIKit

enum imageType {
    case backdrop
    case poster
}

struct Movie {
    
    var title : String
    var subtitle : String
    var releaseDate : Int
    var duration : Int //duration in minutes
    var synopsis : String
    var poster : String?
    var banner : String?
    var trailerURL: URL?
    var id: Int?
    var genres: [Genre]?
    
    /*init(title: String, subtitle: String, realeaseDate: Int, duration: Int, categories: [Category], synopsis: String,poster: String? , banner: String, trailerURL: URL?){
        self.title=title
        self.subtitle=subtitle
        self.releaseDate=realeaseDate
        self.duration=duration
        self.synopsis=synopsis
        self.poster=poster
        self.banner=banner
        self.trailerURL=trailerURL
    }*/
    
    init?(response : MovieResponse){
        let _url = URL(string: "https://youtu.be/bD7bpG-zDJQ")
        let dateFormater=DateFormatter()
        dateFormater.dateFormat = "yyyy-MM-dd"
        guard let responseTitle = response.title,let responseOverview = response.overview,let url = _url,let dateString=response.releaseDate, let date=dateFormater.date(from: dateString), let responseId = response.id, let responsePoster=response.posterPath, let responseBackdrop=response.backdropPath else {
            return nil
        }
        dateFormater.dateFormat="yyyy"
        title=responseTitle
        subtitle=""
        releaseDate=Int(dateFormater.string(from: date))! //TODO : remove force cast
        duration=0
        synopsis=responseOverview
        poster=responsePoster
        banner=responseBackdrop
        trailerURL=url
        id=responseId
    }
    
    init?(response : MovieDetailResponse){
        let dateFormater=DateFormatter()
        dateFormater.dateFormat = "yyyy-MM-dd"
        guard let responseTitle = response.title,let responseOverview = response.overview,let dateString=response.releaseDate, let date=dateFormater.date(from: dateString), let responseId = response.id, let responsePoster=response.posterPath, let responseBackdrop=response.backdropPath, let responseRuntime = response.runtime, let responseGenres = response.genres else {
            return nil
        }
        dateFormater.dateFormat="yyyy"
        title=responseTitle
        subtitle=""
        releaseDate=Int(dateFormater.string(from: date))! //TODO : remove force cast
        duration=responseRuntime
        synopsis=responseOverview
        poster=responsePoster
        banner=responseBackdrop
        id=responseId
        genres=responseGenres
    }
    
    func humanReadableDuration()-> String{//function
        if duration<60{
            return "\(duration) mn"
        }
        let (hours, minutes) = duration.quotientAndRemainder(dividingBy: 60)
        return "\(hours) h \(minutes) mn"
    }
    var categoriesString : String{//Computed Property - cannot be let
        if let genres = genres{
            return genres.map({(genre) -> String in
                if let name = genre.name{
                    return name
                }else{return ""}
                }).joined(separator: "/")
        }
        return ""
    }
}

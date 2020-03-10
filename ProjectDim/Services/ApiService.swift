//
//  ApiService.swift
//  ProjectDim
//
//  Created by  on 05/03/2020.
//  Copyright © 2020 Yannick VERON. All rights reserved.
//

import Foundation
import UIKit

class APIService {
    static let API_KEY:String = "bc1c540985c64209509d0beaecc09fa5"
    static let base_url:String = "https://api.themoviedb.org/3"
    static let img_base_url:String = "https://image.tmdb.org/t/p/"
    static let language:String = "fr-FR"
    
    static func discoverRequest(page :Int=1,genres:[Int]?=nil, completionHandler: @escaping (_ moviesResponse:MoviesResponse)->Void){
        var urlStr = "\(base_url)/discover/movie?language=\(language)&sort_by=popularity.desc&include_adult=false&include_video=false&page=\(page)"
        if let genresList = genres {
            urlStr+="&with_genres=\(genresList.map{String($0)}.joined(separator:","))"
        }
        urlStr+="&api_key=\(API_KEY)"
        
        if let url = URL(string:urlStr){
            URLSession.shared.dataTask(with: url){(data,response,error) in
                guard error==nil else {
                    //TODO : handle error
                    return
                }
                if let data=data{
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let moviesResponse:MoviesResponse? = try? decoder.decode(MoviesResponse.self, from: data)//Decode the response to a MovieResponse
                    if let moviesResponse = moviesResponse{
                        completionHandler(moviesResponse)
                    }
                }
                return
            }.resume()
        }
    }
    
    static func imageRequest(type:imageType,path:String,completionHandler: @escaping (_ img: UIImage?)->Void){
        let sizes:[imageType:String] = [imageType.backdrop:"w780",imageType.poster:"w500"]
        guard let size = sizes[type] else {
            return
        }
        if let url = URL(string: "\(self.img_base_url)\(size)\(path)"){
            URLSession.shared.dataTask(with: url){(data,response,error) in
                guard error==nil else {
                    //TODO : handle error
                    return
                }
                if let data=data{
                    completionHandler(UIImage(data:data))
                }
                return
            }.resume()
        }
        
    }
    
    static func movieDetailRequest(movieId:Int, completionHandler:@escaping (_ movieDetailResponse:MovieDetailResponse?)->Void){
        if let url = URL(string:"\(self.base_url)/movie/\(movieId)?language=\(language)&api_key=\(self.API_KEY)"){
            URLSession.shared.dataTask(with:url){(data,response,error) in
                guard error==nil else {
                    //TODO : handle error
                    return
                }
                if let data=data{
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let movieDetailResponse:MovieDetailResponse? = try? decoder.decode(MovieDetailResponse.self, from: data)
                    if let movieDetailResponse = movieDetailResponse{
                        completionHandler(movieDetailResponse)
                    }
                }
                return
            }.resume()
        }
    }
    
    static func videosRequest(movieId:Int,completionHandler: @escaping (_ movieVideosResponse:MovieVideosResponse?)->Void){
        if let url = URL(string: "\(self.base_url)/movie/\(movieId)/videos?api_key=\(self.API_KEY)"){
            URLSession.shared.dataTask(with: url){(data,response,error) in
                guard error==nil else{
                    //TODO Handle error
                    return
                }
                if let data=data{
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let movieVideosResponse:MovieVideosResponse?=try? decoder.decode(MovieVideosResponse.self, from: data)
                    if let movieVideosResponse = movieVideosResponse{
                        completionHandler(movieVideosResponse)
                    }
                }
            }.resume()
        }
    }
    
    static func genresRequest(completionHandler: @escaping (_ genresResponse:GenresResponse)->Void){
        if let url = URL(string: "\(self.base_url)/genre/movie/list?api_key=\(self.API_KEY)&language=\(language)"){
            URLSession.shared.dataTask(with: url){(data,response,error) in
                guard error==nil else{
                    //TODO Handle error
                    return
                }
                if let data=data{
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let genresResponse:GenresResponse?=try? decoder.decode(GenresResponse.self, from: data)
                    if let genresResponse = genresResponse{
                        completionHandler(genresResponse)
                    }
                }
            }.resume()
        }
    }
}

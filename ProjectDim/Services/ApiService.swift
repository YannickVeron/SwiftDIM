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
    //static let stringUrl = base_url+"/movie/550?api_key="+API_KEY
    
    static func makeRequest(request :String, completionHandler: @escaping (_ moviesResponse:MoviesResponse)->Void){
        if let url = URL(string: base_url+request+"api_key="+API_KEY){
            URLSession.shared.dataTask(with: url){(data,response,error) in
                guard error==nil else {
                    //TODO : handle error
                    return
                }
                if let data=data{
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let moviesResponse:MoviesResponse? = try? decoder.decode(MoviesResponse.self, from: data)
                    print(moviesResponse?.totalResults)
                    print(moviesResponse?.results?[0])
                    //return response?.results
                    if let moviesResponse = moviesResponse{
                        completionHandler(moviesResponse)
                    }
                }
                return
            }.resume()
        }
    }
    
    static func imageRequest(type:imageType,path:String,completionHandler: @escaping (_ img: UIImage?)->Void){
        let sizes:[imageType:String] = [imageType.backdrop:"w300",imageType.poster:"w500"]
        guard let size = sizes[type] else {
            return
        }
        if let url = URL(string: self.img_base_url+size+path){
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
        if let url = URL(string:"\(self.base_url)/movie/\(movieId)?api_key=\(self.API_KEY)"){
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
}

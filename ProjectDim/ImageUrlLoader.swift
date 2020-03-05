//
//  ImageUrlLoader.swift
//  ProjectDim
//
//  Created by  on 04/03/2020.
//  Copyright © 2020 Yannick VERON. All rights reserved.
//
import UIKit

extension UIImageView {
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()//retrive contents of a url and call competion handler with result
            //session is suspended when created use .resume() to start it
    }
    
    func load(url: URL) {
        getData(from: url) { data, response, error in//completion closure
            guard let data = data, error == nil else { return }//if no data or error return nil
            DispatchQueue.main.async() {//queue the image update on the main thread
                self.image = UIImage(data: data)
            }
        }
    }
}


/*
 if let data = data{
    let sData = String(decoding:data, as : UTF8.self)
    print(sData)
 }
 
 
 codable
 let json = "{\"id\":28,\"name\":\"Action\"}"
 let data = Data(json.utf8)//auto
 JSONDecoder().decode(Genre.self, from: data)
 */

//MARK:- URLSessio + Codable
/*let url = URL(string:"someURL")!
URLSession.shared.dataTask(with: url){(data,response,error) in
    guard error==nil else {
        //TODO : handle error
        return
    }
    if let data=data{
        let genre = try? JSONDecoder().decode(Genre.self, from: data)
        print(genre?.name)
    }
    return
}.resume()
*/

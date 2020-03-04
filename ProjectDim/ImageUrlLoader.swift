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

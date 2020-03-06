//
//  ViewController.swift
//  ProjectDim
//
//  Created by  on 03/03/2020.
//  Copyright © 2020 Yannick VERON. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieSubTitle: UILabel!
    @IBOutlet weak var banner: UIImageView!
    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var duration: UILabel!
    @IBOutlet weak var categories: UILabel!
    @IBOutlet weak var synopsis: UITextView!
    
    var movieId : Int!
    var currentMovie : Movie?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadDetail()
    }
    @IBAction func playTrailer(_ sender: Any) {
        APIService.videosRequest(movieId: movieId){movieVideosResponse in
            guard let response = movieVideosResponse, let videos = response.results else{
                return
            }
            let trailer = videos.filter {(video) -> Bool in
                return video.type=="Trailer"&&video.site=="YouTube"
            }.first
            if let trailer=trailer, let trailerURL = trailer.key, let url = URL(string:"https://www.youtube.com/watch?v=\(trailerURL)") {
                DispatchQueue.main.async {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                }
            }
        }
    }
    
    func loadDetail(){
        APIService.movieDetailRequest(movieId: movieId){movieDetailResponse in//use guard
            guard let result = movieDetailResponse, let movie = Movie(response: result) else {
                return
            }
            if let posterPath = movie.poster{//to function
                self.loadImage(type: imageType.poster, path: posterPath)
            }
            if let bannerPath = movie.banner{
                self.loadImage(type: imageType.backdrop, path: bannerPath)
            }
            self.currentMovie=movie
            DispatchQueue.main.async() {//queue the update on the main thread
                self.movieTitle.text=movie.title
                self.movieSubTitle.text=movie.subtitle
                self.releaseDate.text=String(movie.releaseDate)
                self.duration.text=movie.humanReadableDuration()
                self.categories.text = movie.categoriesString
                self.synopsis.text=movie.synopsis
            }
        }
    }
    func loadImage(type: imageType, path:String){
        let imageViews : [imageType:UIImageView] = [imageType.backdrop:self.banner,imageType.poster:self.poster]
        APIService.imageRequest(type: type, path: path){img in
            if let image = img {
                DispatchQueue.main.async() {//queue the image update on the main thread
                    if let imageView = imageViews[type]{
                        imageView.image=image
                    }
                }
            }
        }
    }
}

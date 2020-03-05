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
    
    //var currentMovie : Movie? = Movie.getMovie()
    var movieId : Int?
    var currentMovie : Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let id = movieId{
            APIService.movieDetailRequest(movieId: id){movieDetailResponse in
                if let result = movieDetailResponse{
                    if let movie = Movie(response: result){
                        self.currentMovie=movie
                    }
                }
            }
            
        /*APIService.makeRequest(request:"/discover/movie?language=fr-FR&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&"){moviesResponse in
                print(moviesResponse)
            if let results = moviesResponse.results{
                    for response:MovieResponse in results{
                        if let movie = Movie(response: response){
                            self.movies.append(movie)
                            DispatchQueue.main.async() {//queue the image update on the main thread
                                self.tableView.reloadData()
                            }
                        }
                    }
                }
            }*/
        }
        
        if let movie = currentMovie/*, let posterUrl = URL(string: "https://www.closeupshop.fr/media/oart_0/oart_s/oart_88600/thumbs/897264_2448775.jpg")*/{
            movieTitle.text=movie.title
            movieSubTitle.text=movie.subtitle
            /*banner.image=movie.banner
            poster.image=movie.poster*/
            //poster.load(url:posterUrl)
            releaseDate.text=String(movie.releaseDate)
            duration.text=movie.humanReadableDuration()
            categories.text = movie.categoriesString
            synopsis.text=movie.synopsis
        }
    }
    @IBAction func playTrailer(_ sender: Any) {
        if let movie=currentMovie{
            UIApplication.shared.open(movie.trailerURL, options: [:], completionHandler: nil)
        }
    }
}

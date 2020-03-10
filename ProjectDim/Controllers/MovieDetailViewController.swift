//
//  ViewController.swift
//  ProjectDim
//
//  Created by  on 03/03/2020.
//  Copyright © 2020 Yannick VERON. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieSubTitle: UILabel!
    @IBOutlet weak var banner: UIImageView!
    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var duration: UILabel!
    @IBOutlet weak var categories: UILabel!
    @IBOutlet weak var synopsis: UITextView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var playButton: UIButton!
    
    @IBOutlet weak var releaseDateLbl: UILabel!
    @IBOutlet weak var durationLbl: UILabel!
    @IBOutlet weak var synopsisLbl: UILabel!
    
    var movieId : Int!
    var currentMovie : Movie?
    var textContainers : [UIView]?

    override func viewDidLoad() {
        super.viewDidLoad()
        textContainers = [self.movieTitle,self.movieSubTitle,self.releaseDate,self.duration,self.categories,self.synopsis,self.containerView,self.releaseDateLbl,self.durationLbl,self.synopsisLbl,self.scrollView,self.playButton]
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
            if let posterPath = movie.poster{
                self.loadImage(type: imageType.poster, path: posterPath)
            }
            if let bannerPath = movie.banner{
                self.loadImage(type: imageType.backdrop, path: bannerPath,text:self.synopsis)
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
    func loadImage(type: imageType, path:String,text:UITextView?=nil){
        let imageViews : [imageType:UIImageView] = [imageType.backdrop:self.banner,imageType.poster:self.poster]
        APIService.imageRequest(type: type, path: path){img in
            guard let image = img, let imageView = imageViews[type] else {
                return
            }
            DispatchQueue.main.async() {//queue the image update on the main thread
                imageView.image=image
                if type==imageType.backdrop, let avgColor = image.averageColor(areaSize: 0.1), let textContainers = self.textContainers{
                    imageView.backgroundColor=avgColor
                    let bgColor = avgColor.contrastColor()
                    for view: UIView in textContainers{
                        if let lbl = view as? UILabel{
                            lbl.textColor=avgColor
                        }else if let txtView = view as? UITextView{
                            txtView.textColor=avgColor
                        }else if let btn = view as? UIButton{
                            btn.backgroundColor = avgColor
                            btn.setTitleColor(bgColor, for: UIControl.State.normal)
                        }else{
                            view.backgroundColor=bgColor
                        }
                    }
                }
            }
        }
    }
}

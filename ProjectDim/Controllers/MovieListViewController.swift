//
//  MovieListViewController.swift
//  ProjectDim
//
//  Created by  on 04/03/2020.
//  Copyright © 2020 Yannick VERON. All rights reserved.
//

import UIKit

class MovieListViewController:UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var genreLb: UILabel!
    
    let cellID="MovieCellID"
    let detailVCID="openDetail"
    var genre : Genre!
    var movies : [Movie] = []
    var selectedMovie : Movie?
    var imagesDict : [String:UIImage] = [:]
    var page : (current:Int,total:Int) = (current:1,total:1)

    override func viewDidLoad() {
        super.viewDidLoad()
        loadMovies(page:page.current,genres: [genre?.id])
        genreLb.text=genre.name
            
        tableView.delegate=self
        tableView.dataSource=self
        tableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: cellID)
        tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let loadingOffset = 2//load next batch of movie before user reach bottom
        if indexPath.row>(movies.count-1)-loadingOffset && page.current<page.total{
            page.current+=1
            loadMovies(page:page.current,genres: [genre?.id])
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! MovieTableViewCell
        let movie = movies[indexPath.row]
        cell.firstLb.text=movie.title
        cell.secondLb.text=movie.subtitle
        cell.synopsis.text=movie.synopsis
        cell.releaseDate.text=String(movie.releaseDate)
        cacheManager(cell,movie)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        if movies.count>indexPath.row, let id = movies[indexPath.row].id{
            self.performSegue(withIdentifier: detailVCID, sender: id)
        }
    }
    @IBAction func closeList(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier==detailVCID{
            if let destinationVC = segue.destination as? MovieDetailViewController,let id = sender as? Int{
                destinationVC.movieId=id
            }
        }
    }
    
    func cacheManager(_ cell:MovieTableViewCell,_ movie:Movie){
        if let posterURL = movie.poster{//hasPoster
            if self.imagesDict[posterURL] == nil{//cache
                APIService.imageRequest(type: imageType.poster, path: posterURL){img in
                    if let image = img {
                        DispatchQueue.main.async() {//queue the image update on the main thread
                            self.imagesDict[posterURL]=image
                            cell.poster.image=image
                        }
                    }
                }
            }else if let image = self.imagesDict[posterURL]{
                cell.poster.image=image
            }
        }
    }
    
    func loadMovies(page: Int=1,genres:[Int?]){
        let genreClean = genres.compactMap { $0 }
        APIService.discoverRequest(page:page, genres:genreClean){moviesResponse in
            if let totalPages = moviesResponse.totalPages{
                self.page.total=totalPages
            }
            if let results = moviesResponse.results{
                for response:MovieResponse in results{
                    if let movie = Movie(response: response){
                        self.movies.append(movie)
                    }
                }
                DispatchQueue.main.async() {//queue the movies update on the main thread
                    self.tableView.reloadData()
                }
            }
        }
    }
}

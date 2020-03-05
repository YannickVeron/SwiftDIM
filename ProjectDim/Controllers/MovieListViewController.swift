//
//  MovieListViewController.swift
//  ProjectDim
//
//  Created by  on 04/03/2020.
//  Copyright © 2020 Yannick VERON. All rights reserved.
//

import UIKit

class MovieListViewController:/*UINavigationController*/UIViewController, UITableViewDelegate,UITableViewDataSource {
    //@IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var tableView: UITableView!
    let cellID="MovieCellID"
    var movies : [Movie] = []
    var selectedMovie : Movie?

    override func viewDidLoad() {
        super.viewDidLoad()
        

        /*let API_KEY = "bc1c540985c64209509d0beaecc09fa5"
        let base_url = "https://api.themoviedb.org"
        var stringUrl = base_url+"/3/movie/550?api_key="+API_KEY
        stringUrl = "https://api.themoviedb.org/3/discover/movie?api_key=bc1c540985c64209509d0beaecc09fa5&language=fr-FR&sort_by=popularity.desc&include_adult=false&include_video=false&page=1"
        let url = URL(string:stringUrl)!
        URLSession.shared.dataTask(with: url){(data,response,error) in
            guard error==nil else {
                //TODO : handle error
                return
            }
            if let data=data{
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let response:MoviesResponse? = try? decoder.decode(MoviesResponse.self, from: data)
                print(response?.totalResults)
                print(response?.results?[0])
            }
            return
        }.resume()*/
        movies.removeAll()
    APIService.makeRequest(request:"/discover/movie?language=fr-FR&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&"){moviesResponse in
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
        }
            
        
            
        
        
        
        tableView.delegate=self
        tableView.dataSource=self
        
        tableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: cellID)
        
        tableView.reloadData()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! MovieTableViewCell
        let movie = movies[indexPath.row]
        cell.firstLb.text=movie.title
        cell.secondLb.text=movie.subtitle
        //cell.poster.image=movie.poster
        cell.synopsis.text=movie.synopsis
        cell.releaseDate.text=String(movie.releaseDate)
        if let poster = movie.poster{
            APIService.imageRequest(type: imageType.poster, path: poster){img in
                if let image = img {
                    DispatchQueue.main.async() {//queue the image update on the main thread
                        cell.poster.image=image
                    }
                }
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        selectedMovie=movies[indexPath.row]
        self.performSegue(withIdentifier: "openDetail", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier=="openDetail"{
            if let destinationVC  = segue.destination as? ViewController{
                //destinationVC.currentMovie = selectedMovie
                destinationVC.movieId=selectedMovie?.id
            }
        }
    }
}

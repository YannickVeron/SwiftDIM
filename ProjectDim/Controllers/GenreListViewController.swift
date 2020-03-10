//
//  GenreListViewController.swift
//  ProjectDim
//
//  Created by  on 09/03/2020.
//  Copyright © 2020 Yannick VERON. All rights reserved.
//

import UIKit

class GenreListViewController:UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var genreCollectionView: UICollectionView!
    @IBOutlet weak var collectionViewFlowLayout: UICollectionViewFlowLayout!
    
    let cellID : String = "GenreCellID"
    let movieListVCID : String = "openMovieList"
    var genres : [Genre] = []
    
    override func viewDidLoad() {
        genreCollectionView.register(UINib(nibName: "GenreCollectionViewCell", bundle: nil),forCellWithReuseIdentifier: cellID)
        
        APIService.genresRequest(){genresResponse in
            if let genres = genresResponse.genres{
                for response:GenreResponse in genres{
                    if let genre = Genre(response: response){
                        self.genres.append(genre)
                    }
                }
                DispatchQueue.main.async() {//queue the image update on the main thread
                    self.genreCollectionView.reloadData()
                }
            }
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // flow layout have all the important info like spacing, inset of collection view cell, fetch it to find out the attributes specified in xib file
        guard let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout else {
            return CGSize()
        }

        // subtract section left/ right insets mentioned in xib view
        let widthAvailbleForAllItems =  (collectionView.frame.width - flowLayout.sectionInset.left - flowLayout.sectionInset.right)

        // widthForOneItem achieved by sunbtracting item spacing if any
        let widthForOneItem = widthAvailbleForAllItems / 2 - flowLayout.minimumInteritemSpacing/2

        return CGSize(width: CGFloat(widthForOneItem), height: CGFloat(widthForOneItem))
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return genres.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = genreCollectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! GenreCollectionViewCell
        let genre = genres[indexPath.row]
        cell.genreLabel.text=genre.name
        if let firstLetter = genre.name.first {
            cell.genreLetterLabel.text=String(firstLetter)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        if genres.count>indexPath.row{
            self.performSegue(withIdentifier: movieListVCID, sender: genres[indexPath.row])
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier==movieListVCID{
            if let destinationVC = segue.destination as? MovieListViewController,let genre = sender as? Genre{
                destinationVC.genre=genre
            }
        }
    }
}

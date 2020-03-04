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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let posterImg=UIImage(named:"SW1_Poster"), let bannerImg=UIImage(named:"SW1_Banner"), let trailerLink = URL(string:"https://youtu.be/bD7bpG-zDJQ") {
            movies.append(Movie(title: "Star Wars I", subtitle: "La Menace fantôme", realeaseDate: 1999, duration: 136, categories: [Category.Aventure,Category.Fantastique], synopsis: "En 33 av. BY, une nouvelle crise menace la stabilité de ce régime politique.\n Depuis quelques années, une organisation montante, la Fédération du commerce détient le quasi monopole des échanges commerciaux dans la région de la Bordure extérieure. Sur le conseil de l'ambitieux sénateur Palpatine de la planète Naboo, le chef d'État de la République, le Chancelier Suprême Finis Valorum décide donc de taxer les transactions commerciales pour affaiblir le monopole de la Fédération. Prétextant que leurs vaisseaux commerciaux se font régulièrement attaquer par des pirates, les dirigeants de la Fédération demandent alors au chancelier l'autorisation de créer une armée de droïdes pour protéger ses transports. \n Quelques mois plus tard, en 32 av. BY, la situation se dégrade encore. Plusieurs membres du directoire de la Fédération du commerce sont assassinés. L'ambitieux Nute Gunray est alors nommé vice-roi de la Fédération. Conseillé par un homme mystérieux nommé Sidious, il décide alors d'organiser un embargo sur la planète de Naboo pour se venger du sénateur Palpatine, l'instigateur de la taxe commerciale",poster: posterImg , banner: bannerImg, trailerURL: trailerLink))
        }
        if let posterImg=UIImage(named:"SW2_Poster"), let bannerImg=UIImage(named:"SW2_Banner"), let trailerLink = URL(string:"https://youtu.be/gYbW1F_c9eM") {
            movies.append(Movie(title: "Star Wars II", subtitle: "L'Attaque des clones", realeaseDate: 2002, duration: 142, categories: [Category.SF], synopsis: "Pour amener la paix, une République galactique a été fondée, avec pour capitale la planète Coruscant. Mais, tout au long de son existence, la République est secouée par des sécessions et des guerres. Ce fut le cas en 32 av. BY lors des événements narrés dans le film La Menace fantôme. Dix ans plus tard, en 22 av. BY, la République est une nouvelle fois menacée.Menés par l'ancien Jedi Dooku, des milliers de systèmes solaires menacent de faire sécession. Les chevaliers Jedi s'avèrent alors trop peu nombreux pour assurer le maintien de la paix dans l'ensemble de la galaxie. Sur la planète Ansion, le Jedi Obi-Wan Kenobi et son apprenti Anakin Skywalker parviennent à convaincre les autorités locales de ne pas quitter la République. Mais, à Coruscant, de nombreux sénateurs souhaitent qu'une armée soit mise sur pied au cas où une guerre de sécession éclaterait.",poster: posterImg , banner: bannerImg, trailerURL: trailerLink))
        }
        if let posterImg=UIImage(named:"SW3_Poster"), let bannerImg=UIImage(named:"SW3_Banner"), let trailerLink = URL(string:"https://youtu.be/5UnjrG_N8hU") {
            movies.append(Movie(title: "Star Wars III", subtitle: "La Revanche des Sith", realeaseDate: 2005, duration: 140, categories: [Category.SF], synopsis: "En 19 av. BY, les Jedi Obi-Wan Kenobi et Anakin Skywalker sont chargés de retrouver le mystérieux Sith Dark Sidious, qui aurait infiltré depuis de nombreuses années le Sénat galactique. Ils parviennent à remonter sa trace jusqu’à son quartier général dans une zone désaffectée de Coruscant. Ils n’arrivent cependant pas à mettre la main sur lui. Dans le même temps, le général Grievous, chef de l’armée séparatiste attaque la planète capitale. Il parvient à capturer Palpatine, le Chancelier suprême de la République et le ramène jusqu’à son vaisseau spatial.",poster: nil , banner: bannerImg, trailerURL: trailerLink))
        }
        if let posterImg=UIImage(named:"SW1_Poster"), let bannerImg=UIImage(named:"SW1_Banner"), let trailerLink = URL(string:"https://youtu.be/bD7bpG-zDJQ") {
            movies.append(Movie(title: "Star Wars I", subtitle: "La Menace fantôme", realeaseDate: 1999, duration: 136, categories: [Category.Aventure,Category.Fantastique], synopsis: "En 33 av. BY, une nouvelle crise menace la stabilité de ce régime politique.\n Depuis quelques années, une organisation montante, la Fédération du commerce détient le quasi monopole des échanges commerciaux dans la région de la Bordure extérieure. Sur le conseil de l'ambitieux sénateur Palpatine de la planète Naboo, le chef d'État de la République, le Chancelier Suprême Finis Valorum décide donc de taxer les transactions commerciales pour affaiblir le monopole de la Fédération. Prétextant que leurs vaisseaux commerciaux se font régulièrement attaquer par des pirates, les dirigeants de la Fédération demandent alors au chancelier l'autorisation de créer une armée de droïdes pour protéger ses transports. \n Quelques mois plus tard, en 32 av. BY, la situation se dégrade encore. Plusieurs membres du directoire de la Fédération du commerce sont assassinés. L'ambitieux Nute Gunray est alors nommé vice-roi de la Fédération. Conseillé par un homme mystérieux nommé Sidious, il décide alors d'organiser un embargo sur la planète de Naboo pour se venger du sénateur Palpatine, l'instigateur de la taxe commerciale",poster: posterImg , banner: bannerImg, trailerURL: trailerLink))
        }
        if let posterImg=UIImage(named:"SW2_Poster"), let bannerImg=UIImage(named:"SW2_Banner"), let trailerLink = URL(string:"https://youtu.be/gYbW1F_c9eM") {
            movies.append(Movie(title: "Star Wars II", subtitle: "L'Attaque des clones", realeaseDate: 2002, duration: 142, categories: [Category.SF], synopsis: "Pour amener la paix, une République galactique a été fondée, avec pour capitale la planète Coruscant. Mais, tout au long de son existence, la République est secouée par des sécessions et des guerres. Ce fut le cas en 32 av. BY lors des événements narrés dans le film La Menace fantôme. Dix ans plus tard, en 22 av. BY, la République est une nouvelle fois menacée.Menés par l'ancien Jedi Dooku, des milliers de systèmes solaires menacent de faire sécession. Les chevaliers Jedi s'avèrent alors trop peu nombreux pour assurer le maintien de la paix dans l'ensemble de la galaxie. Sur la planète Ansion, le Jedi Obi-Wan Kenobi et son apprenti Anakin Skywalker parviennent à convaincre les autorités locales de ne pas quitter la République. Mais, à Coruscant, de nombreux sénateurs souhaitent qu'une armée soit mise sur pied au cas où une guerre de sécession éclaterait.",poster: posterImg , banner: bannerImg, trailerURL: trailerLink))
        }
        if let posterImg=UIImage(named:"SW3_Poster"), let bannerImg=UIImage(named:"SW3_Banner"), let trailerLink = URL(string:"https://youtu.be/5UnjrG_N8hU") {
            movies.append(Movie(title: "Star Wars III", subtitle: "La Revanche des Sith", realeaseDate: 2005, duration: 140, categories: [Category.SF], synopsis: "En 19 av. BY, les Jedi Obi-Wan Kenobi et Anakin Skywalker sont chargés de retrouver le mystérieux Sith Dark Sidious, qui aurait infiltré depuis de nombreuses années le Sénat galactique. Ils parviennent à remonter sa trace jusqu’à son quartier général dans une zone désaffectée de Coruscant. Ils n’arrivent cependant pas à mettre la main sur lui. Dans le même temps, le général Grievous, chef de l’armée séparatiste attaque la planète capitale. Il parvient à capturer Palpatine, le Chancelier suprême de la République et le ramène jusqu’à son vaisseau spatial.",poster: nil , banner: bannerImg, trailerURL: trailerLink))
        }
        if let posterImg=UIImage(named:"SW1_Poster"), let bannerImg=UIImage(named:"SW1_Banner"), let trailerLink = URL(string:"https://youtu.be/bD7bpG-zDJQ") {
            movies.append(Movie(title: "Star Wars I", subtitle: "La Menace fantôme", realeaseDate: 1999, duration: 136, categories: [Category.Aventure,Category.Fantastique], synopsis: "En 33 av. BY, une nouvelle crise menace la stabilité de ce régime politique.\n Depuis quelques années, une organisation montante, la Fédération du commerce détient le quasi monopole des échanges commerciaux dans la région de la Bordure extérieure. Sur le conseil de l'ambitieux sénateur Palpatine de la planète Naboo, le chef d'État de la République, le Chancelier Suprême Finis Valorum décide donc de taxer les transactions commerciales pour affaiblir le monopole de la Fédération. Prétextant que leurs vaisseaux commerciaux se font régulièrement attaquer par des pirates, les dirigeants de la Fédération demandent alors au chancelier l'autorisation de créer une armée de droïdes pour protéger ses transports. \n Quelques mois plus tard, en 32 av. BY, la situation se dégrade encore. Plusieurs membres du directoire de la Fédération du commerce sont assassinés. L'ambitieux Nute Gunray est alors nommé vice-roi de la Fédération. Conseillé par un homme mystérieux nommé Sidious, il décide alors d'organiser un embargo sur la planète de Naboo pour se venger du sénateur Palpatine, l'instigateur de la taxe commerciale",poster: posterImg , banner: bannerImg, trailerURL: trailerLink))
        }
        if let posterImg=UIImage(named:"SW2_Poster"), let bannerImg=UIImage(named:"SW2_Banner"), let trailerLink = URL(string:"https://youtu.be/gYbW1F_c9eM") {
            movies.append(Movie(title: "Star Wars II", subtitle: "L'Attaque des clones", realeaseDate: 2002, duration: 142, categories: [Category.SF], synopsis: "Pour amener la paix, une République galactique a été fondée, avec pour capitale la planète Coruscant. Mais, tout au long de son existence, la République est secouée par des sécessions et des guerres. Ce fut le cas en 32 av. BY lors des événements narrés dans le film La Menace fantôme. Dix ans plus tard, en 22 av. BY, la République est une nouvelle fois menacée.Menés par l'ancien Jedi Dooku, des milliers de systèmes solaires menacent de faire sécession. Les chevaliers Jedi s'avèrent alors trop peu nombreux pour assurer le maintien de la paix dans l'ensemble de la galaxie. Sur la planète Ansion, le Jedi Obi-Wan Kenobi et son apprenti Anakin Skywalker parviennent à convaincre les autorités locales de ne pas quitter la République. Mais, à Coruscant, de nombreux sénateurs souhaitent qu'une armée soit mise sur pied au cas où une guerre de sécession éclaterait.",poster: posterImg , banner: bannerImg, trailerURL: trailerLink))
        }
        if let posterImg=UIImage(named:"SW3_Poster"), let bannerImg=UIImage(named:"SW3_Banner"), let trailerLink = URL(string:"https://youtu.be/5UnjrG_N8hU") {
            movies.append(Movie(title: "Star Wars III", subtitle: "La Revanche des Sith", realeaseDate: 2005, duration: 140, categories: [Category.SF], synopsis: "En 19 av. BY, les Jedi Obi-Wan Kenobi et Anakin Skywalker sont chargés de retrouver le mystérieux Sith Dark Sidious, qui aurait infiltré depuis de nombreuses années le Sénat galactique. Ils parviennent à remonter sa trace jusqu’à son quartier général dans une zone désaffectée de Coruscant. Ils n’arrivent cependant pas à mettre la main sur lui. Dans le même temps, le général Grievous, chef de l’armée séparatiste attaque la planète capitale. Il parvient à capturer Palpatine, le Chancelier suprême de la République et le ramène jusqu’à son vaisseau spatial.",poster: nil , banner: bannerImg, trailerURL: trailerLink))
        }
        if let posterImg=UIImage(named:"SW2_Poster"), let bannerImg=UIImage(named:"SW2_Banner"), let trailerLink = URL(string:"https://youtu.be/gYbW1F_c9eM") {
            movies.append(Movie(title: "Star Wars II", subtitle: "L'Attaque des clones", realeaseDate: 2002, duration: 142, categories: [Category.SF], synopsis: "Pour amener la paix, une République galactique a été fondée, avec pour capitale la planète Coruscant. Mais, tout au long de son existence, la République est secouée par des sécessions et des guerres. Ce fut le cas en 32 av. BY lors des événements narrés dans le film La Menace fantôme. Dix ans plus tard, en 22 av. BY, la République est une nouvelle fois menacée.Menés par l'ancien Jedi Dooku, des milliers de systèmes solaires menacent de faire sécession. Les chevaliers Jedi s'avèrent alors trop peu nombreux pour assurer le maintien de la paix dans l'ensemble de la galaxie. Sur la planète Ansion, le Jedi Obi-Wan Kenobi et son apprenti Anakin Skywalker parviennent à convaincre les autorités locales de ne pas quitter la République. Mais, à Coruscant, de nombreux sénateurs souhaitent qu'une armée soit mise sur pied au cas où une guerre de sécession éclaterait.",poster: posterImg , banner: bannerImg, trailerURL: trailerLink))
        }
        if let posterImg=UIImage(named:"SW3_Poster"), let bannerImg=UIImage(named:"SW3_Banner"), let trailerLink = URL(string:"https://youtu.be/5UnjrG_N8hU") {
            movies.append(Movie(title: "Star Wars III", subtitle: "La Revanche des Sith", realeaseDate: 2005, duration: 140, categories: [Category.SF], synopsis: "En 19 av. BY, les Jedi Obi-Wan Kenobi et Anakin Skywalker sont chargés de retrouver le mystérieux Sith Dark Sidious, qui aurait infiltré depuis de nombreuses années le Sénat galactique. Ils parviennent à remonter sa trace jusqu’à son quartier général dans une zone désaffectée de Coruscant. Ils n’arrivent cependant pas à mettre la main sur lui. Dans le même temps, le général Grievous, chef de l’armée séparatiste attaque la planète capitale. Il parvient à capturer Palpatine, le Chancelier suprême de la République et le ramène jusqu’à son vaisseau spatial.",poster: nil , banner: bannerImg, trailerURL: trailerLink))
        }
        if let posterImg=UIImage(named:"SW1_Poster"), let bannerImg=UIImage(named:"SW1_Banner"), let trailerLink = URL(string:"https://youtu.be/bD7bpG-zDJQ") {
            movies.append(Movie(title: "Star Wars I", subtitle: "La Menace fantôme", realeaseDate: 1999, duration: 136, categories: [Category.Aventure,Category.Fantastique], synopsis: "En 33 av. BY, une nouvelle crise menace la stabilité de ce régime politique.\n Depuis quelques années, une organisation montante, la Fédération du commerce détient le quasi monopole des échanges commerciaux dans la région de la Bordure extérieure. Sur le conseil de l'ambitieux sénateur Palpatine de la planète Naboo, le chef d'État de la République, le Chancelier Suprême Finis Valorum décide donc de taxer les transactions commerciales pour affaiblir le monopole de la Fédération. Prétextant que leurs vaisseaux commerciaux se font régulièrement attaquer par des pirates, les dirigeants de la Fédération demandent alors au chancelier l'autorisation de créer une armée de droïdes pour protéger ses transports. \n Quelques mois plus tard, en 32 av. BY, la situation se dégrade encore. Plusieurs membres du directoire de la Fédération du commerce sont assassinés. L'ambitieux Nute Gunray est alors nommé vice-roi de la Fédération. Conseillé par un homme mystérieux nommé Sidious, il décide alors d'organiser un embargo sur la planète de Naboo pour se venger du sénateur Palpatine, l'instigateur de la taxe commerciale",poster: posterImg , banner: bannerImg, trailerURL: trailerLink))
        }
        if let posterImg=UIImage(named:"SW2_Poster"), let bannerImg=UIImage(named:"SW2_Banner"), let trailerLink = URL(string:"https://youtu.be/gYbW1F_c9eM") {
            movies.append(Movie(title: "Star Wars II", subtitle: "L'Attaque des clones", realeaseDate: 2002, duration: 142, categories: [Category.SF], synopsis: "Pour amener la paix, une République galactique a été fondée, avec pour capitale la planète Coruscant. Mais, tout au long de son existence, la République est secouée par des sécessions et des guerres. Ce fut le cas en 32 av. BY lors des événements narrés dans le film La Menace fantôme. Dix ans plus tard, en 22 av. BY, la République est une nouvelle fois menacée.Menés par l'ancien Jedi Dooku, des milliers de systèmes solaires menacent de faire sécession. Les chevaliers Jedi s'avèrent alors trop peu nombreux pour assurer le maintien de la paix dans l'ensemble de la galaxie. Sur la planète Ansion, le Jedi Obi-Wan Kenobi et son apprenti Anakin Skywalker parviennent à convaincre les autorités locales de ne pas quitter la République. Mais, à Coruscant, de nombreux sénateurs souhaitent qu'une armée soit mise sur pied au cas où une guerre de sécession éclaterait.",poster: posterImg , banner: bannerImg, trailerURL: trailerLink))
        }
        if let posterImg=UIImage(named:"SW3_Poster"), let bannerImg=UIImage(named:"SW3_Banner"), let trailerLink = URL(string:"https://youtu.be/5UnjrG_N8hU") {
            movies.append(Movie(title: "Star Wars III", subtitle: "La Revanche des Sith", realeaseDate: 2005, duration: 140, categories: [Category.SF], synopsis: "En 19 av. BY, les Jedi Obi-Wan Kenobi et Anakin Skywalker sont chargés de retrouver le mystérieux Sith Dark Sidious, qui aurait infiltré depuis de nombreuses années le Sénat galactique. Ils parviennent à remonter sa trace jusqu’à son quartier général dans une zone désaffectée de Coruscant. Ils n’arrivent cependant pas à mettre la main sur lui. Dans le même temps, le général Grievous, chef de l’armée séparatiste attaque la planète capitale. Il parvient à capturer Palpatine, le Chancelier suprême de la République et le ramène jusqu’à son vaisseau spatial.",poster: nil , banner: bannerImg, trailerURL: trailerLink))
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
        cell.poster.image=movie.poster
        cell.synopsis.text=movie.synopsis
        cell.releaseDate.text=String(movie.realeaseDate)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        print(movies[indexPath.row].title)
        
        self.performSegue(withIdentifier: "openDetail", sender: nil)
    }
    
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier==openDetail
    }*/
    
    
}

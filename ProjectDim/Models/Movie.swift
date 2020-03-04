//
//  Movie.swift
//  ProjectDim
//
//  Created by  on 03/03/2020.
//  Copyright © 2020 Yannick VERON. All rights reserved.
//

import Foundation
import UIKit

enum Category : String{
    case Action="Action"
    case SF="SF"
    case Aventure="Aventure"
    case Fantastique="Fantastique"
}

struct Movie {
    
    var title : String
    var subtitle : String
    var realeaseDate : Int
    var duration : Int //duration in minutes
    var categories : [Category]
    var synopsis : String
    var poster : UIImage?
    var banner : UIImage
    var trailerURL: URL
    
    func humanReadableDuration()-> String{
        if duration<60{
            return "\(duration) mn"
        }
        let (hours, minutes) = duration.quotientAndRemainder(dividingBy: 60)
        return "\(hours) h \(minutes) mn"
    }
    var categoriesString : String{//Computed Property
        return categories.map({(cat) -> String in
                return cat.rawValue
            }).joined(separator: "/")
    }
    
    static func getMovie()->Movie?{
        let synops = "L'univers de Star Wars se déroule dans une galaxie qui est le théâtre d'affrontements entre les Chevaliers Jedi et les Seigneurs noirs des Sith, personnes sensibles à la Force, un champ énergétique mystérieux leur procurant des pouvoirs psychiques. Les Jedi maîtrisent le Côté lumineux de la Force, pouvoir bénéfique et défensif, pour maintenir la paix dans la galaxie. Les Sith utilisent le Côté obscur, pouvoir nuisible et destructeur, pour leurs usages personnels et pour dominer la galaxie1. \n Pour amener la paix, une République galactique a été fondée avec pour capitale la planète Coruscant. Mais, tout au long de son existence, la République est secouée par des sécessions et des guerres1. En 33 av. BY, une nouvelle crise menace la stabilité de ce régime politique.\n Depuis quelques années, une organisation montante, la Fédération du commerce détient le quasi monopole des échanges commerciaux dans la région de la Bordure extérieure. Sur le conseil de l'ambitieux sénateur Palpatine de la planète Naboo, le chef d'État de la République, le Chancelier Suprême Finis Valorum décide donc de taxer les transactions commerciales pour affaiblir le monopole de la Fédération. Prétextant que leurs vaisseaux commerciaux se font régulièrement attaquer par des pirates, les dirigeants de la Fédération demandent alors au chancelier l'autorisation de créer une armée de droïdes pour protéger ses transports. \n Quelques mois plus tard, en 32 av. BY, la situation se dégrade encore. Plusieurs membres du directoire de la Fédération du commerce sont assassinés. L'ambitieux Nute Gunray est alors nommé vice-roi de la Fédération. Conseillé par un homme mystérieux nommé Sidious, il décide alors d'organiser un embargo sur la planète de Naboo pour se venger du sénateur Palpatine, l'instigateur de la taxe commerciale"
        let _poster = UIImage(named:"SW1_Poster")
        let _banner = UIImage(named:"SW1_Banner")
        let _trailer = URL(string: "https://youtu.be/bD7bpG-zDJQ")
        guard let posterImg=_poster, let bannerImg=_banner, let trailer = _trailer else {
            return nil
        }
        
        return Movie(title: "StarWars I", subtitle: "La Menace fantôme", realeaseDate: 1999, duration: 136, categories: [Category.SF,Category.Aventure,Category.Fantastique], synopsis: synops,poster: posterImg , banner: bannerImg, trailerURL: trailer)
    }
}

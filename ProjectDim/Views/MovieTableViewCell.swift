//
//  MovieTableViewCell.swift
//  ProjectDim
//
//  Created by  on 04/03/2020.
//  Copyright © 2020 Yannick VERON. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var firstLb: UILabel!
    @IBOutlet weak var secondLb: UILabel!
    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var synopsis: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}

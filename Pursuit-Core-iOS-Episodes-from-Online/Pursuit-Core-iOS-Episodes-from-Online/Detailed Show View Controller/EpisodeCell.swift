//
//  DetailedShowTVCell.swift
//  Pursuit-Core-iOS-Episodes-from-Online
//
//  Created by David Lin on 12/16/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class EpisodeCell: UITableViewCell {
    
    var cellEpisodes: Episodes!
    
    @IBOutlet weak var episodeImage: UIImageView!
    @IBOutlet weak var episodeName: UILabel!
    @IBOutlet weak var episodeSeason: UILabel!
    
    func updateUI(data: Episodes) {
        episodeName.text = data.name
        episodeSeason.text = "Season: \(data.season.description), Episode: \(data.number.description)"
        
        
    }

}

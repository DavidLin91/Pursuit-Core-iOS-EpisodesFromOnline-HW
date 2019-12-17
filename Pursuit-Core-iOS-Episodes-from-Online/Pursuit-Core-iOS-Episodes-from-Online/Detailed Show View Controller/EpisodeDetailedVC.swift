//
//  ShowDetailCell.swift
//  Pursuit-Core-iOS-Episodes-from-Online
//
//  Created by David Lin on 12/16/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class EpisodeDetailedVC: UIViewController {
    var episodeDetail: Episodes!
    @IBOutlet weak var episodeName: UILabel!
    @IBOutlet weak var episodeImage: UIImageView!
    @IBOutlet weak var episodeSeason: UILabel!
    @IBOutlet weak var episodeNumber: UILabel!
    @IBOutlet weak var episodeDescription: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        episodeName.text = episodeDetail.name
        episodeSeason.text = "Season: \(episodeDetail.season)"
        episodeNumber.text = "Episode: \(episodeDetail.number)"
        episodeDescription.text = episodeDetail.summary
        
        NetworkHelper.shared.performDataTask(with: episodeDetail.image?.original ?? "") { (result) in
            switch result {
            case .failure(let appError):
                print("app error: \(appError)")
            case .success(let data):
                DispatchQueue.main.async {
                    let episodeImage = UIImage( data:data )
                    self.episodeImage.image = episodeImage
                }
            }
        }

        
        
        
        
    }
}

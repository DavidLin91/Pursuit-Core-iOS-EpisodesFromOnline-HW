//
//  ShowCell.swift
//  Pursuit-Core-iOS-Episodes-from-Online
//
//  Created by David Lin on 12/16/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ShowCell: UITableViewCell {
    
    
    @IBOutlet weak var showImage: UIImageView!
    @IBOutlet weak var showName: UILabel!
    @IBOutlet weak var showRating: UILabel!
    
    func updateUI(show: AllTVShows) {
        showName.text = show.show.name
        showRating.text = "Rating: \(show.show.rating?.average?.description ?? "N/A")"
        
        NetworkHelper.shared.performDataTask(with: show.show.image?.medium ?? "") { (result) in
            switch result {
            case .failure(let appError):
                print("app error: \(appError)")
            case .success(let data):
                DispatchQueue.main.async {
                    let showImage = UIImage( data: data )
                    self.showImage.image = showImage
                }
            }
        }
    }
}

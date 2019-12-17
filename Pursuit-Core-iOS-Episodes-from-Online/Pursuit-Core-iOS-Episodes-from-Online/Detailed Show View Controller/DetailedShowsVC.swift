//
//  DetailedShowsVC.swift
//  Pursuit-Core-iOS-Episodes-from-Online
//
//  Created by David Lin on 12/10/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class DetailedShowsVC: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var allEpsiodes: AllTVShows?
    
    private var episodes = [AllEpisodes]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
    

}

extension DetailedShowsVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "episodeCell", for: indexPath) as? DetailedShowTVCell else {
            fatalError("could not dequeue Detailed Show TV Cell")
        }
        let episode = episodes[indexPath.row]
        cell.updateUI(data: episode)
        return cell
    }
    
    
}

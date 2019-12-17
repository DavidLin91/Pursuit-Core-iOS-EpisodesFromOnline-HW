//
//  DetailedShowsVC.swift
//  Pursuit-Core-iOS-Episodes-from-Online
//
//  Created by David Lin on 12/10/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class EpisodeVC: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var allEpisodes: Shows?
    var allTVShows: AllTVShows?
    
    private var episodes = [Episodes]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        loadEpisodes()
        
    }
    
    func loadEpisodes() {
        EpisodesAPIClient.getEpisodes(id: allEpisodes?.id ?? 1) { (result) in
            switch result {
            case .failure(let appError):
                print("app error: \(appError)")
            case .success(let data):
                self.episodes = data
            }
        }
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailedShowTVCell = segue.destination as? EpisodeDetailedVC,
            let indexPath = tableView.indexPathForSelectedRow else {
            fatalError("could not segue to DetailedShowsVC")
        }
        let episode = episodes[indexPath.row]
        detailedShowTVCell.episodeDetail = episode
    }

}

extension EpisodeVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "episodeCell", for: indexPath) as? EpisodeCell else {
            fatalError("could not dequeue Detailed Show TV Cell")
        }
        let episode = episodes[indexPath.row]
        cell.updateUI(data: episode)
        return cell
    }
}

extension EpisodeVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }
}

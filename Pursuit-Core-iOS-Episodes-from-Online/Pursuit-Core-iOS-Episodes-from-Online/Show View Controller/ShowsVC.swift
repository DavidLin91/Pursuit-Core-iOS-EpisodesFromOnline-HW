//
//  ViewController.swift
//  Pursuit-Core-iOS-Episodes-from-Online
//
//  Created by Benjamin Stone on 9/5/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ShowsVC: UIViewController {

    @IBOutlet weak var showSearchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    private var shows = [AllTVShows]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    var searchQuery = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        showSearchBar.delegate = self
        searchShows(search: searchQuery)
    }
    

    func searchShows(search: String) {
        ShowsAPIClient.getShows(userSearch: search) { [weak self] (result) in
            switch result {
            case .failure(let appError):
                print("app error: \(appError)")
            case .success(let data):
                self?.shows = data
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailedShowsVC = segue.destination as? DetailedShowsVC,
            let indexPath = tableView.indexPathForSelectedRow else {
                fatalError("could not retrieve index path for DetailedShowsVC")
        }
        let show = shows[indexPath.row]
        detailedShowsVC.allShows = show
    }
}

extension ShowsVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return shows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "showsCell", for: indexPath) as? ShowCell else {
            fatalError("no cell")
        }
        let show = shows[indexPath.row]
        cell.updateUI(show: show)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}

extension ShowsVC: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text else {
            print("missing search text")
            return
        }
        searchShows(search: searchText)
    }
}

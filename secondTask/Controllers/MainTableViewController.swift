//
//  ViewController.swift
//  secondTask
//
//  Created by Haydee Rodriguez on 5/8/18.
//  Copyright © 2018 Haydee Rodriguez. All rights reserved.
//

import UIKit
import PromiseKit

class MainTableViewController: UITableViewController {

    var reviews = [Review]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerViews()
        getReviews()
    }

    func registerViews() {
        let nib = UINib(nibName: ReviewTableViewCell.reusableId, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: ReviewTableViewCell.reusableId)
    }
    
    func getReviews() {
        firstly {
            DataHandler.getReviews()
        }.done { reviews in
            if let anime = reviews.anime,
                let manga = reviews.manga {
                self.reviews.append(contentsOf: anime)
                self.reviews.append(contentsOf: manga)
                self.tableView.reloadData()
            }
        }.catch { error in
            print(error.localizedDescription)
        }
    }

    func printNames() {
        for review in self.reviews {
            print(review.id)
        }
    }
    
    // MARK: - Datasource
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviews.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: ReviewTableViewCell.reusableId, for: indexPath) as? ReviewTableViewCell)!
        cell.configure(with: reviews[indexPath.row])
        return cell
    }
}


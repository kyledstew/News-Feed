//
//  SummaryTableViewController.swift
//  Nike Code Challenge
//
//  Created by Kyle Stewart on 12/9/18.
//  Copyright © 2018 Kyle Stewart. All rights reserved.
//

import UIKit

class SummaryTableViewController: UITableViewController {
    private var summaryTableViewCellIdentifier: String = "SummaryTableViewCell"
    
    var articles: [Article] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.topItem?.title = "Summary"
        
        loadArticles()
        
        tableView.tableFooterView = UIView()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailViewController = segue.destination as? DetailViewController {
            guard let selectedIndexPath = tableView.indexPathForSelectedRow else {
                print("Error - No Cell Selected")
                return
            }
            let article = articles[selectedIndexPath.row]
            detailViewController.article = article
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: summaryTableViewCellIdentifier, for: indexPath) as! SummaryTableViewCell
        let article = articles[indexPath.row]
        cell.populateData(article: article)
        return cell
    }
}

// MARK: Helper Functions
extension SummaryTableViewController {
    func loadArticles() {
        Networking.getHeadlines { [weak self] (response) in
            guard let self = self else {
                return
            }
            
            switch response {
            case .failure(let error):
                DispatchQueue.main.async {
                    self.handleNetworkError(error: error)
                }
            case .success(let articles):
                self.articles = articles
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    func handleNetworkError(error: Error?) {
        let alertController = UIAlertController(title: "Network Error", message: error?.localizedDescription ?? "Unknown Error", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}


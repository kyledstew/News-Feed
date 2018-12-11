//
//  NewsFeedTableViewCell.swift
//  Nike Code Challenge
//
//  Created by Kyle Stewart on 12/10/18.
//  Copyright © 2018 Kyle Stewart. All rights reserved.
//

import UIKit
import Kingfisher

class SummaryTableViewCell: UITableViewCell {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var supplementaryDataLabel: UILabel!
    @IBOutlet var supplementaryImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        titleLabel.isAccessibilityElement = true
        titleLabel.accessibilityTraits = UIAccessibilityTraits.staticText
        titleLabel.accessibilityLabel = "Article Title"
    }
    
    func populateData(article: Article) {
        titleLabel.text = article.title
        supplementaryDataLabel.text = article.publishedDate?.userFriendlyString
        if let imageURL = URL(string: article.urlToImage ?? "") {
            supplementaryImageView.kf.setImage(with: imageURL)
        }
    }
    
}

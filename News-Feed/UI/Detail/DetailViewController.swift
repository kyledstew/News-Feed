//
//  DetailViewController.swift
//  Nike Code Challenge
//
//  Created by Kyle Stewart on 12/10/18.
//  Copyright © 2018 Kyle Stewart. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var authorLabel: UILabel!
    @IBOutlet var publishDateLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var contentLabel: UILabel!
    @IBOutlet var viewArticleButton: UIButton!
    
    @IBAction func viewArticleButtonSelected(_ sender: Any) {
        guard let url: URL = article.articleURL else {
            //shouldn't be able to select this as we are hiding if it isn't a valid url
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    var article: Article!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.isAccessibilityElement = true
        titleLabel.accessibilityTraits = UIAccessibilityTraits.staticText
        titleLabel.accessibilityLabel = "Article Title"
        
        titleLabel.text = article.title
        authorLabel.text = article.author
        publishDateLabel.text = article.publishedDate?.userFriendlyString
        if let imageURL = URL(string: article.urlToImage ?? "") {
            imageView.kf.setImage(with: imageURL)
        }
        contentLabel.text = article.description
        guard let url: URL = article.articleURL,
            UIApplication.shared.canOpenURL(url) else {
            viewArticleButton.isHidden = true
                return
        }
    }

}

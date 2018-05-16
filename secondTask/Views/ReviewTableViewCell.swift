//
//  reviewTableViewCell.swift
//  secondTask
//
//  Created by Haydee Rodriguez on 5/11/18.
//  Copyright © 2018 Haydee Rodriguez. All rights reserved.
//

import UIKit

class ReviewTableViewCell: UITableViewCell {

    @IBOutlet weak var leftImage: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelSubtitle: UILabel!
    @IBOutlet weak var labelBody: UILabel!
    
    func configure(with review: Review){
        leftImage.image = #imageLiteral(resourceName: "default_img")
        labelTitle.text = "\(review.id)"
        labelSubtitle.text = review.summary
        labelBody.text = ""
    }
    
}

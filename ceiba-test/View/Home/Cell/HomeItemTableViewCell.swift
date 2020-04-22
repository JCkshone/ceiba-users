//
//  HomeItemTableViewCell.swift
//  ceiba-test
//
//  Created by Jc on 22/04/20.
//  Copyright © 2020 Jc. All rights reserved.
//

import UIKit

class HomeItemTableViewCell: UITableViewCell {
    
    @IBOutlet fileprivate weak var profileView: Lottie!
    @IBOutlet fileprivate weak var nameLabel: UILabel!
    @IBOutlet fileprivate weak var phoneLabel: UILabel!
    @IBOutlet fileprivate weak var emailLabel: UILabel!
    
    private var animation: Lottie = Lottie()
    
    var animationName: String = "" {
        didSet {
            profileView.setupAnimation(animationName)
        }
    }
    
    var name: String = "" {
        didSet {
            nameLabel.text = name
        }
    }
    
    var phone: String = "" {
       didSet {
        phoneLabel.text = phone
       }
    }
    
    var email: String = "" {
       didSet {
        emailLabel.text = email
       }
    }
    
    override func prepareForReuse() {
        emailLabel.text = ""
        phoneLabel.text = ""
        nameLabel.text = ""
    }
    
    override func layoutSubviews() {
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

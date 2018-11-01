//
//  FeedCell.swift
//  Trady
//
//  Created by Sherif Kamal on 11/1/18.
//  Copyright © 2018 Sherif Kamal. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell {

    //Outlets
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var feedContentLbl: UILabel!
    @IBOutlet weak var profileImg: CircularImage!
    

    func configureCell(profileImg: UIImage, email: String, feedContent: String) {
        self.profileImg.image = profileImg
        self.emailLbl.text = email
        self.feedContentLbl.text = feedContent
    }
}

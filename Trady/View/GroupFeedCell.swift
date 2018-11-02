//
//  GroupFeedCell.swift
//  Trady
//
//  Created by Sherif Kamal on 11/2/18.
//  Copyright © 2018 Sherif Kamal. All rights reserved.
//

import UIKit

class GroupFeedCell: UITableViewCell {

    @IBOutlet weak var profileImg: CircularImage!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var contentLbl: UILabel!
    

    func configureCell(profileImg: UIImage, email: String, content: String) {
        
        self.profileImg.image = profileImg
        self.emailLbl.text = email
        self.contentLbl.text = content
    }
}

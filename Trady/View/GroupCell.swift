//
//  GroupCell.swift
//  Trady
//
//  Created by Sherif Kamal on 11/2/18.
//  Copyright © 2018 Sherif Kamal. All rights reserved.
//

import UIKit

class GroupCell: UITableViewCell {

    //Outlets
    @IBOutlet weak var groupTitleLbl: UILabel!
    @IBOutlet weak var groupDescLbl: UILabel!
    @IBOutlet weak var memberLbl: UILabel!
    
    func configureCell(title: String, description: String, membersCount: Int) {
        self.groupTitleLbl.text = title
        self.groupDescLbl.text = description
        self.memberLbl.text = "\(membersCount) members."
    }
}

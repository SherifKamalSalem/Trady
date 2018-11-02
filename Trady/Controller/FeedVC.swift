//
//  FirstViewController.swift
//  Trady
//
//  Created by Sherif Kamal on 10/31/18.
//  Copyright © 2018 Sherif Kamal. All rights reserved.
//

import UIKit

class FeedVC: UIViewController {
    //Outlets
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DataService.instance.getAllFeedMessages { (feedMessages) in
            DataService.instance.messages = feedMessages.reversed()
            self.tableView.reloadData()
        }
    }
}

extension FeedVC: UITableViewDelegate, UITableViewDataSource {
    //TableView datasource methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.messages.count
    }
    //TableView delegate methods
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "feedCell") as? FeedCell else { return UITableViewCell() }
        let image = UIImage(named: "defaultProfileImage")
        let message = DataService.instance.messages[indexPath.row]
        DataService.instance.getUsername(forUID: message.senderId) { (userEmail) in
             cell.configureCell(profileImg: image!, email: userEmail, feedContent: message.content)
        }
        return cell
    }
}


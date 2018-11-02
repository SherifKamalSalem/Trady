//
//  SecondViewController.swift
//  Trady
//
//  Created by Sherif Kamal on 10/31/18.
//  Copyright © 2018 Sherif Kamal. All rights reserved.
//

import UIKit

class GroupsVC: UIViewController {

    //Outlets
    @IBOutlet weak var tableView: UITableView!
    //Variables
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DataService.instance.REF_GROUPS.observe( .value) { (snapshot) in
            DataService.instance.getAllGroups { (groups) in
                DataService.instance.groups = groups
                self.tableView.reloadData()
            }
        }
    }
}

extension GroupsVC : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.groups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "groupCell") as? GroupCell else { return UITableViewCell() }
        let group = DataService.instance.groups[indexPath.row]
        cell.configureCell(title: group.title, description: group.description, membersCount: group.memberCount)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let groupFeedVC = storyboard?.instantiateViewController(withIdentifier: "GroupFeedVC") as? GroupFeedVC else { return }
        groupFeedVC.initData(forGroup: DataService.instance.groups[indexPath.row])
        present(groupFeedVC, animated: true, completion: nil)
     }
}


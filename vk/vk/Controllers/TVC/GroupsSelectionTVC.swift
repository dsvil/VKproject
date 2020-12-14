//
//  GroupsSelectionTVC.swift
//  vk
//
//  Created by Дорожкин Сергей on 15.11.2020.
//

import UIKit

class GroupsSelectionTVC: UITableViewController, UISearchBarDelegate {
    let selectedGroups = GetGroups.publicGroups()
    var filteredGroups = [Group]()
    
    @IBOutlet weak var search: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filteredGroups = selectedGroups
        search.delegate = self
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            search.text = nil
            filteredGroups = selectedGroups
            view.endEditing(true)
            tableView.reloadData()
        } else {
            filteredGroups = selectedGroups.filter({ (group) -> Bool in
                return group.name.lowercased().contains(searchText.lowercased())
            })
            tableView.reloadData()
        }
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return filteredGroups.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupsSelectionCell", for: indexPath) as! GroupsSelectionCell
        let selectedGroup = filteredGroups[indexPath.row]
        cell.groupsSelectionLabel.text = selectedGroup.name
        cell.groupsSelectionIcon.image = selectedGroup.icon
        
        return cell
    }
}

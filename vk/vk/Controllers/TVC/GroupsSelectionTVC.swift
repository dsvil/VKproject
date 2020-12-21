//
//  GroupsSelectionTVC.swift
//  vk
//
//  Created by Дорожкин Сергей on 15.11.2020.
//

import UIKit

class GroupsSelectionTVC: UITableViewController, UISearchBarDelegate {
    
    var filteredGroups = [VkGroup]()
    
    @IBOutlet weak var search: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        search.delegate = self
        
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            search.text = nil
            filteredGroups = []
            view.endEditing(true)
            tableView.reloadData()
        } else {
            ApiGetGroupsVKSearch.getData(searchText: searchText) { [self]groups in
                filteredGroups = groups
                tableView.reloadData()
            }
            tableView.reloadData()
        }
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        filteredGroups.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupsSelectionCell", for: indexPath) as! GroupsSelectionCell
        let selectedGroup = filteredGroups[indexPath.row]
        cell.groupsSelectionLabel.text = selectedGroup.name
        cell.groupsSelectionIcon.image = try? UIImage(data: Data(contentsOf: URL(string: selectedGroup.icon ) ?? URL(string: "http://www.google.com")!))
        return cell
    }
}

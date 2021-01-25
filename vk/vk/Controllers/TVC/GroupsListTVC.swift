//
//  GroupsListTVC.swift
//  vk
//
//  Created by Дорожкин Сергей on 15.11.2020.
//

import UIKit

class GroupsListTVC: UITableViewController, UISearchBarDelegate {
    var myGroups = [VkGroup]()
    var filteredGroups = [VkGroup]()
    
    @IBOutlet weak var search: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        search.delegate = self
        
        ApiGetGroupsVK.getData { [self]groups in
            myGroups = groups
            filteredGroups = groups
            tableView.reloadData()
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            search.text = nil
            filteredGroups = myGroups
            view.endEditing(true)
            tableView.reloadData()
        } else {
            filteredGroups = myGroups.filter({ (group) -> Bool in
                group.name.lowercased().contains(searchText.lowercased())
            })
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupsListSell", for: indexPath) as! GroupsListCell
        
        let myGroup = filteredGroups[indexPath.row]
        cell.groupsListLabel.text = myGroup.name
        cell.groupsListIcon.image = try? UIImage(data: Data(contentsOf: URL(string: myGroup.icon ) ?? URL(string: "http://www.google.com")!))
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            filteredGroups.remove(at: indexPath.row)
            myGroups = filteredGroups
            tableView.deleteRows(at: [indexPath], with: .middle)
        }
    }
    
    @IBAction func getBackToMyGroups(unwindSegue: UIStoryboardSegue) {
        if unwindSegue.identifier == "SelectGroup" {
            if let groupsSelectionTVC = unwindSegue.source as? GroupsSelectionTVC {
                if let indexPath = groupsSelectionTVC.tableView.indexPathForSelectedRow {
                    let group = groupsSelectionTVC.filteredGroups[indexPath.row]
                    if  !filteredGroups.contains(where: { filteredGroups -> Bool in
                                                    group.name ==  filteredGroups.name}) {
                        filteredGroups.append(group)
                        myGroups = filteredGroups
                        tableView.reloadData()
                    }
                }
            }
        }
    }
}

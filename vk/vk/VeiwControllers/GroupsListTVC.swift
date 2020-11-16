//
//  GroupsListTVC.swift
//  vk
//
//  Created by Дорожкин Сергей on 15.11.2020.
//

import UIKit

class GroupsListTVC: UITableViewController {
    var myGroups = GetGroups.myGroups()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myGroups.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupsListSell", for: indexPath) as! GroupsListCell
        
        let myGroup = myGroups[indexPath.row]
        
        cell.groupsListLabel.text = myGroup.name
        cell.groupsListIcon.image = myGroup.icon
        // Configure the cell...
        
        return cell
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            myGroups.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .middle)
        } 
    }
    
    @IBAction func getBackToMyGroups(unwindSegue: UIStoryboardSegue) {
        if unwindSegue.identifier == "SelectGroup" {
            if let groupsSelectionTVC = unwindSegue.source as? GroupsSelectionTVC {
                if let indexPath = groupsSelectionTVC.tableView.indexPathForSelectedRow {
                    let group = groupsSelectionTVC.selectedGroups[indexPath.row]
                    if  !myGroups.contains(where: {myGroups -> Bool in
                                            return group.name == myGroups.name}) {
                        myGroups.append(group)
                        tableView.reloadData()
                    }
                }
            }
        }
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */

}

//
//  FriendsListTVC.swift
//  vk
//
//  Created by Дорожкин Сергей on 15.11.2020.
//

import UIKit

class FriendsListTVC: UITableViewController {
    var friends = GetFriends.getFriends()
    
    override func viewDidLoad() {
        super.viewDidLoad()

         self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsListCell", for: indexPath) as! FriendsListCell
        let friend = friends[indexPath.row]
        cell.friendList.text = friend.fio
        cell.friendIcon.image = friend.icon
        
        return cell
    }
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            friends.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .middle)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "OpenImages" {
            if let destination = segue.destination as? FriendsPhotosCVC{
                if let indexPath = tableView.indexPathForSelectedRow {
                    destination.friendsImage = friends[indexPath.row]
                    destination.title = friends[indexPath.row].fio
                }
            }
        }
    }
}

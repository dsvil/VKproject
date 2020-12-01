//
//  FriendsListTVC.swift
//  vk
//
//  Created by Дорожкин Сергей on 15.11.2020.
//

import UIKit

class FriendsListTVC: UITableViewController, UISearchBarDelegate {
    var friends = GetFriends.getFriends()
    var sortedFirstLetters: [String] = []
    var sections: [[User]] = [[]]
    var filteredSections: [[User]] = [[]]
    
    @IBOutlet weak var search: UISearchBar!
    
    func createSections () {
        let firstLetters = friends.map { $0.titleFirstLetter.uppercased() }
        let uniqueFirstLetters = Array(Set(firstLetters))
        sortedFirstLetters = uniqueFirstLetters.sorted()
        sections = sortedFirstLetters.map { firstLetter in
            return friends
                .filter { $0.titleFirstLetter == firstLetter }
                .sorted { $0.fio < $1.fio }
        }
        filteredSections = sections
        search.delegate = self
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            search.text = nil
            filteredSections = sections
            view.endEditing(true)
            tableView.reloadData()
        } else {
            filteredSections = sortedFirstLetters.map { firstLetter in
                return friends
                    .filter { $0.titleFirstLetter == firstLetter }
                    .filter({ (group) -> Bool in
                        return group.fio.lowercased().contains(searchText.lowercased())
                    })
                    .sorted { $0.fio < $1.fio }
            }
            tableView.reloadData()
        }
    }
    
    let avatarView = AvatarView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createSections()
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.navigationItem.titleView = avatarView
        
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sortedFirstLetters
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return filteredSections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredSections[section].count
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 40))
        view.backgroundColor = UIColor.red
        let label = UILabel(frame: CGRect(x: 15, y: -10, width: tableView.bounds.width - 30, height: 49))
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = UIColor.white
        label.text = sortedFirstLetters[section]
        view.addSubview(label)
        return view
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsListCell", for: indexPath) as! FriendsListCell
        let friend = filteredSections[indexPath.section][indexPath.row]
        cell.friendList.text = friend.fio
        cell.friendIcon.image = friend.icon
        return cell
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            friends.remove(at: indexPath.row)
            createSections()
            tableView.reloadData()
            
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

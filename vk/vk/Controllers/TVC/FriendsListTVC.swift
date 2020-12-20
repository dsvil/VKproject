//
//  FriendsListTVC.swift
//  vk
//
//  Created by Дорожкин Сергей on 15.11.2020.
//

import UIKit

class FriendsListTVC: UITableViewController, UISearchBarDelegate {
    let avatarView = AvatarView()
    var friends = [ApiGetFriendsVK.VkFriend]()
//    var sortedFirstLetters = [String]()
    
    @IBOutlet weak var search: UISearchBar!
    
    var firstCharacters = [Character]()
    var sortedFriends: [Character: [ApiGetFriendsVK.VkFriend]] = [:]
    
    private func sort(_ friends: [ApiGetFriendsVK.VkFriend]) -> (characters: [Character], sortedFriends: [Character: [ApiGetFriendsVK.VkFriend]]) {
        var characters = [Character]()
        var sortedFriends = [Character: [ApiGetFriendsVK.VkFriend]]()
        
        friends.forEach { friend in
            guard let character = friend.lastName.first else { return }
            if var thisCharFriends = sortedFriends[character] {
                thisCharFriends.append(friend)
                sortedFriends[character] = thisCharFriends
            } else {
                sortedFriends[character] = [friend]
                characters.append(character)
            }
        }
        characters.sort()
        return (characters, sortedFriends)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        search.delegate = self
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.navigationItem.titleView = avatarView
        ApiGetFriendsVK.getData() { [self] friends in
            self.friends = friends
            (firstCharacters, sortedFriends) = sort(friends)
            self.tableView.reloadData()
        }
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let character = firstCharacters[section]
        return String(character)
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        sortedFriends.count
    }
//    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
//        func getStringForFirstLetter () -> [String]{
//            var chars = [String]()
//            firstCharacters.forEach {_ in
//                let char = firstCharacters
//                let stringChar = String(char)
//                chars.append(stringChar)
//            }
//            let uniqueFirstLetters = Array(Set(chars))
//            sortedFirstLetters = uniqueFirstLetters.sorted()
//            return sortedFirstLetters
//        }
//        return sortedFirstLetters
//    }
    
        override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 40))
            view.backgroundColor = UIColor.red
            let label = UILabel(frame: CGRect(x: 15, y: -10, width: tableView.bounds.width - 30, height: 49))
            label.font = UIFont.boldSystemFont(ofSize: 20)
            label.textColor = UIColor.white
            let character = firstCharacters[section]
            label.text = String(character)
            view.addSubview(label)
            return view
        }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let character = firstCharacters[section]
        let friendsCount = sortedFriends[character]?.count
        return friendsCount ?? 0
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsListCell", for: indexPath) as! FriendsListCell
        
        cell.contentView.alpha = 0
        cell.contentView.transform = CGAffineTransform(translationX: -50, y: 0)
        
        UIView.transition(with: cell.contentView,
                          duration: 0.4,
                          options: .curveEaseInOut,
                          animations: {
                            cell.contentView.transform = .identity
                            cell.contentView.alpha = 1
                          })
        
        let character = firstCharacters[indexPath.section]
        if let char = sortedFriends[character] {
            let friend = char[indexPath.row]
            cell.friendList.text = friend.lastName + " " + friend.firstName
            cell.friendIcon.image = try? UIImage(data: Data(contentsOf: URL(string: friend.icon ) ?? URL(string: "http://www.google.com")!))
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "OpenImages" {
            
            if let destination = segue.destination as? FriendsPhotosCVC{
                if let indexPath = tableView.indexPathForSelectedRow {
                    let character = firstCharacters[indexPath.section]
                    if let char = sortedFriends[character] {
                        destination.friendsId = char[indexPath.row].id
                        destination.title = char[indexPath.row].firstName}
                }
            }
        }
    }
    
    
}
    //    var sortedFirstLetters: [String] = []
    //    var sections: [[VkFriend]] = [[]]
    //    var filteredSections: [[VkFriend]] = [[]]
    //    func createSections () {
    //        let firstLetters = friends.map { $0.titleFirstLetter.uppercased() }
    //        let uniqueFirstLetters = Array(Set(firstLetters))
    //        sortedFirstLetters = uniqueFirstLetters.sorted()
    //        sections = sortedFirstLetters.map { firstLetter in
    //            return friends
    //                .filter { $0.titleFirstLetter == firstLetter }
    //                .sorted { $0.fio < $1.fio }
    //        }
    //        filteredSections = sections
    //
    //    }
    //
    //    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    //        if searchText.isEmpty {
    //            search.text = nil
    //            filteredSections = sections
    //            view.endEditing(true)
    //            tableView.reloadData()
    //        } else {
    //            filteredSections = sortedFirstLetters.map { firstLetter in
    //                return friends
    //                    .filter { $0.titleFirstLetter == firstLetter }
    //                    .filter({ (group) -> Bool in
    //                        return group.fio.lowercased().contains(searchText.lowercased())
    //                    })
    //                    .sorted { $0.fio < $1.fio }
    //            }
    //            tableView.reloadData()
    //        }
    //    }
//    override func sectionIndexTitles(for tableView: UITableView) -> [String.Index]? {
//        return sortedFirstLetters
//    }
//
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return filteredSections.count
//    }
////
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return filteredSections[section].count
//    }
////
//    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 40))
//        view.backgroundColor = UIColor.red
//        let label = UILabel(frame: CGRect(x: 15, y: -10, width: tableView.bounds.width - 30, height: 49))
//        label.font = UIFont.boldSystemFont(ofSize: 20)
//        label.textColor = UIColor.white
////        label.text = sortedFirstLetters[section]
//        view.addSubview(label)
//        return view
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsListCell", for: indexPath) as! FriendsListCell
//        let friend = filteredSections[indexPath.section][indexPath.row]
//
//        cell.contentView.alpha = 0
//        cell.contentView.transform = CGAffineTransform(translationX: -50, y: 0)
//
//        UIView.transition(with: cell.contentView,
//                          duration: 0.4,
//                          options: .curveEaseInOut,
//                          animations: {
//                            cell.contentView.transform = .identity
//                            cell.contentView.alpha = 1
//                          })
//        cell.friendList.text = friend.lastName + " " + friend.firstName
//        cell.friendIcon.image = try? UIImage(data: Data(contentsOf: URL(string: friend.icon ) ?? URL(string: "http://www.google.com")!))
//        return cell
//    }
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            friends.remove(at: indexPath.row)
//            createSections()
//            tableView.reloadData()
//
//        }
//    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "OpenImages" {
//            if let destination = segue.destination as? FriendsPhotosCVC{
//                if let indexPath = tableView.indexPathForSelectedRow {
//                    destination.friendsId = friends[indexPath.row]
//                    destination.title = friends[indexPath.row].fio
//                }
//            }
//        }
//    }


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
    @IBOutlet weak var search: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        search.delegate = self
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.navigationItem.titleView = avatarView
        ApiGetFriendsVK.getData() { [self] friends in
            self.friends = friends
            self.tableView.reloadData()
        }
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
        cell.contentView.alpha = 0
        cell.contentView.transform = CGAffineTransform(translationX: -50, y: 0)
        
        UIView.transition(with: cell.contentView,
                          duration: 0.4,
                          options: .curveEaseInOut,
                          animations: {
                            cell.contentView.transform = .identity
                            cell.contentView.alpha = 1
                          })
        cell.friendList.text = friend.lastName + " " + friend.firstName
        cell.friendIcon.image = try? UIImage(data: Data(contentsOf: URL(string: friend.icon ) ?? URL(string: "http://www.google.com")!))
        
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "OpenImages" {
            if let destination = segue.destination as? FriendsPhotosCVC{
                if let indexPath = tableView.indexPathForSelectedRow {
                    destination.friendsId = friends[indexPath.row]
                    destination.title = friends[indexPath.row].firstName
                }
            }
        }
    }
    
    
}
    //    var sortedFirstLetters: [String.Index] = []
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


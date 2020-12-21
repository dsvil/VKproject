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
    var undeletedFriends = [ApiGetFriendsVK.VkFriend]()
    
    @IBOutlet weak var search: UISearchBar!
    
    var charactersBeforeSearch = [Character]()
    var sortedFriendsBeforeSearch : [Character: [ApiGetFriendsVK.VkFriend]] = [:]
    
    var filteredFirstCharacters = [Character]()
    var filteredSortedFriends: [Character: [ApiGetFriendsVK.VkFriend]] = [:]


    override func viewDidLoad() {
        super.viewDidLoad()
        
        search.delegate = self
        navigationItem.rightBarButtonItem = editButtonItem
        navigationItem.titleView = avatarView
        ApiGetFriendsVK.getData { [self] friends in
            self.friends = friends
            (filteredFirstCharacters, filteredSortedFriends) = sort(friends)
            (charactersBeforeSearch, sortedFriendsBeforeSearch) = sort(friends)
            tableView.reloadData()
        }
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            search.text = nil
            filteredFirstCharacters = charactersBeforeSearch
            filteredSortedFriends = sortedFriendsBeforeSearch
            view.endEditing(true)
            tableView.reloadData()
        } else {
            var filteredFriends = [ApiGetFriendsVK.VkFriend]()
            if undeletedFriends.isEmpty {
                filteredFriends = friends.filter { friend in
                    friend.firstName.lowercased().contains(searchText.lowercased()) || friend.lastName.lowercased().contains(searchText.lowercased())
                }
            } else {
                filteredFriends = undeletedFriends.filter { friend in
                    friend.firstName.lowercased().contains(searchText.lowercased()) || friend.lastName.lowercased().contains(searchText.lowercased())
                }
            }
            (filteredFirstCharacters, filteredSortedFriends) = sort(filteredFriends)
            tableView.reloadData()
        }

            }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let character = filteredFirstCharacters[section]
        return String(character)
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        filteredFirstCharacters.count
    }

        override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 40))
            view.backgroundColor = UIColor.red
            let label = UILabel(frame: CGRect(x: 15, y: -10, width: tableView.bounds.width - 30, height: 49))
            label.font = UIFont.boldSystemFont(ofSize: 20)
            label.textColor = UIColor.white
            let character = filteredFirstCharacters[section]
            label.text = String(character)
            view.addSubview(label)
            return view
        }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let character = filteredFirstCharacters[section]
        let friendsCount = filteredSortedFriends[character]?.count
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
        
        let character = filteredFirstCharacters[indexPath.section]
        if let char = filteredSortedFriends[character] {
            let friend = char[indexPath.row]
            cell.friendList.text = friend.lastName + " " + friend.firstName
            cell.friendIcon.image = try? UIImage(data: Data(contentsOf: URL(string: friend.icon ) ?? URL(string: "http://www.google.com")!))
            
            return cell
        }
        
        return UITableViewCell()
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let character = filteredFirstCharacters[indexPath.section]
            let indexSet = IndexSet(arrayLiteral: indexPath.section)
            filteredSortedFriends[character]!.remove(at: indexPath.row)
            sortedFriendsBeforeSearch = filteredSortedFriends
            
            let sectionsToDelete = filteredSortedFriends[character]
            if sectionsToDelete?.count == 0 {
                filteredSortedFriends[character] = nil
                sortedFriendsBeforeSearch = filteredSortedFriends
                guard let charToDelete = filteredFirstCharacters.firstIndex(of: character) else { return }
                filteredFirstCharacters.remove(at:charToDelete)
                charactersBeforeSearch = filteredFirstCharacters

                for character in filteredFirstCharacters {
                    for element in filteredSortedFriends[character]! {
                        undeletedFriends.append(element)
                    }
                }
                    tableView.deleteSections(indexSet, with: .left)
            }
            else {
                for character in filteredFirstCharacters {
                    for element in filteredSortedFriends[character]! {
                        undeletedFriends.append(element)
                    }
                }
            tableView.deleteRows(at: [indexPath], with: .middle)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "OpenImages" {
            
            if let destination = segue.destination as? FriendsPhotosCVC{
                if let indexPath = tableView.indexPathForSelectedRow {
                    let character = filteredFirstCharacters[indexPath.section]
                    if let char = filteredSortedFriends[character] {
                        destination.friendsId = char[indexPath.row].id
                        destination.title = char[indexPath.row].firstName}
                }
            }
        }
    }
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
}

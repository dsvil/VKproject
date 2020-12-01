//
//  NewsTVC.swift
//  vk
//
//  Created by Sergei Dorozhkin on 27.11.2020.
//

import UIKit

class NewsTVC: UITableViewController {
    var lines = getLine.myLines()
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lines.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell",
                                                         for: indexPath) as! NewsCell
        let currentLines = lines[indexPath.row]
        cell.title.text = currentLines.header
        cell.avatarImage.image = currentLines.icon
        cell.status.text = currentLines.status
        cell.mainImage = currentLines.mainImage
        return cell
    }
}

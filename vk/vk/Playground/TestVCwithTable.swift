//
//  TestVCwithTable.swift
//  vk
//
//  Created by Дорожкин Сергей on 15.11.2020.
//

import UIKit

class TestVCwithTable: UIViewController, UITableViewDataSource {
    let users: [String] = ["Ivan", "Peter", "Ilya", "Sergei"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TestCell", for: indexPath) as! TestCellForVC_T
        cell.labelInTestCell.text = users[indexPath.row]
        return cell
    }
    
    @IBOutlet weak var testTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        testTableView.dataSource = self
    }
}


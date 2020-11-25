//
//  FriendsPhotosCVC.swift
//  vk
//
//  Created by Дорожкин Сергей on 16.11.2020.
//

import UIKit

class FriendsPhotosCVC: UICollectionViewController {
    var friendsImage:User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return friendsImage.image.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FriendsPhotosCCell", for: indexPath) as! FriendsPhotosCCell
        cell.friendImage.image = friendsImage.image[indexPath.row]
        return cell
    }
    
}





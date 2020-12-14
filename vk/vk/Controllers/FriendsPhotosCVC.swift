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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "OpenImage" {
            if let destination = segue.destination as? FullScreenImageController {
                let indexPath = collectionView.indexPathsForSelectedItems!.first!
                destination.startFromImage = indexPath.row
                destination.friendImages = friendsImage.image
                
            }
        }
    }
}
extension FriendsPhotosCVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = collectionView.bounds.width - 10
        let cellHeight = collectionView.bounds.height
        
        if cellHeight > cellWidth {
            return CGSize(width: cellWidth, height: cellWidth)
        } else {
            return CGSize(width: cellHeight/1.5, height: cellHeight/1.5)}
    }
}





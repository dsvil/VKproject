//
//  FriendsPhotosCVC.swift
//  vk
//
//  Created by Дорожкин Сергей on 16.11.2020.
//

import UIKit

class FriendsPhotosCVC: UICollectionViewController {
    var friendsId:ApiGetFriendsVK.VkFriend!
    var photos = [ApiGetPhotosVK.PhotoStaff]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ApiGetPhotosVK.getData(user: friendsId.id) { [self](photos) in
            self.photos = photos
            collectionView.reloadData()
        }
    }
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FriendsPhotosCCell", for: indexPath) as! FriendsPhotosCCell
        let photo = photos[indexPath.row].sizes[3] // решить что делать с этими индексами
        cell.friendImage.image = try? UIImage(data: Data(contentsOf: URL(string: photo.url ) ?? URL(string: "http://www.google.com")!))
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "OpenImage" {
            if let destination = segue.destination as? FullScreenImageController {
                let indexPath = collectionView.indexPathsForSelectedItems!.first!
                destination.startFromImage = indexPath.row
                destination.friendImages = photos
                
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





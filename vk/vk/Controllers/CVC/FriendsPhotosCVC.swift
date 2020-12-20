//
//  FriendsPhotosCVC.swift
//  vk
//
//  Created by Дорожкин Сергей on 16.11.2020.
//

import UIKit

class FriendsPhotosCVC: UICollectionViewController {
    var friendsId = Int()
    var photos = [ApiGetPhotosVK.PhotoStaff]()
    let size = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ApiGetPhotosVK.getData(user: friendsId) { [self](photos) in
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
        let photo = photos[indexPath.row].sizes[size].url // решить что делать с этими индексами, возможно сюда можно поставить сабскрипт для проверки индексов
        cell.friendImage.image = try? UIImage(data: Data(contentsOf: URL(string: photo ) ?? URL(string: "http://www.google.com" )!))
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





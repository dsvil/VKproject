//
//  NewsCell.swift
//  vk
//
//  Created by Sergei Dorozhkin on 26.11.2020.
//

import UIKit

class NewsCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {

    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var status: UILabel!
    
    @IBOutlet weak var likes: NewsControls!
    @IBOutlet weak var comment: NewsControls!
    @IBOutlet weak var eye: NewsControls!
    @IBOutlet weak var forward: NewsControls!

    @IBOutlet weak var imageCollection: UICollectionView!
    
    @IBAction func likesPressed(_ sender: Any) {
        likes.likes()
        likes.animateAuthButton()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        likes.initSetUp("heart", "0")
        comment.initSetUp("bubble.left", "0", .black)
        eye.initSetUp("eye", "0")
        forward.initSetUp("arrowshape.turn.up.right", "", .black)
    }
    
    @IBAction func commentsPressed(_ sender: Any) {
        comment.countAmount()
        comment.animateAuthButton()
    }
    
    @IBAction func eyePressed(_ sender: Any) {
        eye.countAmount()
        eye.animateAuthButton()
    }
    
    @IBAction func forwardPressed(_ sender: Any) {
        forward.animateAuthButton()
    }

    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageCollection.dataSource = self
        imageCollection.delegate = self
        imageCollection.reloadData()
    }
    var mainImage = [UIImage]()
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mainImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsCVCell", for: indexPath) as! NewsCVCell
        cell.mainImage.image = mainImage[indexPath.row]
        return cell
    }
}
extension NewsCell : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        let width = collectionView.frame.width / 2
        return CGSize(width: width, height: width)
    }
}

//
//  AvatarView.swift
//  vk
//
//  Created by Sergei Dorozhkin on 26.11.2020.
//

import UIKit

class AvatarView: UIView {
    let avatarImgView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: CGRect(x: 0, y: 0, width: 36, height: 44))
        
        // Присваевам изображение аватара
        let avatar = UIImage(named: "g2")
        avatarImgView.image = avatar
        //Задаем режим масштабирования для изображения
        avatarImgView.contentMode = .scaleAspectFill
        //Устанавливаем автоматическое изменение размеров - задаем маски
        avatarImgView.autoresizingMask = [.flexibleLeftMargin, .flexibleTopMargin, .flexibleRightMargin, .flexibleBottomMargin]
        // Добавляем наше ImageView в SuperView - которым является AvatarView
        self.addSubview(avatarImgView)
        
        //Задаем ширину границ,цвет, и обрезаем то что выходит за границы
        avatarImgView.layer.borderWidth = 1.0
        avatarImgView.layer.borderColor = UIColor.red.cgColor
        avatarImgView.clipsToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //При изменении раскладки пересчитываем размеры
        let newHeight = self.frame.size.height - 8.0
        //Собственная область ImageView
        avatarImgView.bounds = CGRect(x: 0, y: 0, width: newHeight, height: newHeight)
        avatarImgView.center = CGPoint(x: self.bounds.midX, y: self.bounds.midY)
        //Задаем закругление у углов
        avatarImgView.layer.cornerRadius = newHeight / 2.0
        avatarImgView.tintColor = UIColor.red
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

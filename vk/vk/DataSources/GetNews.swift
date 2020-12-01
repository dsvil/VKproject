//
//  GetNews.swift
//  vk
//
//  Created by Sergei Dorozhkin on 27.11.2020.
//

import UIKit

struct NewsLine {
    let header: String
    let icon: UIImage
    let status: String
    let mainImage: [UIImage]
    
}

final class getLine {
    
    static func myLines () -> [NewsLine] {
        let one = NewsLine(header: "Вот как бывает", icon: UIImage(named: "news")!, status: "Новый статус", mainImage: [
            UIImage(named: "pr")!,
            UIImage(named: "b2")!,
            UIImage(named: "b3")!,
            UIImage(named: "a1")!,
            UIImage(named: "a2")!,
        ])
        let two = NewsLine(header: "Премьера фильма", icon: UIImage(named: "g1")!, status: "Что скажите?", mainImage: [UIImage(named: "g1")!])
        let three = NewsLine(header: "Снова новости", icon: UIImage(named: "g2")!, status: "Нечего сказать...", mainImage: [UIImage(named: "g2")!])
        let four = NewsLine(header: "Привет из будушего  ", icon: UIImage(named: "g3")!, status: "Жизнь прекрасна!", mainImage: [UIImage(named: "g3")!])
        let five = NewsLine(header: "Уже не знаю, что написать  ", icon: UIImage(named: "g4")!, status: "Новый статус", mainImage: [UIImage(named: "g4")!])
        let six = NewsLine(header: "Программирование огонь!  ", icon: UIImage(named: "g5")!, status: "Привет всем!", mainImage: [UIImage(named: "g5")!])
        let seven = NewsLine(header: "Последняя новость  ", icon: UIImage(named: "skills")!, status: "Надоело...", mainImage: [
            UIImage(named: "skills")!
        ])
        return [one, two, three, four, five, six, seven]
    }
}

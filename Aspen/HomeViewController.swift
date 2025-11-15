//
//  HomeViewController.swift
//  Aspen
//
//  Created by Michael Saakyan on 12.11.2025.
//

import UIKit

class HomeViewController: UIViewController {
    
    lazy var homeTitle: UILabel = {
        let label = UILabel()
        label.text = "Explore"
        label.textColor = .black
        label.font = UIFont(name: "Montserrat-Regular", size: 14)
        
        return label
    }()
    
    lazy var homeTxt: UILabel = {
        let label = UILabel()
        label.text = "Aspen"
        label.textColor = .black
        label.font = UIFont(name: "Montserrat-Medium", size: 32)
        
        return label
    }()
    
    lazy var cardsTitle: UILabel = {
        let label = UILabel()
        label.text = "Popular"
        label.textColor = .clr23
        label.font = UIFont(name: "Montserrat-SemiBold", size: 18)
        
        return label
    }()
    
    lazy var cardsAllTxt: UILabel = {
        let label = UILabel()
        label.text = "See all"
        label.textColor = .travel
        label.font = UIFont(name: "Montserrat-Regular", size: 12)
        
        return label
    }()
    
    lazy var cardOneImage: UIImageView = {
        let imageView = UIImageView()
        // Убедитесь, что изображение с именем "meimg" добавлено в Assets.xcassets
        imageView.image = UIImage(named: "tour_one")
        imageView.contentMode = .scaleAspectFit
        // Располагаем картинку под заголовком
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var cardTwoImage: UIImageView = {
        let imageView = UIImageView()
        // Убедитесь, что изображение с именем "meimg" добавлено в Assets.xcassets
        imageView.image = UIImage(named: "tour_one")
        imageView.contentMode = .scaleAspectFit
        // Располагаем картинку под заголовком
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var cardThreeImage: UIImageView = {
        let imageView = UIImageView()
        // Убедитесь, что изображение с именем "meimg" добавлено в Assets.xcassets
        imageView.image = UIImage(named: "tour_one")
        imageView.contentMode = .scaleAspectFit
        // Располагаем картинку под заголовком
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var tourNameBlock: UIView = {
        let block = UIView()
        block.backgroundColor = .block
        block.layer.cornerRadius = 11.5
        
        return block
    }()
    
    lazy var tourName: UILabel = {
        let label = UILabel()
        label.text = "Alley Palace"
        label.font = UIFont(name: "Montserrat-SemiBold", size: 12)
        label.textColor = .white
        
        return label
    }()
    
    lazy var raitingBlock: UIView = {
        let block = UIView()
        block.backgroundColor = .block
        block.layer.cornerRadius = 11.5
        
        return block
    }()
    
    lazy var raitingImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "raiting")
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        
        return image
    }()
    
    lazy var raitingTxt: UILabel = {
        let label = UILabel()
        label.text = "4.1"
        label.font = UIFont(name: "Montserrat-SemiBold", size: 12)
        label.textColor = .white
        
        return label
    }()

    lazy var popularScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        // Отключаем вертикальные индикаторы прокрутки, оставляем только горизонтальные
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false // Можно поставить false, чтобы скрыть полосу прокрутки
        return scrollView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // --- Эти элементы остаются на главном view и НЕ скроллятся ---
        view.addSubview(homeTitle)
        homeTitle.frame = CGRect(x: 20, y: 64, width: 53, height: 17)

        view.addSubview(homeTxt)
        homeTxt.frame = CGRect(x: 20, y: homeTitle.frame.maxY, width: 103, height: 39)
        
        view.addSubview(cardsTitle)
        cardsTitle.frame = CGRect(x: 20,y: homeTxt.frame.maxY + 30,width: 73,height: 22)
        
        view.addSubview(cardsAllTxt)
        cardsAllTxt.sizeToFit()
        // Используем view.frame.width для надежного позиционирования у правого края
        cardsAllTxt.frame.origin = CGPoint(x: view.frame.width - cardsAllTxt.frame.width - 20, y: homeTxt.frame.maxY + 40)
        
        
        // --- 1. НАСТРАИВАЕМ SCROLL VIEW ---
        view.addSubview(popularScrollView)
        popularScrollView.frame = CGRect(x: 0, y: cardsAllTxt.frame.maxY + 12, width: view.frame.width, height: 240)
        
        
        // --- 2. ДОБАВЛЯЕМ ВСЕ СКРОЛЛЯЩИЕСЯ ЭЛЕМЕНТЫ ВНУТРЬ `popularScrollView` ---
        
        // Добавляем первую карточку
        popularScrollView.addSubview(cardOneImage)
        // ВАЖНО: Координаты теперь относительны `popularScrollView`, поэтому y = 0
        cardOneImage.frame = CGRect(x: 20, y: 0, width: 188, height: 240)
        
        // Добавляем вторую карточку
        popularScrollView.addSubview(cardTwoImage)
        // Ее `x` зависит от первой карточки, а `y` тоже равен 0
        cardTwoImage.frame = CGRect(x: cardOneImage.frame.maxX + 25, y: 0, width: 188, height: 240)
        
        popularScrollView.addSubview(cardThreeImage)
        cardThreeImage.frame = CGRect(x: cardTwoImage.frame.maxX + 25, y: 0, width: 188, height: 240)
        
        // Все элементы на карточке тоже должны быть ВНУТРИ `popularScrollView`
        // Их координаты тоже считаются относительно `popularScrollView`
        
        popularScrollView.addSubview(tourNameBlock)
        tourNameBlock.frame = CGRect(x: cardOneImage.frame.minX + 14, y: 175, width: 99, height: 23)
        
        popularScrollView.addSubview(tourName)
        tourName.frame = CGRect(x: tourNameBlock.frame.minX + 12, y: tourNameBlock.frame.minY + 4, width: 75, height: 15)
        
        popularScrollView.addSubview(raitingBlock)
        raitingBlock.frame = CGRect(x: cardOneImage.frame.minX + 14, y: tourNameBlock.frame.maxY + 6, width: 52, height: 24)
        
        popularScrollView.addSubview(raitingImage)
        raitingImage.frame = CGRect(x: raitingBlock.frame.minX + 12, y: raitingBlock.frame.minY + 6, width: 12, height: 12)
        
        popularScrollView.addSubview(raitingTxt)
        raitingTxt.sizeToFit()
        raitingTxt.frame.origin = CGPoint(x: raitingImage.frame.maxX + 4, y: raitingBlock.frame.minY + 4)
        
        
        // --- 3. УКАЗЫВАЕМ РАЗМЕР КОНТЕНТА (САМЫЙ ВАЖНЫЙ ШАГ!) ---
        let contentWidth = cardThreeImage.frame.maxX + 20 // +20 для отступа справа
        popularScrollView.contentSize = CGSize(width: contentWidth, height: popularScrollView.frame.height)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

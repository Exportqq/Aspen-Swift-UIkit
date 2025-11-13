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

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        view.addSubview(homeTitle)
        homeTitle.frame = CGRect(x: 20, y: 64, width: 53, height: 17)

        view.addSubview(homeTxt)
        homeTxt.frame = CGRect(x: 20, y: homeTitle.frame.maxY, width: 103, height: 39)
        
        view.addSubview(cardsTitle)
        cardsTitle.frame = CGRect(x: 20,y: homeTxt.frame.maxY + 30,width: 73,height: 22)
        
        view.addSubview(cardsAllTxt)
        cardsAllTxt.sizeToFit()
        cardsAllTxt.frame.origin = CGPoint(x: 318,y: homeTxt.frame.maxY + 40)
        
        view.addSubview(cardOneImage)
        cardOneImage.frame = CGRect(x: 20, y: cardsAllTxt.frame.maxY + 30, width: 188, height: 240)
        
        view.addSubview(tourNameBlock)
        tourNameBlock.frame = CGRect(x: 34, y: cardOneImage.frame.minY + 187, width: 99, height: 23)
        
        view.addSubview(tourName)
        tourName.frame = CGRect(x: tourNameBlock.frame.minX + 12, y: tourNameBlock.frame.minY + 4, width: 75, height: 15)
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

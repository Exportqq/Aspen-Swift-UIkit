//
//  ViewController.swift
//  Aspen
//
//  Created by Michael Saakyan on 08.11.2025.
//

import UIKit

class ViewController: UIViewController {
    lazy var pageName: UILabel = {
        let label = UILabel()
        label.text = "Aspen"
        label.font = UIFont(name: "Hiatus", size: 116)
        label.textColor = .white
        label.textAlignment = .center
    
        return label
    }()
    
    lazy var mainPageTxt: UILabel = {
        let label = UILabel()
        label.text = "Plan your"
        label.font = UIFont(name: "Montserrat-Regular", size: 24)
        label.textColor = .white

        return label
    }()
    
    lazy var mainPageTxtTwo: UILabel = {
        let label = UILabel()
        label.text = "Luxurious Vacation"
        label.font = UIFont(name: "Montserrat-SemiBold", size: 40)
        label.textColor = .white
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        
        return label
    }()
    
    lazy var mainButton: GradientButton = {
        let button = GradientButton(title: "Explore")
        // Добавляем действие: self = этот экран, selector = имя функции, touchUpInside = нажатие и отпускание пальца
            button.addTarget(self, action: #selector(didTapExploreButton), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(pageName)
        view.addSubview(mainPageTxt)
        view.addSubview(mainPageTxtTwo)
        view.addSubview(mainButton)
        
        let backgroundImageView = UIImageView(frame: view.bounds)
            
        // 2. Устанавливаем изображение (должно быть в Assets.xcassets)
        backgroundImageView.image = UIImage(named: "aspen_background")
        
        // 3. Настраиваем режим отображения
        backgroundImageView.contentMode = .scaleAspectFill
        
        // 4. Добавляем поддержку автоматического изменения размера
        backgroundImageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // 5. Добавляем на задний план
        view.addSubview(backgroundImageView)
        view.sendSubviewToBack(backgroundImageView)
    }
    
    

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        pageName.frame = CGRect(x: 0, y: 140, width: view.bounds.width, height: 126 )
        
        mainPageTxt.frame = CGRect(x: 32, y: 590, width: 311, height: 45)
        
        mainPageTxtTwo.frame.size.width = view.frame.width - 64
        mainPageTxtTwo.sizeToFit()
        mainPageTxtTwo.frame.origin = CGPoint(x: 32, y: mainPageTxt.frame.maxY + 4)

        let buttonHeight: CGFloat = 56
        mainButton.frame = CGRect(
            x: 32,
            y: mainPageTxtTwo.frame.maxY + 30,
            width: view.frame.width - 64,
            height: buttonHeight
        )
    }
    
    @objc func didTapExploreButton() {
        let nextVC = HomeViewController()
        
        // Опционально: чтобы открылось на весь экран
        nextVC.modalPresentationStyle = .fullScreen
        
        // Используем present вместо push
        self.present(nextVC, animated: true, completion: nil)
    }
}

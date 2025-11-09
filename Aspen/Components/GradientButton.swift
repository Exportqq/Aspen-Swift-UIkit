import UIKit

class GradientButton: UIButton {

    private let gradientLayer = CAGradientLayer()

    init(title: String) {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        setupButtonStyle()
        setupGradient()
        setupShadow() // <-- Добавили настройку тени
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupButtonStyle() {
        translatesAutoresizingMaskIntoConstraints = false
        titleLabel?.font = UIFont(name: "Montserrat-SemiBold", size: 16)
        tintColor = .white
        layer.cornerRadius = 16
        heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    private func setupGradient() {
        // 1. Устанавливаем ВАШИ цвета градиента
        gradientLayer.colors = [
            // #176FF2 -> RGB(23, 111, 242)
            UIColor(red: 23/255.0, green: 111/255.0, blue: 242/255.0, alpha: 1.0).cgColor,
            // #196EEE -> RGB(25, 110, 238)
            UIColor(red: 25/255.0, green: 110/255.0, blue: 238/255.0, alpha: 1.0).cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        layer.insertSublayer(gradientLayer, at: 0)
    }

    // 2. Новый метод для настройки тени
    private func setupShadow() {
        // Цвет тени #1C18F2 с прозрачностью 8%
        layer.shadowColor = UIColor(red: 28/255.0, green: 24/255.0, blue: 242/255.0, alpha: 1.0).cgColor
        layer.shadowOpacity = 0.08 // Прозрачность 8%
        layer.shadowRadius = 33    // Размытие (blur)
        
        // Смещение тени. (0, 10) - тень будет немного ниже кнопки.
        // Можете поставить (0, 0) для эффекта "свечения" ровно за кнопкой.
        layer.shadowOffset = CGSize(width: 0, height: 10)
        
        // ВАЖНО: чтобы тень была видна, этот параметр должен быть false
        layer.masksToBounds = false
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = self.bounds
        
        // Скругляем сам слой градиента, а не всю кнопку
        gradientLayer.cornerRadius = self.layer.cornerRadius
        
        // 3. УДАЛЯЕМ clipsToBounds, чтобы тень была видна
        // self.clipsToBounds = true // <-- ЭТА СТРОКА УДАЛЕНА/ЗАКОММЕНТИРОВАНА
    }
}

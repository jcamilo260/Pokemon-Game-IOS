//
//  UIMenuView.swift
//  Pokemon-Game-IOS
//
//  Created by Juan Camilo Argüelles Ardila on 17/10/23.
//
import UIKit

class UIMenuView: UIView {
    
    private let titleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .black
        label.text = ""
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 50, weight: .heavy)
        return label
    }()
    
    private let logoImage: UIImageView = {
        let image: UIImageView = UIImageView(image: UIImage(named: "pikachuLogo"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
        
    }()
    
    private let menuButton: UIMenuButton = {
        let button: UIMenuButton = UIMenuButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(Datasource.Texts.menuButton, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 80, weight: .black)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.titleLabel?.numberOfLines = 0
        return button
    }()
    
    public var _menuButton: UIMenuButton{
        return self.menuButton
    }
    
    private lazy var vStack: UIStackView = {
        let stack: UIStackView = UIStackView(arrangedSubviews: [self.titleLabel, self.logoImage, self.menuButton])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fill
        
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.layout()
    }
    
    private func layout(){
        self.setupStack()
        self.setupTitle()
        self.setupImage()
        self.setupButton()
    }
    
    private func setupStack(){
        self.addSubview(self.vStack)
        NSLayoutConstraint.activate([
            self.vStack.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.vStack.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.vStack.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.vStack.leadingAnchor.constraint(equalTo: self.leadingAnchor),
        ])
    }
    
    private func setupTitle(){
        NSLayoutConstraint.activate([
            self.titleLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        let finalText: String = Datasource.Texts.menuTitle
        
        var counter: Double = 1
        for index in finalText.indices{
            Timer.scheduledTimer(withTimeInterval: 0.1 * counter, repeats: false) { _ in
                self.titleLabel.text?.append(finalText[index])
            }
            counter += 1
        }
    }
    
    private func setupImage(){
        NSLayoutConstraint.activate([
            self.logoImage.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func setupButton(){
        NSLayoutConstraint.activate([
            self.menuButton.heightAnchor.constraint(equalToConstant: 80),
            self.menuButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            self.menuButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40)
        ])
        
        self.menuButton.alpha = 0
        
        var counter: Int = 0
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] timer in
            counter += 1
            if counter == 1{
                self?.menuButton.doAnimation {
                    let opacityAnimation = CABasicAnimation(keyPath: "opacity")
                    opacityAnimation.fromValue = 0.0
                    opacityAnimation.toValue = 1.0
                    opacityAnimation.duration = 1.0
                    self?.menuButton.layer.add(opacityAnimation, forKey: "opacityAnimation")
                    self?.menuButton.layer.opacity = 1.0
                }
                timer.invalidate()
            }
        }
    }
}


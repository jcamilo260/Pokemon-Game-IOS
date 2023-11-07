//
//  UIGameView.swift
//  Pokemon-Game-IOS
//
//  Created by Juan Camilo Argüelles Ardila on 3/11/23.
//
import UIKit
import Kingfisher

class UIGameView: UIView {

    private let title: UILabel = {
        let label: UILabel = LabelFactory.build(text: "Guess the pokemon", font: .boldSystemFont(ofSize: 40), textAlignment: .center, colorText: .black)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private let image: UIImageView = {
        let image: UIImageView = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let hintLabel: UILabel = {
        let label: UILabel = LabelFactory.build(text: "", font: .boldSystemFont(ofSize: 40), textAlignment: .center, colorText: .black)
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let gameButtons: [UIGameButton] = {
        var buttons: [UIGameButton] = []
        
        for index in 0..<Datasource.NumericInfo.optionsAmount{
            let theButton: UIGameButton = UIGameButton()
            theButton.setTitle("Option \(index)", for: .normal)
            theButton.setTitleColor(.black, for: .normal)
            theButton.titleLabel?.adjustsFontSizeToFitWidth = true
            theButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
            buttons.append(theButton)
            NSLayoutConstraint.activate([
                theButton.heightAnchor.constraint(equalToConstant: 70)
            ])
        }
        return buttons
    }()
    
    public func setImagePic(url: String){
        let url = URL(string: url)
        let effect = ColorControlsProcessor(brightness: -1, contrast: 1, saturation: 1, inputEV: 0)
        self.image.kf.setImage(
            with: url,
            options: [
                .processor(effect)
            ]
        )
    }
    
    private lazy var vStack: UIStackView = {
        let stack: UIStackView = UIStackView(arrangedSubviews: [self.title, self.image, self.hintLabel, self.vStackButtons])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 40
        stack.alignment = .center
        return stack
    }()
    
    private lazy var vStackButtons: UIStackView = {
        let stack: UIStackView = UIStackView(arrangedSubviews: self.gameButtons)
        stack.axis = .vertical
        stack.spacing = 30
        return stack
    }()
    
    public var _gameButtons: [UIGameButton]{
        return self.gameButtons
    }
    
    public func setHintLabel(text: String){
        self.hintLabel.text = text
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.layout()
    }
    
    private func layout(){
        self.backgroundColor = Datasource.Colors.gameBackground
        self.setupVStack()
        self.setupImage()
        self.setupstackButtons()
    }
    
    private func setupVStack(){
        self.addSubview(self.vStack)
        NSLayoutConstraint.activate([
            self.vStack.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.vStack.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.vStack.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.vStack.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
    private func setupImage(){
        NSLayoutConstraint.activate([
            self.image.heightAnchor.constraint(equalToConstant: 150),
        ])
    }
    
    private func setupstackButtons(){
        NSLayoutConstraint.activate([
            self.vStackButtons.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.vStackButtons.leadingAnchor.constraint(equalTo: self.vStack.leadingAnchor, constant: 30),
            self.vStackButtons.trailingAnchor.constraint(equalTo: self.vStack.trailingAnchor, constant: -30)
        ])
    }
}

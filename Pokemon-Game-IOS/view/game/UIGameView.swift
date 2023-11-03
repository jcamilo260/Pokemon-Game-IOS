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
        return label
    }()
    
    private let image: UIImageView = {
        let image: UIImageView = UIImageView(image: UIImage(named: "pikachuLogo"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
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
        let stack: UIStackView = UIStackView(arrangedSubviews: [self.title, self.image])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.backgroundColor = .green
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
        self.backgroundColor = .red
        self.setupVStack()
        self.setupImage()
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
            self.image.heightAnchor.constraint(equalToConstant: 300),
        ])
    }
}

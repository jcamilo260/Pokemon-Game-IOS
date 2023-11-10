//
//  UIResultsView.swift
//  Pokemon-Game-IOS
//
//  Created by Juan Camilo Argüelles Ardila on 9/11/23.
//

import UIKit

class UIResultsView: UIView {

    private let title: UILabel = {
        let title: UILabel = LabelFactory.build(text: Datasource.Texts.resultsTitle, font: UIFont.systemFont(ofSize: 30, weight: .black), textAlignment: .center, colorText: .black)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private let score: UILabel = {
        let title: UILabel = LabelFactory.build(text: "0", font: UIFont.systemFont(ofSize: 40, weight: .bold), textAlignment: .center, colorText: .black)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private let retryButton: UIMenuButton = {
        let button: UIMenuButton = UIMenuButton()
        button.setTitle(Datasource.Texts.retryButton, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30, weight: .black)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    public var _retryButton: UIMenuButton{
        return self.retryButton
    }

    public var _score: UILabel{
        return self.score
    }
    
    private lazy var stack: UIStackView = {
        let stack: UIStackView = UIStackView(arrangedSubviews: [self.title, self.score, self.retryButton])
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    public func setScore(score: String){
        self.score.text = score
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
        self.backgroundColor = Datasource.Colors.resultsBackground
        self.setupStackConstraints()
    }
    
    private func setupStackConstraints(){
        self.addSubview(self.stack)
        NSLayoutConstraint.activate([
            self.stack.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.stack.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    
}

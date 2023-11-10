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
    
    private lazy var stack: UIStackView = {
        let stack: UIStackView = UIStackView(arrangedSubviews: [self.title])
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
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
        self.backgroundColor = .purple
        //self.setupStackConstraints()
        //self.backgroundColor = Datasource.Colors.resultsBackground
    }
    
    private func setupStackConstraints(){
        self.addSubview(self.stack)
        NSLayoutConstraint.activate([
            self.stack.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.stack.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    
}

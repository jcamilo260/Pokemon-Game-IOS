//
//  ResultsViewController.swift
//  Pokemon-Game-IOS
//
//  Created by Juan Camilo Argüelles Ardila on 9/11/23.
//

import UIKit

class ResultsViewController: UIViewController {

    private let resultsView: UIResultsView = UIResultsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupResultsView()
        self.setupButtonAction()
    }
    
    public func setInitialData(resultScore: String){
        self.resultsView.setScore(score: resultScore)
    }
    
    private func setupResultsView(){
        self.view.addSubview(self.resultsView)
        self.resultsView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.resultsView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.resultsView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.resultsView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.resultsView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        ])
    }
    
    private func setupButtonAction(){
        self.resultsView._retryButton.addTarget(self, action: #selector(self.buttonAction), for: .touchUpInside)
    }
    
    @objc private func buttonAction(_ sender: UIMenuButton){
        self.dismiss(animated: true)
    }
    
    
    
}

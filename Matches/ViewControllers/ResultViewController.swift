//
//  ResultViewController.swift
//  Matches
//
//  Created by Domagoj Bunoza on 11.08.2021..
//

import UIKit

class ResultViewController : UIViewController {
    
    let calculationResult : Int
    let numberOfMatches : Int
    
    init(calculationResult : Int, numberOfMatches : Int) {
        self.calculationResult = calculationResult
        self.numberOfMatches = numberOfMatches
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let resultLabel : ResultLabel = {
        let temp = ResultLabel()
        return temp
    }()
    
    let descLabel : UILabel = {
        let temp = UILabel()
        temp.text = "The largest natural number is: "
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    let firstImage : MatchView = {
        let temp = MatchView()
        temp.setImage(picName: "0")
        return temp
    }()
    
    let secondImage : MatchView = {
        let temp = MatchView()
        temp.setImage(picName: "0")
        return temp
    }()
    
    let thirdImage : MatchView = {
        let temp = MatchView()
        temp.setImage(picName: "0")
        return temp
    }()
    
    let fourthImage : MatchView = {
        let temp = MatchView()
        temp.setImage(picName: "0")
        return temp
    }()
    
    let stackView : UIStackView = {
       let temp = UIStackView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.axis = .horizontal
        temp.spacing = 15
        temp.distribution = .fillEqually
        return temp
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        setConstraints()
        resultLabel.addResult(result: self.numberOfMatches)
    }
    
    func setMatchViews() -> Void {
        let digits = String(self.calculationResult).compactMap{ $0.wholeNumberValue }
        let images = [fourthImage, thirdImage, secondImage, firstImage]
        for i in 0...digits.count - 1 {
            images[i].setImage(picName: String(digits[digits.count - 1 - i]))
        }
    }
    
    func setupViews() -> Void {
        stackView.addArrangedSubview(firstImage)
        stackView.addArrangedSubview(secondImage)
        stackView.addArrangedSubview(thirdImage)
        stackView.addArrangedSubview(fourthImage)
        view.addSubview(resultLabel)
        view.addSubview(descLabel)
        view.addSubview(stackView)
        setMatchViews()
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            resultLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            resultLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            resultLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            descLabel.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 30),
            descLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackView.topAnchor.constraint(equalTo: descLabel.bottomAnchor, constant: 30),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }
}

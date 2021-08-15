//
//  ResultLabel.swift
//  Matches
//
//  Created by Domagoj Bunoza on 11.08.2021..
//

import UIKit

class ResultLabel : UIView {
    
    let label : UILabel = {
        let temp = UILabel()
        temp.numberOfLines = 0
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    func addResult(result : Int) -> Void {
        let fixPart = NSAttributedString(string: "The total number of matches required to display all numbers is: ")
        let varPart = NSAttributedString(string: String(result), attributes: [.foregroundColor : UIColor.brown, .font : UIFont(name: "Arial Bold", size: 18)!])
        let comb = NSMutableAttributedString()
        comb.append(fixPart)
        comb.append(varPart)
        label.attributedText = comb
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setConstraints()
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() -> Void {
        self.addSubview(label)
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            label.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
}

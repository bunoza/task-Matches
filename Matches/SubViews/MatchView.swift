//
//  MatchView.swift
//  Matches
//
//  Created by Domagoj Bunoza on 11.08.2021..
//

import UIKit

class MatchView : UIView {
    
    let image : UIImageView = {
        let temp = UIImageView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setConstraints()
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setImage(picName : String) -> Void {
        image.image = UIImage.resizeImage(image: UIImage(named: picName)!, targetSize: CGSize(width: 100.0, height: 100.0))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        self.addSubview(image)
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: self.topAnchor),
            image.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            image.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
}

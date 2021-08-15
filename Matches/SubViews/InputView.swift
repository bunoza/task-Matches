//
//  InputView.swift
//  Matches
//
//  Created by Domagoj Bunoza on 11.08.2021..
//

import UIKit

class InputView : UIView, UITextFieldDelegate {
    
    let textField : UITextField = {
        let temp = UITextField()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.textAlignment = .left
        temp.setBottomBorder()
        return temp
    }()
    
    func setPlaceholder(text: String) -> Void {
        textField.placeholder = text
    }
    
    func getText() -> String {
        return textField.text!
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setConstraints()
        textField.delegate = self
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        self.addSubview(textField)
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: self.topAnchor),
            textField.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            textField.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            textField.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let textFieldText = textField.text,
                let rangeOfTextToReplace = Range(range, in: textFieldText) else {
                    return false
            }
        let substringToReplace = textFieldText[rangeOfTextToReplace]
        let count = textFieldText.count - substringToReplace.count + string.count
        return (string == "" || Int(string) != nil) && count < 5
        }
    
}

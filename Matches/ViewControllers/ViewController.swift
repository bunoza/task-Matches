//
//  ViewController.swift
//  Matches
//
//  Created by Domagoj Bunoza on 11.08.2021..
//

import UIKit

class ViewController: UIViewController, UIViewControllerTransitioningDelegate {
    
    let highestTextField : InputView = {
        let temp = InputView()
        temp.setPlaceholder(text: "Highest result number")
        return temp
    }()
    
    let matchesTextField : InputView = {
        let temp = InputView()
        temp.setPlaceholder(text: "Number of matches")
        return temp
    }()
    
    let button : UIButton = {
        let temp = UIButton()
        temp.backgroundColor = .brown
        temp.setTitle("Calculate", for: .normal)
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.addTarget(self, action: #selector(click(_sender:)), for: .touchUpInside)
        return temp
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setTitle()
        setupViews()
        setConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        button.roundedButton()
    }
    
    func setTitle() -> Void {
            self.navigationItem.title = "MATCHES";
        }
    
    func showResults(controller: ResultViewController) -> Void {
        controller.modalPresentationStyle = .overCurrentContext
        controller.transitioningDelegate = self
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc func click(_sender: UIButton!) -> Void {
        guard highestTextField.getText().isEmpty || matchesTextField.getText().isEmpty else {
            return showResults(controller: calculate())
        }
    }
    
    func calculate() -> ResultViewController {
        let calculator = Calculator(limit: Int(highestTextField.getText())!, matches: Int(matchesTextField.getText())!)
        let controller = ResultViewController(calculationResult: calculator.calculateLargestNaturalNumber(), numberOfMatches: calculator.getNumberOfMatches())
        return controller
    }

    func setupViews() -> Void {
        view.addSubview(highestTextField)
        view.addSubview(matchesTextField)
        view.addSubview(button)
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            highestTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            highestTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            highestTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            matchesTextField.topAnchor.constraint(equalTo: highestTextField.bottomAnchor, constant: 30),
            matchesTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            matchesTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            button.topAnchor.constraint(equalTo: matchesTextField.bottomAnchor, constant: 30),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            button.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
}


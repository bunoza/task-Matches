//
//  Calculator.swift
//  Matches
//
//  Created by Domagoj Bunoza on 11.08.2021..
//

import UIKit

class Calculator {
    
    let limit : Int
    let matches : Int
    
    var numberOfMatches : Int
    
    var matchesAmount: [Int : Int] = [0 : 6, 1 : 2, 2 : 5, 3 : 5, 4 : 3, 5 : 5, 6 : 6, 7 : 3, 8 : 7, 9 : 6]
    
    init(limit : Int, matches : Int) {
        self.limit = limit
        self.matches = matches
        self.numberOfMatches = 0
    }
    
    func calculateLargestNaturalNumber() -> Int {
        for num in (1...limit).reversed() {
            let digits = String(num).compactMap{ $0.wholeNumberValue }
            var sum = 0
            for i in 0...digits.count - 1 {
                sum += matchesAmount[digits[i]]!
            }
            if sum <= self.matches {
                print(num)
                numberOfMatches = sum
                return num
            }
        }
        return 0
    }
    
    func getNumberOfMatches() -> Int {
        return self.numberOfMatches
    }
    
}

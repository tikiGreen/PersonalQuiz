//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 12.02.2024.
//

import UIKit

final class ResultViewController: UIViewController {
    
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    var answersChosen: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let result = getResult(of: answersChosen)
        resultLabel.text = "Вы - \(result.rawValue)"
        descriptionLabel.text = result.definition
        navigationItem.hidesBackButton = true
    }
    
    @IBAction func doneButtonAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    deinit {
        print("\(type(of: self)) has been deallocated")
    }
    
    private func getResult(of answersChosen: [Answer]) -> Animal {
        
        let numberOfAnswers = answersChosen.reduce(into: [:]) {
            counts, letter in counts[letter.animal, default: 0] += 1
        }
        let result = numberOfAnswers.sorted(by: {$0.value > $1.value})
        return result[0].key
    }
}

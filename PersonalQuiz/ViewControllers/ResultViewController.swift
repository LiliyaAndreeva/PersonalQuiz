//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 07.08.2023.
//

import UIKit

final class ResultViewController: UIViewController {

    @IBOutlet weak var youAreAnimalLabel: UILabel!
    @IBOutlet weak var animalDescribeLabel: UILabel!
    
    var answersChosen: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        findAnimal()
    }
    
  @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
      dismiss(animated: true)
  }
    
    deinit {
        print("\(type(of: self)) has been deallocated")
    }
}

extension ResultViewController {
    private func findAnimal() {
          
    answersChosen.forEach {_ in
          
          let doubles = Dictionary(grouping: answersChosen, 
                                   by: {$0.animal}).filter
                        { $1.count > 1 }.keys
          
          if !doubles.isEmpty {
              
              let animalCharacthers = (doubles.first?.rawValue)!
              
              switch animalCharacthers {
              case "🐶":
                  getAnimal(animal: animalCharacthers, describe: Animal.dog.definition)
              case "🐱":
                  getAnimal(animal: animalCharacthers, describe: Animal.dog.definition)
              case "🐰":
                  getAnimal(animal: animalCharacthers, describe: Animal.dog.definition)
              default:
                  getAnimal(animal: animalCharacthers, describe: Animal.dog.definition)
              }
          } else if doubles.isEmpty || doubles.count == 2 {
              getAnimal(animal: "🐙", describe: "Вы - осьминог! Пройдите тест заново 😉")
          }
      }
  }
  
  private func getAnimal(animal: Character, describe: String) {
      youAreAnimalLabel.text = "Вы - \(animal)!"
      animalDescribeLabel.text = describe
  }
}

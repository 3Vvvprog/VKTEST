//
//  SettingsViewController.swift
//  VKPET
//
//  Created by Вячеслав Вовк on 23.03.2024.
//


import UIKit


private func generatePersons(count: Int) -> [Person] {
    var persons = [Person]()
    
    for i in 0..<count {
        persons.append(Person(id: i, isInfection: false))
        print(persons[i].id)
    }
    return persons
   
}

final class GameViewController: UIViewController, ViewHostable {
    
    @Published var persons = Persons(persons: generatePersons(count: GameSettings.groupSize))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.navigationItem.setHidesBackButton(true, animated: false)
        self.add(hostableView: GameView(gameSettings: GameSettings.groupSize, persons: persons))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
        self.navigationItem.setHidesBackButton(true, animated: false)
    }
}


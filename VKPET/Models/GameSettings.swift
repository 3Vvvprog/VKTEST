//
//  GameSettings.swift
//  VKPET
//
//  Created by Вячеслав Вовк on 23.03.2024.
//

import Foundation
import Combine

struct GameSettings {
    static var groupSize: Int = 0
    static var infectionFactor: Int = 0
    static var time: Int = 0
}



class Person: Identifiable, ObservableObject, Equatable {
    static func == (lhs: Person, rhs: Person) -> Bool {
        true
    }
    
    var id: Int
    @Published var isInfection: Bool
    
    init(id: Int, isInfection: Bool) {
        self.id = id
        self.isInfection = isInfection
    }
}


class Persons: ObservableObject {
    var persons: [Person]
    
    init(persons: [Person]) {
        self.persons = persons
    }
}



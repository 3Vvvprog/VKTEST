//
//  PersonCell.swift
//  VKPET
//
//  Created by Вячеслав Вовк on 23.03.2024.
//

import SwiftUI

struct PersonCell: View {
    @ObservedObject var person: Person
    @ObservedObject var persons: Persons
    
    
    private let timer = Timer.publish(every: TimeInterval(GameSettings.time), on: .main, in: .common).autoconnect()
    
    var body: some View {
        Rectangle()
            .fill(person.isInfection ? Color.red : Color.green)
            .frame(width: (UIScreen.main.bounds.width - 60) / 3, height: (UIScreen.main.bounds.width - 60) / 3)
            .onTapGesture {
                persons.persons[self.person.id].isInfection = true
                self.persons.objectWillChange.send()
            }
            .onReceive(timer, perform: { _ in
                DispatchQueue.global(qos: .userInitiated).async {
                    infect()
                }
            })
    }
        
    
    
    private func infect() {
        guard self.person.isInfection == true else {
            return
        }
        var sosedi = [Int]()
        
        if self.person.id % 3 == 1 {
            if self.person.id - 3 >= 0 {
                if !persons.persons[self.person.id - 3].isInfection {
                    sosedi.append(self.person.id - 3)
                }
            }
            if self.person.id - 1 >= 0 {
                if !persons.persons[self.person.id - 1].isInfection {
                    sosedi.append(self.person.id - 1)
                }
            }
            
            if self.person.id + 3 < GameSettings.groupSize {
                if !persons.persons[self.person.id + 3].isInfection {
                    sosedi.append(self.person.id + 3)
                }
            }
            
            if self.person.id + 1 < GameSettings.groupSize {
                if !persons.persons[self.person.id + 1].isInfection {
                    sosedi.append(self.person.id + 1)
                }
            }
        }else if self.person.id % 3 == 0 {
            if self.person.id - 3 >= 0 {
                if !persons.persons[self.person.id - 3].isInfection {
                    sosedi.append(self.person.id - 3)
                }
            }
            
            if self.person.id + 3 < GameSettings.groupSize {
                if !persons.persons[self.person.id + 3].isInfection {
                    sosedi.append(self.person.id + 3)
                }
            }
            
            if self.person.id + 1 < GameSettings.groupSize {
                if !persons.persons[self.person.id + 1].isInfection {
                    sosedi.append(self.person.id + 1)
                }
            }
        }else if self.person.id % 3 == 2 {
            if self.person.id - 3 >= 0 {
                if !persons.persons[self.person.id - 3].isInfection {
                    sosedi.append(self.person.id - 3)
                }
            }
            if self.person.id - 1 >= 0 {
                if !persons.persons[self.person.id - 1].isInfection {
                    sosedi.append(self.person.id - 1)
                }
            }
            
            if self.person.id + 3 < GameSettings.groupSize {
                if !persons.persons[self.person.id + 3].isInfection {
                    sosedi.append(self.person.id + 3)
                }
            }
        }
        
        for i in 0..<GameSettings.infectionFactor {
            if let personID = sosedi.randomElement() {
                
                sosedi = sosedi.filter { $0 != personID }
                DispatchQueue.main.async {
                    persons.persons[personID].isInfection = true
                    self.persons.objectWillChange.send()
                }
            }
        }
        
        
        
        
    }
}

//#Preview {
//    PersonCell(person: Person(id: 0, isInfection: true))
//}

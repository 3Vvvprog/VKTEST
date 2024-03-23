//
//  GameView.swift
//  VKPET
//
//  Created by Вячеслав Вовк on 23.03.2024.
//

import SwiftUI


struct GameView: View {
    var gameSettings: Int
    @ObservedObject var persons: Persons
    
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color(uiColor: UIColor(red: 2/255.0, green: 119/255.0, blue: 255/255.0, alpha: 1.000)))
                .ignoresSafeArea()
            
            VStack {
                Text("Параметры игры")
                    .foregroundStyle(Color.white)
                    .font(.system(size: 30, weight: .bold))
                    .padding(.bottom, 10)
                
                HStack {
                    Text("Заражено: \(self.persons.persons.filter { $0.isInfection }.count)")
                        .foregroundStyle(Color.white)
                        .font(.system(size: 20, weight: .medium))
                    Spacer()
                    Text("Не заражено: \(self.persons.persons.filter { !$0.isInfection }.count)")
                        .foregroundStyle(Color.white)
                        .font(.system(size: 20, weight: .medium))
                }
                .padding(.horizontal, 20)
                
                ScrollView(.vertical) {
                    LazyVGrid(columns: Array(repeating: GridItem(spacing: 10), count: 3), spacing: 10, content: {
                        ForEach(self.persons.persons) {person in
                            PersonCell(person: person, persons: self.persons)
                        }
                    })
                }
                .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height)
                .background(Color.white)
                .padding(.horizontal, 20)
                
                Button(action: {
                    AppRouter.shared.back()
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.white)
                            .frame(width: 150, height: 50)
                        
                        Text("Стоп")
                            .foregroundStyle(Color(uiColor: UIColor(red: 2/255.0, green: 119/255.0, blue: 255/255.0, alpha: 1.000)))
                            .font(.system(size: 24, weight: .medium))
                    }
                })
                
                Spacer()
            }
        }
//        .onChange(of: self.persons) { oldValue, newValue in
//            print(newValue)
//        }
    }
}

//#Preview {
//    GameView(gameSettings: 10)
//}

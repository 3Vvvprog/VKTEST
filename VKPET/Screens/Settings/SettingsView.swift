//
//  SettingsView.swift
//  VKPET
//
//  Created by Вячеслав Вовк on 23.03.2024.
//

import SwiftUI
import Combine

struct SettingsView: View {
    @State private var groupSize = ""
    @State private var infectionFactor: String = ""
    @State private var time: String = ""
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color(uiColor: UIColor(red: 2/255.0, green: 119/255.0, blue: 255/255.0, alpha: 1.000)))
                .ignoresSafeArea()
            VStack {
                Text("Параметры игры")
                    .foregroundStyle(Color.white)
                    .font(.system(size: 30, weight: .bold))
                Spacer()
            }
            
            VStack {
                VStack {
                    
                    HStack {
                        Text("Колличество людей")
                            .foregroundStyle(Color.white)
                            .font(.system(size: 22, weight: .regular))
                        Spacer()
                            
                        TextField("", text: $groupSize)
                            .keyboardType(.numberPad)
                            .background(Color.clear)
                            .textFieldStyle(.roundedBorder)
                            .frame(width: 60, height: 40)
                            .onReceive(Just(groupSize)) { newValue in
                                            let filtered = newValue.filter { "0123456789".contains($0) }
                                            if filtered != newValue {
                                                self.groupSize = filtered
                                            }
                                        }
                        
                    
                    }
                    .padding(.horizontal,20)
                    .padding(.vertical,20)
                    
                    HStack {
                        Text("Колличество заражений")
                            .foregroundStyle(Color.white)
                            .font(.system(size: 22, weight: .regular))
                        Spacer()
                        TextField("", text: $infectionFactor)
                            .keyboardType(.numberPad)
                            .background(Color.clear)
                            .textFieldStyle(.roundedBorder)
                            .frame(width: 60, height: 40)
                            .onReceive(Just(infectionFactor)) { newValue in
                                            let filtered = newValue.filter { "0123456789".contains($0) }
                                            if filtered != newValue {
                                                self.infectionFactor = filtered
                                            }
                                        }
                    }
                    .padding(.horizontal,20)
                    .padding(.vertical,20)
                    
                    HStack {
                        Text("Период пересчета (1 - 4сек)")
                            .foregroundStyle(Color.white)
                            .font(.system(size: 22, weight: .regular))
                        Spacer()
                        TextField("", text: $time)
                            .keyboardType(.numberPad)
                            .background(Color.clear)
                            .textFieldStyle(.roundedBorder)
                            .frame(width: 60, height: 40)
                            .onReceive(Just(time)) { newValue in
                                            let filtered = newValue.filter { "0123456789".contains($0) }
                                            if filtered != newValue {
                                                self.time = filtered
                                            }
                                        }
                    }
                    .padding(.horizontal,20)
                    .padding(.vertical,20)
                }
                .padding(.vertical, 40)
                Button(action: {
                    GameSettings.groupSize = Int(self.groupSize)!
                    GameSettings.infectionFactor = Int(self.infectionFactor)!
                    GameSettings.time = Int(self.time)!
                    AppRouter.shared.move(to: .game, type: .push(animated: true))
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.white)
                            .frame(width: 150, height: 50)
                        
                        Text("Старт")
                            .foregroundStyle(Color(uiColor: UIColor(red: 2/255.0, green: 119/255.0, blue: 255/255.0, alpha: 1.000)))
                            .font(.system(size: 24, weight: .medium))
                    }
                })
                
            }
            
        }
    }
}

#Preview {
    SettingsView()
}

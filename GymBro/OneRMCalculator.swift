//
//  OneRMCalculator.swift
//  GymBro
//
//  Created by Theresia Angela Ayrin on 15/07/24.
//

import SwiftUI

struct OneRMCalculator: View {
    @State private var epic: Int = 0
    @State private var showEpic1: Bool = true
    @State private var showEpic2: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Estimate Your")
                .font(
                    Font.custom("SF Pro", size: 34)
                        .weight(.bold)
                )
                .foregroundColor(.black)
                .padding(.horizontal, 30)
                .padding(.top, 0)
                .padding(.bottom, 600)
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .background(.white)
        }
            
        VStack {
            Picker("What Epic", selection: $epic) {
                Text("1 Rep Max").tag(0)
                Text("Training Weight").tag(1)
            }
            .pickerStyle(.segmented)
            .onChange(of: epic) {
                print("Selected tag: \(epic)")
                switch epic {
                case 0:
                    showEpic1 = true
                    showEpic2 = false
                case 1:
                    showEpic1 = false
                    showEpic2 = true
                default:
                    break
                }
            }
        }
        .frame(width: 293, alignment: .center)
        .background(Color(red: 0.46, green: 0.46, blue: 0.5).opacity(0.12))
        .cornerRadius(9)
        .position(CGPoint(x: 200, y: -570))
        
        VStack{
            if showEpic1 {
                Epic1()
            }
            
            if showEpic2 {
                Epic2()
            }
        }
        .position(CGPoint(x: 200, y: -300))
    }
}

#Preview{
    OneRMCalculator()
}


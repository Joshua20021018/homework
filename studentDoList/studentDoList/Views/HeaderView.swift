//
//  HeaderView.swift
//  studentDoList
//
//  Created by Joshua on 30/1/2024.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subtitle: String
    let angle: Double
    let backgrand: Color
    
    var body: some View {
            ZStack {
                RoundedRectangle(cornerRadius: 0)
                    .foregroundColor(backgrand)
                    .rotationEffect(Angle(degrees: angle))
                    
                VStack {
                    Text(title)
                        .font(.system(size: 50))
                        .foregroundColor(Color.white)
                        .bold()
                    
                    Text(subtitle)
                        .font(.system(size: 30))
                        .foregroundColor(Color.white)
                }
                .padding(.top, 80)
            }
            .frame(width: UIScreen.main.bounds.width * 3, height: 350)
            .offset(y: -150)
            
    }
}

#Preview {
    HeaderView(title: "Title", subtitle: "Subtitle", angle: 15, backgrand: .blue)
}

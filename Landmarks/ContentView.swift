//  ContentView.swift
//  Landmarks
//  Created by Adam West on 21.12.2023.

import SwiftUI

/*struct ContentView: View {
    var body: some View { // some means that you can use only one view
            VStack(alignment: .leading, spacing: -3) {
                Text("Turtle Rock")
                    .font(.title)
                HStack {
                    Text("Joshua Tree National Park")
                        .font(.subheadline)
                    // Divider() полоса по центру стека
                    
                    Text("California")
                        .font(.subheadline)
                    // Spacer() // отодвигаю к краю экрана
                    //Spacer().frame(height: 10)
                }
            } .padding(.leading, 30)
            //.padding(25) // отступы по краям стека со всех сторон внутри самого стека
        Spacer()
        }
}*/

struct ContentView: View {
    var body: some View {
        VStack() {
            MapView()
                .frame(height: 300)
            ImageApple()
                .offset(y: -130)
                .padding(.bottom, -130)
            VStack(spacing: -10) {
                TextView()
                Divider()
                TextViewTwo()
            }
        }
        Spacer()
    }
}

struct TextView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Turtle Rock")
                .font(.title)
            HStack {
                Text("Joshua Tree National Park")
                Spacer()
                Text("California")
            }
            .font(.subheadline)
            .foregroundStyle(.secondary)
        }.padding()
    }
}

struct TextViewTwo: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("About Turtle Rock")
                .font(.title2)
            HStack {
                Text("Descriptive text goes here.")
                Spacer()
            }
            .font(.subheadline)
            .foregroundStyle(.secondary)
        }.padding()
    }
}

#Preview {
    ContentView()
}


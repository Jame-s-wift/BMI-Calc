//
//  ContentView.swift
//  BMI Calc
//
//  Created by James Toh on 26/4/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View{
        VStack{
            TabView{
                HomeView()
                    .tabItem{
                        Label("Calculate",systemImage: "chart.bar.doc.horizontal")
                    }
                
                HealthTipsView()
                    .tabItem{
                        Label("Health Tips",systemImage: "heart.text.square")
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

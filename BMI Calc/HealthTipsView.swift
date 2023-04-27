//
//  HealthTipsView.swift
//  BMI Calc
//
//  Created by James Toh on 26/4/23.
//

import SwiftUI

struct HealthTipsView: View {
    
    @State private var currentTip = ""

    let healthTips = [
        "Eat a balanced diet with plenty of fruits and vegetables",
        "Drink plenty of water to stay hydrated",
        "Get regular exercise, such as 30 minutes of brisk walking each day",
        "Get enough sleep each night (7-9 hours for adults)",
        "Limit your intake of processed and sugary foods",
        "Quit smoking and avoid secondhand smoke",
        "Limit your alcohol consumption to moderate levels",
        "Wash your hands regularly to prevent the spread of germs",
        "Wear sunscreen to protect your skin from the sun's harmful rays",
        "Get regular check-ups and screenings to catch health problems early",
        "Take care of your mental health by practicing relaxation techniques and seeking support when needed",
        "Practice safe sex to protect yourself from sexually transmitted infections",
        "Manage stress through meditation, yoga, or other stress-reduction techniques",
        "Practice good hygiene by brushing and flossing your teeth regularly",
        "Avoid sitting for long periods of time and take breaks to stretch and move around"
    ]

    
    var body: some View {
        VStack{
            Text("Here are some health tips!")
                .fontWeight(.heavy)
                .font(.largeTitle)
                .multilineTextAlignment(.center)
            
            ZStack{
                Color.gray.opacity(0.2)
                Text(currentTip)
                    .padding()
                    .fontWeight(.medium)
                    .font(.title)
                    .multilineTextAlignment(.center)
            }
            .cornerRadius(15)
            .frame(height: 400)
            .padding()
            
            Button{
                withAnimation(.easeOut(duration: 0.1)){
                    currentTip = healthTips.randomElement() ?? ""
                }
            } label: {
                HStack{
                    Text("Next tip")
                    Image(systemName: "chevron.right")
                        .font(.title)
                }
                .padding()
                .background(.blue)
                .foregroundColor(.white)
                .cornerRadius(15)
                .padding()
            }
            
        }
        .onAppear{
            currentTip = healthTips.randomElement() ?? ""
        }
    }
}

struct HealthTipsView_Previews: PreviewProvider {
    static var previews: some View {
        HealthTipsView()
    }
}

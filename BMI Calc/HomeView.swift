//
//  HomeView.swift
//  BMI Calc
//
//  Created by James Toh on 26/4/23.
//

import SwiftUI

struct HomeView: View {
    
    @State private var height: Double = 150
    @State private var mass: Double = 42
    @State private var bmi: Double = 0.0
    @State private var healthStatus = "Healthy"
    @State private var healthAdvise = "Keep up the good work! Continue eating your 1 portion of protein, 1 more of carbos, and 2 of fruits and veg!"
    @State private var isSheetPresented = true
    @State private var hasAppeared = false
    
    var body: some View {
        ZStack{
            
            VStack {
                
                Spacer()
                
                HStack{
                    Image(systemName: "barometer")
                    Text("BMI Calc")
                }
                .font(.largeTitle)
                .bold()
                .foregroundColor(.gray)
                .padding()
                .background(.white)
                .cornerRadius(15)
                
                Spacer()
                
                Text("Your BMI is \(String(format: "%.1f", bmi))")
                    .font(.title2)
                    .bold()
                    .padding()
                //                    .background(.blue.opacity(0.7))
                //                    .cornerRadius(15)
                //
                Spacer()
                
                VStack{
                    Text(healthStatus)
                        .font(.title)
                        .bold()
                        .padding()
                        .multilineTextAlignment(.center)
                        .background(.blue.opacity(0.2))
                        .cornerRadius(15)
                        .frame(height: 60)
                        .minimumScaleFactor(0.5)
                    
                    Text(healthAdvise)
                        .font(.title2)
                        .padding()
                        .multilineTextAlignment(.center)
                }
                .padding()
                .background(.gray.opacity(0.2))
                .cornerRadius(15)
                .padding()
                .frame(height: 300)
                
                List{
                    Stepper("Your mass currently is \(Int(mass) ) kg",
                            onIncrement: {
                        mass += 1
                        
                    }
                            , onDecrement: {
                        mass -= 1
                    })
                    
                    Stepper("Your height currently is \(Int(height)) cm",
                            onIncrement: {
                        height += 1
                        
                    }
                            , onDecrement: {
                        height -= 1
                    })
                }
                .frame(height: 120)
                .listStyle(.inset)
                
                Group {
                    Spacer()
                    
                    Button{
                        bmi = mass / ((height / 100) * (height / 100))
                        
                        updateHealth()
                    } label: {
                        Text("calculate BMI")
                            .padding()
                            .background(.blue)
                            .cornerRadius(15)
                            .foregroundColor(.white)
                            .padding()
                    }
                    
                    Spacer()
                    Spacer()
                    Spacer()
                }
                
                
            }
            .onAppear{
                bmi = mass / ((height / 100) * (height / 100))
                if hasAppeared {
                    
                } else{
                    isSheetPresented = true
                    hasAppeared = true
                }
            }
        }
        .sheet(isPresented: $isSheetPresented){
            helpView()
        }
    }
    
    
    func updateHealth(){
        if bmi < 15.5 {
            let idealWeight = 18.5 * (height/100) * (height/100)
            let massDifference = idealWeight - mass
            
            healthStatus = "Serverely Underweight"
            healthAdvise = "You are in extreme need to eat more! You have to eat \(Int(massDifference))kg"
        }  else if bmi < 18.5 {
            let idealWeight = 18.5 * (height/100) * (height/100)
            let massDifference = idealWeight - mass
            
            healthStatus = "Underweight"
            healthAdvise = "You need to eat more! You have to eat \(Int(massDifference))kg"
        } else if bmi > 24.9 {
            let idealWeight = 24.9 * (height/100) * (height/100)
            let massDifference = idealWeight - mass
            
            healthStatus = "Overweight"
            
            healthAdvise = "You need to exercise more! You have to work off \(Int(massDifference * -1))kg"
        }else if bmi > 24.9 {
            let idealWeight = 24.9 * (height/100) * (height/100)
            let massDifference = idealWeight - mass
            
            healthStatus = "Overweight"
            
            healthAdvise = "You need to exercise more! You have to work off \(Int(massDifference * -1))kg"
        }else{
            healthAdvise = "Keep up the good work! Continue eating your 1 portion of protein, 1 more of carbos, and 2 of fruits and veg!"
            
            healthStatus = "Healthy"
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


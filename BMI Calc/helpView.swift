//
//  helpView.swift
//  BMI Calc
//
//  Created by James Toh on 26/4/23.
//

import SwiftUI

struct helpView: View {
    
    @State private var title = [
    "Welcome to BMI Calc!", "Lets get started!"
    ]
    @State private var description = [
        "Start by entering your weight and height in the boxes", "Follow on to click the button to calculate your BMI", "And there you would have it! your BMI, what you can to do achieve the best shape, and more!", "You can also check out the different health advice tips at the bottom!"
    ]
    @State private var pageNumber = 0
    @State private var titlePageNumber = 0
    @State private var buttonLabel = "Next"
    @State private var imageName = ""
    
    var body: some View {
        VStack{
            Text(title[titlePageNumber])
                .bold()
                .font(.largeTitle)
                .padding()
            Text(description[pageNumber])
                .font(.title3)
                .fontWeight(.medium)
                .padding()
            Image("image0")
                .resizable()
                .scaledToFit()
                .border(.black)
                .frame(height: 100)
                .padding()
            
            Button{
                if pageNumber == 0 {
                    pageNumber = 1
                    imageName = "image1"
                } else if pageNumber == 1{
                    pageNumber = 2
                    imageName = "image2"
                } else if pageNumber == 2{
                    pageNumber = 3
                    imageName = "image3"
                } else if pageNumber == 3{
                    pageNumber = 4
                    imageName = "image4"
                    titlePageNumber = 1
                    buttonLabel = "Swipe down to continue"
                } else{
                    
                }
            } label: {
                HStack{
                    Text(buttonLabel)
                        .font(.system(size: 20))
                    Image(systemName: "chevron.right")
                }
            }
        }
    }
}

struct helpView_Previews: PreviewProvider {
    static var previews: some View {
        helpView()
    }
}

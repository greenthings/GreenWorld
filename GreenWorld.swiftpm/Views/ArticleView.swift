//
//  File.swift
//  GreenWorld
//
//  Created by greenthings on 2022/04/24.
//

import SwiftUI

struct ArticleView: View {
    
    var body: some View{
        
        VStack(){
            Text("Getting in deep with denialism")
                .bold()
                .font(.largeTitle)
                .foregroundColor(Color.cyan)
            Text("By Laura Faye Tenenbaum")
                .font(.title)
                .foregroundColor(Color.cyan)
            Text("Do you believe in the Pacific Garbage Patch?")
                .font(.title)
                .bold()
                .foregroundColor(Color.blue)
            
            Image("trashpatch")
                .resizable()
                .scaledToFit()
           
            Text(#" Some People threw away plastic everywhere without recycling it. These things gathered in the ocean and became The Pacific Garbage Patch but it isn’t visible in satellite photos, because much of the plastic floats underneath the sea surface and has been broken down into bits."#)
                .font(.system(size: 30))
                .minimumScaleFactor(0.3)
                .foregroundColor(Color.cyan)
            
            NavigationLink{
                HowtoView()
                    .navigationBarHidden(true)
                    .navigationBarBackButtonHidden(true)
            } label: {
                Text("What can i help you?")
                    .fontWeight(.bold)
                    .padding(25)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.cyan, lineWidth: 4)
                    )
            }.padding([.top,.bottom])
        }.padding(20)
    }
}

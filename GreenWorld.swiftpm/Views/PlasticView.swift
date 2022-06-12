//
//  File.swift
//  GreenWorld
//
//  Created by greenthings on 2022/04/24.
//


import SwiftUI

struct PlasticView: View {
    
    var body: some View{
        
        VStack(spacing:10){
            
            Text("Welcome!")
                .bold()
                .font(.largeTitle)
                .foregroundColor(Color.cyan)
            
            Text("Do you know Plastic?")
                .bold()
                .font(.title)
                .foregroundColor(Color.cyan)
            
            HStack{
                Image("pet_blue")
                    .frame(width: 100, height: 100, alignment: .center)
                Image("pet_green")
                    .frame(width: 100, height: 100, alignment: .center)
                Image("pet_pink")
                    .frame(width: 100, height: 100, alignment: .center)
                Image("pet_red")
                    .frame(width: 100, height: 100, alignment: .center)
                Image("pet_yellow")
                    .frame(width: 100, height: 100, alignment: .center)
            }.opacity(0.2)
            
            Text(#" Plastic is not made from living things like paper is. Plastic is made by people. It never existed before people created it. \#n\#n If we don’t have to cut down any trees to make it, is that better? Not really. \#n The trouble with plastic is that it’s not part of nature. It doesn’t fit into any ecosystem. Nothing can eat it, so when it goes in the trash, it never goes away. \#n\#n Plastics last for hundreds or even thousands of years. And because plastics are lightweight and blow around in the wind easily, a lot of them end up in the ocean."#)
                .bold()
                .font(.system(size: 30))
                .minimumScaleFactor(0.3)
                .frame(width: 600, height: 550, alignment: .center)
                .foregroundColor(Color.cyan)
                .padding(30)
            
            
            Text("By the Earth Science Communications Team at NASA's Jet Propulsion Laboratory")
                .font(.title3)
                .foregroundColor(Color.cyan)
            
            NavigationLink{
                ArticleView()
                    .navigationBarHidden(true)
                    .navigationBarBackButtonHidden(true)
            } label: {
                Text("I got it, but is it really bad?")
                    .fontWeight(.bold)
                    .padding(25)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.cyan, lineWidth: 4)
                    )
            }.padding([.top,.bottom])
        }
    }
}

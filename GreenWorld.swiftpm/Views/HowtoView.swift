//
//  File.swift
//  GreenWorld
//
//  Created by greenthings on 2022/04/23.
//
import SwiftUI

struct HowtoView: View {
    
    
    var body: some View {
        
        ZStack(){
            Image("howtoplay1")
                .resizable()
            
            startButton()
        }
        .ignoresSafeArea()
        //.scaledToFill()
    }
}


struct startButton: View{
    var howtoimage = Image("hotoplay1")
    var body: some View{
        
        VStack(){
            Spacer()
            NavigationLink{
                GameView()
                    .navigationBarHidden(true)
                    .navigationBarBackButtonHidden(true)
            } label: {
                
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.white)
                    .frame(width: 200 , height: 80, alignment: .bottom)
                    .overlay(
                        ZStack{
                            Text("Let's Clean")
                                .bold()
                                .font(.title)
                                .padding(5)
                                .foregroundColor(Color.cyan)
                            
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.cyan, lineWidth: 4)
                        }
                    ).padding(30)
            }
        }
    }
}

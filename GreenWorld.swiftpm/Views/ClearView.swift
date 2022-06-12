//
//  File.swift
//  GreenWorld
//
//  Created by greenthings on 2022/04/23.
//

import SwiftUI
import SpriteKit




struct ClearView: View {
    
    
    var body: some View {
        ZStack(){
            Image("clear2")
                .resizable()
                .frame(width: 600, height: 600, alignment: .center)
            
            Text("You Saved 20 Fisehes and Bear!!")
                .bold()
                .font(.largeTitle)
                .background(Color.white)
                .foregroundColor(Color.black)

 
            
            returnButton()
        }
        .ignoresSafeArea()
        .scaledToFill()
        
        
    }
    
}


struct returnButton: View{
    
    var scene =  StartScene()
    
    
    var body: some View{
        
        VStack(){
            Spacer()
            NavigationLink{
                ZStack{
                    SpriteView(scene:scene)
                        .navigationBarHidden(true)
                        .navigationBarBackButtonHidden(true)
                    
                    NavigationLink{
                        PlasticView()
                            .navigationBarHidden(true)
                            .navigationBarBackButtonHidden(true)
                    } label: {
                        Text("START")
                            .bold()
                            .font(.title)
                        
                    }
                }
                .ignoresSafeArea()
                
            } label: {
                
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.white)
                    .frame(width: 200, height: 80, alignment: .center)
                    .overlay(
                        ZStack{
                            Text("Replay")
                                .bold()
                                .font(.title)
                                .padding(25)
                                .foregroundColor(Color.cyan)
                            
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.cyan, lineWidth: 4)
                        }
                        
                        
                    ).padding(200)
            }
            
        }
    }
}


//
//Text("Replay")
//    .bold()
//    .font(.title)
//    .padding(25)
//    .foregroundColor(Color.cyan)
//
//    .overlay(
//          RoundedRectangle(cornerRadius: 16)
//              .stroke(Color.cyan, lineWidth: 4)
//      )
//    .padding(200)

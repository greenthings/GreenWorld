//
//  File.swift
//  GreenWorld
//
//  Created by greenthings on 2022/04/19.
//
import SwiftUI
import SpriteKit


struct GameView: View {
    
    @StateObject private var gamescene = GameScene()
    
    var body: some View {
        
        ZStack{
            
            if gamescene.isGameClear{
                ClearView()
            }else{
                SpriteView(scene: gamescene)
                    .navigationBarBackButtonHidden(true)
                    .navigationBarHidden(true)
                    .ignoresSafeArea()
                
                Text("The Number of Trash : \(gamescene.thenumberofTrash)")
                    .foregroundColor(Color.green)
                    .font(.title)
                    .bold()
                    .foregroundColor(.black)
                    .offset(y: -150)
                Spacer()
            }
            
            if gamescene.isGameOver{
                NavigationLink(
                    destination: HowtoView()
                        .navigationBarBackButtonHidden(true)
                        .navigationBarHidden(true)
                        .ignoresSafeArea()
                    , label:{
                        Text("Return")
                            .padding(25)
                            .foregroundColor(Color.cyan)
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.cyan, lineWidth: 4)
                            )
                            .frame(width: 150, height: 100)
                        
                    })
                .offset(y: 100)
                
            }
            
            
            
            
            
        }
        .ignoresSafeArea()
    }
}

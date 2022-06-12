//
//  File.swift
//  GreenWorld
//
//  Created by greenthings on 2022/04/17.
//

import SpriteKit
import SwiftUI


struct StartView: View {
    
    var scene =  StartScene()
  
    
    var body: some View{    
            
            NavigationView{
                
                VStack{

                    NavigationLink{
                        PlasticView()
                            .navigationBarHidden(true)
                            .navigationBarBackButtonHidden(true)
                            .ignoresSafeArea()
                    } label: {
                        Text("Plastic")
                    }
                    NavigationLink{
                        ArticleView()
                            .navigationBarHidden(true)
                            .navigationBarBackButtonHidden(true)
                            .ignoresSafeArea()
                    } label: {
                        Text("Article")
                    }
                    
                    
                    NavigationLink{
                        HowtoView()
                            .navigationBarHidden(true)
                            .navigationBarBackButtonHidden(true)
                            .ignoresSafeArea()
                    } label: {
                        Text("How to play")
                    }
                    NavigationLink{
                        GameView()
                            .navigationBarHidden(true)
                            .navigationBarBackButtonHidden(true)
                            .ignoresSafeArea()
                    } label: {
                        Text("Let's play")
                    }
                    NavigationLink{
                        ClearView()
                            .navigationBarHidden(true)
                            .navigationBarBackButtonHidden(true)
                            .ignoresSafeArea()
                    } label: {
                        Text("Clear!!!")
                    }
                }
                
                ZStack{
                    
                    SpriteView(scene: scene)
                        .navigationBarHidden(true)
                        .navigationBarBackButtonHidden(true)
                        .ignoresSafeArea()
                    
                    NavigationLink{
                        PlasticView()
                            .navigationBarHidden(true)
                            .navigationBarBackButtonHidden(true)
                            .ignoresSafeArea()
                    } label: {
                        Text("START")
                            .bold()
                            .font(.title)
                        
                    }
                }
            }
            .statusBar(hidden: true)
    }
}


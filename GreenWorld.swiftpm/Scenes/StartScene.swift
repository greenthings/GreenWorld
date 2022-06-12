//
//  File.swift
//  GreenWorld
//
//  Created by greenthings on 2022/04/18.
//
import Foundation
import SpriteKit



class StartScene:SKScene{
    
    //MARK: -Nodes
    
    let iceChjunk = SKSpriteNode(imageNamed: "ice1")
    let bear = SKSpriteNode(imageNamed: "bear")
    let pet = SKSpriteNode(imageNamed: "pet_blue")
    

    
    override func didMove(to view: SKView) {
        
        // MARK: - Configured Start Scene
        scene?.size = view.bounds.size
        scene?.scaleMode = .aspectFill

        
        backgroundColor = UIColor(red: 52 / 255, green: 152 / 255, blue: 219 / 255, alpha: 1)
        
        iceChjunk.position = CGPoint(x: size.width / 2, y: size.height * 0.36)
        
        bear.position = CGPoint(x: size.width / 1.8, y: size.height * 0.5)
        
        pet.position = CGPoint(x: size.width / 3, y: size.height * 0.2)
        pet.zRotation = CGFloat(Double.pi) / 7
        
        
        addChild(iceChjunk)
        addChild(bear)
        addChild(pet)
        
    }
    
    override func update(_ currnetTime: TimeInterval){
        
        // MARK: - Animation
        
        let moveUp_b = SKAction.move(to: CGPoint(x: size.width / 1.8,y: size.height * 0.5 + 40), duration:7)
        
        let moveUp_i = SKAction.move(to: CGPoint(x: size.width / 2,y: size.height * 0.36 + 40), duration:7.5)
        
        let moveUp_p = SKAction.move(to: CGPoint(x: size.width / 2.2,y: size.height * 0.23 + 40), duration:5)
        
        bear.run(moveUp_b)
        iceChjunk.run(moveUp_i)
        pet.run(moveUp_p)
    }
}




    

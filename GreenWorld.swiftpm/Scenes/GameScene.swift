//
//  File.swift
//  GreenWorld
//
//  Created by greenthings on 2022/04/19.
//


import SpriteKit
import SwiftUI
import GameplayKit // Random
import AVKit // Sound


struct PhysicsCategory {
    static let none      : UInt32 = 0
    static let all       : UInt32 = UInt32.max
    static let trash : UInt32 = 0b1       // 1
    static let player : UInt32 = 0b10      // 2
}



class GameScene: SKScene, ObservableObject, SKPhysicsContactDelegate{
    // 2 Player
    let player = SKSpriteNode(imageNamed: "player1")
    
    // 3 Make player animate
    var playerAnimation = [SKTexture]()
    
    // 1  22th Apr
    var touchesBegan = false
    
    var generateTimer = Timer()
    
    
    @Published var isGameOver = false
    
    @Published var thenumberofTrash = 0
    
    @Published var isGameClear = false
    
    var gettrashtimer = Timer()
    
    // 1  22th Apr
    
    // 2 23th Apr
    var audioPath: URL?
    var backgroundMusic = AVAudioPlayer()
    
    var backgroundimage = "background1"
    // 2 23th Apr
    
    
    override func didMove(to view: SKView) {
        
        // MARK: -Configured Game Scene
        // 2
        self.size = view.bounds.size
        scene?.scaleMode = .aspectFill
        
        anchorPoint = .zero
        
        // 1  22th Apr
        physicsWorld.gravity = CGVector(dx: 0.2, dy: -2)
        physicsWorld.contactDelegate = self
        // 1  22th Apr
        
        player.position = CGPoint(x: size.width / 2, y: size.height - player.size.height / 2)
        
        // 2
        player.setScale(0.7)
        
        // 1  22th Apr
        player.physicsBody = SKPhysicsBody(rectangleOf: player.size)
        player.physicsBody?.categoryBitMask = 1
        
        // 1  22th Apr
        player.zPosition = 10
        
        addChild(player)
        
        // Z value is related in hierarchy
        moveBackground(image: backgroundimage, y: 0, z: -5, duration: 9,needPhysics: false ,size: self.size)
                
        // 3 Player Animation
        // MARK: -Player Animation
        let textureAtlas = SKTextureAtlas(named: "Sprites")
        
        for i in 1...textureAtlas.textureNames.count{
            let name = "player" + String(i)
            playerAnimation.append(textureAtlas.textureNamed(name))
            
        }
        
        player.run(SKAction.repeatForever(SKAction.animate(with: playerAnimation, timePerFrame: 0.2)))
        
        
        
        // MARK: - Trash Timer
        generateTimer = .scheduledTimer(timeInterval: 1, target: self, selector: #selector(makeTrash), userInfo: nil, repeats: true)
    }
    
    
    
    // MARK: - Generated Sound of water
    // 1  22th Apr
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        touchesBegan = true
        // 2 23th Apr
        audioPath = Bundle.main.url(forResource: "water", withExtension: "m4a")
        
        do{
            backgroundMusic = try AVAudioPlayer(contentsOf: audioPath!)
        } catch {
            print("not found")
        }
        
        // MARK: - Avoided overlapping notes
        if backgroundMusic.isPlaying == true{
            // Nothing
        }else{
            backgroundMusic.prepareToPlay()
            backgroundMusic.play()
        }

        // 2 23th Apr
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        touchesBegan = false
    }
    // 1  22th Apr
    
    // MARK: - constrained the player to the screen
    override func update(_ currentTime: TimeInterval) {
        
        if touchesBegan{
            player.physicsBody?.velocity = CGVector(dx: 0, dy: 200)
        }
        
        if player.position.y > size.height - (size.height / 4.5) {
            player.position.y = size.height - (size.height / 4.5)
        }
        
        if player.position.x < 0 {
            gameOver()
        }
        
        if player.position.x > size.width {
            
            gameOver()
        }
        
        
        if player.position.y < 0 {
            gameOver()
        }
        
        if thenumberofTrash == 20 {
            gameClear()
        }
    
    }
    
    
    
    // MARK: - Background Animation
    // 1 function to make backgroudn moving
    func moveBackground(image:String,y:CGFloat,z:CGFloat,duration: Double,needPhysics: Bool,size:CGSize){
        
        
        
        for i in 0...1{
            let background = SKSpriteNode(imageNamed: image)
            
            background.anchorPoint = .zero
            background.position = CGPoint(x: size.width * CGFloat(i),y:y)
            background.size = size
            background.zPosition = z
            
            if needPhysics {
                background.physicsBody = SKPhysicsBody(rectangleOf: background.size)
                background.physicsBody?.isDynamic = false
                background.physicsBody?.contactTestBitMask = 1
                background.name = "background"
                
            }
            
            let move = SKAction.moveBy(x: -background.size.width, y: 0, duration: duration)
            let back = SKAction.moveBy(x: background.size.width, y: 0, duration: 0)
            
            let sequence = SKAction.sequence([move,back])
            let repeatAction = SKAction.repeatForever(sequence)
            
            
            addChild(background)
            
            background.run(repeatAction)
            
        }
    }
    
    @objc func makeTrash() {
        // random nubmer
        let random = GKRandomDistribution(lowestValue: Int(size.height) / 8 , highestValue: Int(size.height) / 2)
        // random number of trash
        let randomTrash = Int.random(in: 1...7)
        var type = ""
        
        switch randomTrash {
            case 1:
                type =  "pet_blue"
            case 2:
                type = "pet_green"
            case 3:
                type = "pet_pink"
            case 4:
                type = "pet_red"
            case 5:
                type = "pet_yellow"
            case 6:
                type = "wheel"
            case 7:
                type = "carrier"
                
            default:
                type = "pet_blue"
        }
        
        
        let trash = SKSpriteNode(imageNamed: type)
        
        trash.position = CGPoint(x: 1000 , y: random.nextInt())
        trash.setScale(0.35)
        trash.zPosition = 5
        trash.physicsBody = SKPhysicsBody(rectangleOf: trash.size)
        trash.physicsBody?.isDynamic = false
        trash.physicsBody?.contactTestBitMask = 1
        trash.name = "trash"
        trash.zRotation = CGFloat(Double.pi) / CGFloat(randomTrash)
        
        
        addChild(trash)
        
        let moveAction = SKAction.moveTo(x: -30, duration: 10)
        let removeAction = SKAction.removeFromParent()
        
        let actions = SKAction.sequence([moveAction,removeAction])
        
        trash.run(actions)
    }
    
    
    
   
    func playerDidCollideWithtrash(player: SKSpriteNode, trash: SKSpriteNode) {
        // MARK: - Generated sound of Thank you
        // sound
        audioPath = Bundle.main.url(forResource: "thankyou", withExtension: "m4a")
        
        do{
            backgroundMusic = try AVAudioPlayer(contentsOf: audioPath!)
        } catch {
            print("not found")
        }
        
        backgroundMusic.prepareToPlay()
        backgroundMusic.play()
        
        // remove
        trash.removeFromParent()
        
        // makefish
        
        makeFish()
        
        if thenumberofTrash == 3 {
            backgroundimage = "background2"
            moveBackground(image: backgroundimage, y: 0, z: -5, duration: 9,needPhysics: false ,size: self.size)
        }
        if thenumberofTrash == 7 {
            backgroundimage = "background3"
            moveBackground(image: backgroundimage, y: 0, z: -5, duration: 8,needPhysics: false ,size: self.size)
        }
        if thenumberofTrash == 11 {
            backgroundimage = "background4"
            moveBackground(image: backgroundimage, y: 0, z: -5, duration: 7,needPhysics: false ,size: self.size)
        }
        if thenumberofTrash == 17 {
            backgroundimage = "background5"
            moveBackground(image: backgroundimage, y: 0, z: -5, duration: 6,needPhysics: false ,size: self.size)
        }
        
    }
    
    
    func makeFish(){
        
        let random = GKRandomDistribution(lowestValue: Int(size.height) / 8 , highestValue: Int(size.height) / 2)
        let randomFish = Int.random(in: 1...5)
        var type = ""
        
        switch randomFish {
            case 1:
                type = "purple_fish"
            case 2:
                type = "green_fish"
            case 3:
                type = "pink_fish"
            case 4:
                type = "red_fish"
            case 5:
                type = "yellow_fish"
            default:
                type = "purple_fish"
        }
        
        let fish = SKSpriteNode(imageNamed: type)
        
        fish.position = CGPoint(x: 1000 , y: random.nextInt())
        fish.setScale(0.35)
        fish.zPosition = 4
        //fish.physicsBody = SKPhysicsBody(rectangleOf: trash.size)
        fish.physicsBody?.isDynamic = false
        fish.physicsBody?.contactTestBitMask = 1
        fish.name = "fish"
        
        addChild(fish)
        
        let moveAction = SKAction.moveTo(x: -30, duration: 10)
        let removeAction = SKAction.removeFromParent()
        
        let actions = SKAction.sequence([moveAction,removeAction])
        
        fish.run(actions)
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        // 1
        var firstBody: SKPhysicsBody
        var secondBody: SKPhysicsBody
        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
            firstBody = contact.bodyA
            secondBody = contact.bodyB
        } else {
            firstBody = contact.bodyB
            secondBody = contact.bodyA
        }
        
        // 2
        if ((firstBody.categoryBitMask & PhysicsCategory.trash != 0) &&
            (secondBody.categoryBitMask & PhysicsCategory.player != 0)) {
            if let player = firstBody.node as? SKSpriteNode,
               let trash = secondBody.node as? SKSpriteNode {
                playerDidCollideWithtrash(player: player, trash: trash)
            }
        }
        
        addThenumberoftrash()
    }
    
    func gameOver(){
        generateTimer.invalidate()
        
        let gameOverLabel = SKLabelNode(fontNamed: "SF Pro")
        
        gameOverLabel.text = "Game Over"
        gameOverLabel.fontSize = 32
        gameOverLabel.fontColor = .red
        gameOverLabel.zPosition = 10
        gameOverLabel.position = CGPoint(x: size.width / 2, y: size.height / 2)
        
        addChild(gameOverLabel)
        player.removeFromParent()
        
        isGameOver = true
        
    }
    
    
    func gameClear(){
        generateTimer.invalidate()
        player.removeFromParent()
        isGameClear = true
    }
    
    
    // MARK: - To show the number of trash
    @objc func addThenumberoftrash(){
        thenumberofTrash += 1
    }
    
    
}




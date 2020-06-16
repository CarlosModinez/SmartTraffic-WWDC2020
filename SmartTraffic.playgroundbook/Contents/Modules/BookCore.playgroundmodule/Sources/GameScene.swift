//
//  GameScene.swift
//  BookCore
//
//  Created by Carlos Modinez on 14/05/20.
//

import SpriteKit

public class GameScene: SKScene {
    
    //Variables for test
    var counter1: Int!
    var counter2: Int!
    public var spawnerVelocity: Int = 45
    
    
    //Editable variables
    public var bikeAdded: Bool = false
    public var busAdded: Bool = false
    public var rideAdded: Bool = false
    
    public var addedVehicles: Float = 1
    public var finalAlpha: CGFloat = 1.0
    
    var firstUpdate: Bool = true
    
    //Vehicles
    var vehicles: Vehicles!
    
    
    //Sounds
    var trafficSound: CustomSound!
    
    
    //Colorful city elements
    private var block_1: SKSpriteNode!
    private var block_2: SKSpriteNode!
    private var block_3: SKSpriteNode!
    private var block_4: SKSpriteNode!
    private var block_5: SKSpriteNode!
    private var block_6: SKSpriteNode!
    private var block_7: SKSpriteNode!
    private var block_8: SKSpriteNode!
    private var square: SKSpriteNode!
    private var floor: SKSpriteNode!
    var colorFulElements: [SKSpriteNode] = []
    
    //BW city elements
    private var BW_block_1: SKSpriteNode!
    private var BW_block_2: SKSpriteNode!
    private var BW_block_3: SKSpriteNode!
    private var BW_block_4: SKSpriteNode!
    private var BW_block_5: SKSpriteNode!
    private var BW_block_6: SKSpriteNode!
    private var BW_block_7: SKSpriteNode!
    private var BW_block_8: SKSpriteNode!
    private var BW_square: SKSpriteNode!
    private var BW_floor: SKSpriteNode!
    var bwElements: [SKSpriteNode?] = []

    
    //Routes support
    var redGoal: SKSpriteNode!
    var redStart: SKSpriteNode!
    
    var blueGoal: SKSpriteNode!
    var blueStart: SKSpriteNode!
    
    var purpleStart: SKSpriteNode!
    var purpleGoal: SKSpriteNode!

    var greenStart: SKSpriteNode!
    var greenGoal: SKSpriteNode!
    
    var pinkStart: SKSpriteNode!
    var pinkGoal: SKSpriteNode!
    
    var yellowStart: SKSpriteNode!
    var yellowGoal: SKSpriteNode!
    
    var orangeStart: SKSpriteNode!
    var orangeStop: SKSpriteNode!
    var orangeGoal: SKSpriteNode!
    
    var blackStart: SKSpriteNode!
    var blackStop: SKSpriteNode!
    var blackGoal: SKSpriteNode!
    
    var whiteStart: SKSpriteNode!
    var whiteStop: SKSpriteNode!
    var whiteGoal: SKSpriteNode!
    
    var vehiclesNode: SKSpriteNode!
    
    public override func didMove(to view: SKView) {
        
        setupColorfulCity()
        setupBWCity()
        setupRoutes()
        
        counter1 = 0
        counter2 = 0
        
        
    }
    
    public override func update(_ currentTime: TimeInterval) {
        
        
        if !firstUpdate {
            
            counter1 += 1
            counter2 += 1
            
            if counter1 == spawnerVelocity {
                counter1 = 0
                if bwElements[0]!.alpha > finalAlpha {
                    changeAlpha(nodes: bwElements)
                }
                newVehicleRedRoute()
                newVehicleBlueRoute()
                newVehiclePurpleRoute()
                newVehiclePinkRoute()
            }
            
            if counter2 == spawnerVelocity * 2 {
                counter2 = 0
                newVehicleYellowRoute()
                newVehicleWhiteRoute()
                newVehicleBlackRoute()
                newVehicleOrangeRoute()
                newVehicleGreenRoute()
            }
        } else {
            firstUpdate = false
            vehicles = Vehicles(bike: bikeAdded, bus: busAdded, ride: rideAdded)
            vehicles.initializeVehicles()
            
            playTrafficSound()
        }
    }

    func setupRoutes() {
        redGoal = childNode(withName: "red goal") as? SKSpriteNode
        redStart = childNode(withName: "red start") as? SKSpriteNode
        
        blueGoal = childNode(withName: "blue goal") as? SKSpriteNode
        blueStart = childNode(withName: "blue start") as? SKSpriteNode
        
        purpleStart = childNode(withName: "purple start") as? SKSpriteNode
        purpleGoal = childNode(withName: "purple goal") as? SKSpriteNode
        
        greenStart = childNode(withName: "green start") as? SKSpriteNode
        greenGoal = childNode(withName: "green goal") as? SKSpriteNode
        
        yellowStart = childNode(withName: "yellow start") as? SKSpriteNode
        yellowGoal = childNode(withName: "yellow goal") as? SKSpriteNode
        
        pinkStart = childNode(withName: "pink start") as? SKSpriteNode
        pinkGoal = childNode(withName: "pink goal") as? SKSpriteNode
        
        orangeStart = childNode(withName: "orange start") as? SKSpriteNode
        orangeStop = childNode(withName: "orange stop") as? SKSpriteNode
        orangeGoal = childNode(withName: "orange goal") as? SKSpriteNode
        
        blackStart = childNode(withName: "black start") as? SKSpriteNode
        blackStop = childNode(withName: "black stop") as? SKSpriteNode
        blackGoal = childNode(withName: "black goal") as? SKSpriteNode
        
        whiteStart = childNode(withName: "white start") as? SKSpriteNode
        whiteStop = childNode(withName: "white stop") as? SKSpriteNode
        whiteGoal = childNode(withName: "white goal") as? SKSpriteNode
        
    }
    
    
    func playTrafficSound() {
        if addedVehicles == 1 {
            trafficSound = CustomSound(fileName: "sound_1.mp3")
        } else if addedVehicles == 2 {
            trafficSound = CustomSound(fileName: "sound_2.mp3")
        } else if addedVehicles == 3 {
            trafficSound = CustomSound(fileName: "sound_3.mp3")
        } else if addedVehicles == 4 {
            trafficSound = CustomSound(fileName: "sound_4.mp3")
        }
        
        trafficSound.play()
    }
    
    func newVehicleRedRoute() {
        let car = SKSpriteNode(imageNamed: vehicles.sortDRVehicle())
        scene?.addChild(car)
        car.zPosition = block_5.zPosition - 1
        route(from: redStart.position, to: redGoal.position, node: car)
    }
    
    func newVehicleBlueRoute() {
        let car = SKSpriteNode(imageNamed: vehicles.sortURVehicle())
        scene?.addChild(car)
        car.zPosition = block_5.zPosition - 1
        route(from: blueStart.position, to: blueGoal.position, node: car)
    }
    
    func newVehiclePurpleRoute() {
        let car = SKSpriteNode(imageNamed: vehicles.sortDLVehicle())
        scene?.addChild(car)
        car.zPosition = block_5.zPosition - 1
        route(from: purpleStart.position, to: purpleGoal.position, node: car)
    }
    
    func newVehicleGreenRoute() {
        let car = SKSpriteNode(imageNamed: vehicles.sortULVehicle())
        scene?.addChild(car)
        route(from: greenStart.position, to: greenGoal.position, node: car)
    }
    
    func newVehicleYellowRoute() {
        let car = SKSpriteNode(imageNamed: vehicles.sortDRVehicle())
        addChild(car)
        route(from: yellowStart.position, to: yellowGoal.position, node: car)
    }
    func newVehiclePinkRoute() {
        let car = SKSpriteNode(imageNamed: vehicles.sortULVehicle())
        addChild(car)
        route(from: pinkStart.position, to: pinkGoal.position, node: car)
    }
    
    func newVehicleOrangeRoute() {
        let image = vehicles.sortULVehicle()
        let car = SKSpriteNode(imageNamed: image)
        addChild(car)
        
        route(from: orangeStart.position, stop: orangeStop.position, to: orangeGoal.position, node: car, imageNameToChange: image, newSuffix: "UR")
    }
    
    func newVehicleBlackRoute() {
        let image = vehicles.sortURVehicle()
        let car = SKSpriteNode(imageNamed: image)
        scene?.addChild(car)
        
        route(from: blackStart.position, stop: blackStop.position, to: blackGoal.position, node: car, imageNameToChange: image, newSuffix: "DR")
    }
    
    func newVehicleWhiteRoute() {
        let image = vehicles.sortDRVehicle()
        let car = SKSpriteNode(imageNamed: image)
        addChild(car)
        route(from: whiteStart.position, stop: whiteStop.position, to: whiteGoal.position, node: car, imageNameToChange: image, newSuffix: "DL")
    }

    
    public func setupColorfulCity() {
        block_1 = childNode(withName: "block_1") as? SKSpriteNode
        block_2 = childNode(withName: "block_2") as? SKSpriteNode
        block_3 = childNode(withName: "block_3") as? SKSpriteNode
        block_4 = childNode(withName: "block_4") as? SKSpriteNode
        block_5 = childNode(withName: "block_5") as? SKSpriteNode
        block_6 = childNode(withName: "block_6") as? SKSpriteNode
        block_7 = childNode(withName: "block_7") as? SKSpriteNode
        block_8 = childNode(withName: "block_8") as? SKSpriteNode
        floor = childNode(withName: "floor") as? SKSpriteNode
        square = childNode(withName: "square") as? SKSpriteNode

        colorFulElements.append(block_1)
        colorFulElements.append(block_2)
        colorFulElements.append(block_3)
        colorFulElements.append(block_4)
        colorFulElements.append(block_5)
        colorFulElements.append(block_6)
        colorFulElements.append(block_7)
        colorFulElements.append(block_8)
        colorFulElements.append(floor)
        colorFulElements.append(square)
    }

    public func setupBWCity() {
        BW_block_1 = childNode(withName: "BW_block_1") as? SKSpriteNode
        BW_block_2 = childNode(withName: "BW_block_2") as? SKSpriteNode
        BW_block_3 = childNode(withName: "BW_block_3") as? SKSpriteNode
        BW_block_4 = childNode(withName: "BW_block_4") as? SKSpriteNode
        BW_block_5 = childNode(withName: "BW_block_5") as? SKSpriteNode
        BW_block_6 = childNode(withName: "BW_block_6") as? SKSpriteNode
        BW_block_7 = childNode(withName: "BW_block_7") as? SKSpriteNode
        BW_block_8 = childNode(withName: "BW_block_8") as? SKSpriteNode
        BW_floor = childNode(withName: "BW_floor") as? SKSpriteNode
        BW_square = childNode(withName: "BW_square") as? SKSpriteNode

        bwElements.append(BW_block_1)
        bwElements.append(BW_block_2)
        bwElements.append(BW_block_3)
        bwElements.append(BW_block_4)
        bwElements.append(BW_block_5)
        bwElements.append(BW_block_6)
        bwElements.append(BW_block_7)
        bwElements.append(BW_block_8)
        bwElements.append(BW_floor)
        bwElements.append(BW_square)
    }
    
    
    private func changeAlpha(nodes: [SKSpriteNode?]) {
        for node in nodes {
            node?.alpha -= 0.15
        }
        
    }
    
    func route(from: CGPoint, to: CGPoint, node: SKSpriteNode) {
        let vectorialDistance = CGVector(dx: to.x - from.x, dy: to.y - from.y)
        let interval = sqrt(vectorialDistance.dx*vectorialDistance.dx + vectorialDistance.dy*vectorialDistance.dy)/60
        
        
        node.position = from
        let movement = SKAction.move(to: to, duration: TimeInterval(interval/CGFloat(addedVehicles)))
        node.run(movement)
    }
    func route(from: CGPoint, stop: CGPoint, to: CGPoint, node: SKSpriteNode, imageNameToChange: String, newSuffix: String) {
        
        let vectorialDistance1 = CGVector(dx: stop.x - from.x, dy: stop.y - from.y)
        let interval1 = sqrt(vectorialDistance1.dx*vectorialDistance1.dx + vectorialDistance1.dy*vectorialDistance1.dy)/60
        
        let vectorialDistance2 = CGVector(dx: to.x - stop.x, dy: to.y - stop.y)
        let interval2 = sqrt(vectorialDistance2.dx*vectorialDistance2.dx + vectorialDistance2.dy*vectorialDistance2.dy)/60
        
        
        let oldSuffix = imageNameToChange.suffix(2)
        let newImageName = imageNameToChange.replacingOccurrences(of: oldSuffix, with: newSuffix)
        
        let textureToChange: SKTexture = SKTexture(imageNamed: newImageName)
        
        node.position = from
        let movement1 = SKAction.move(to: stop, duration: TimeInterval(interval1/CGFloat(addedVehicles)))
        let changeTexture = SKAction.animate(with: [textureToChange], timePerFrame: 0)
        let movement2  = SKAction.move(to: to, duration: TimeInterval(interval2/CGFloat(addedVehicles)))
        
        let movements = SKAction.sequence([movement1, changeTexture, movement2])
        node.run(movements)
    }
}

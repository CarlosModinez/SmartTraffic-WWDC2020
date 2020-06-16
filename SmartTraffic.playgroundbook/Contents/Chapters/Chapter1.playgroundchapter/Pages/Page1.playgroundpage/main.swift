//#-hidden-code
//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  The Swift file containing the source code edited by the user of this playground book.
//


import PlaygroundSupport
import SpriteKit
import BookCore


//#-end-hidden-code

/*:
# What is intermodality and what is its importance
 
 Intermodal transport happens when we have more than one way of getting around. It is important to know that there are several ways to get from one place to another and you can save a lot if you know this, in addition to contributing a lot to improving the environment.

 How about better understanding some means of transport and what you could do to help improve your city?

 A very common means of transport in big cities, is the car. But it is not uncommon to see excess cars on the streets and therefore, a lot of congestion. This is mainly because most of the time, the car carries only one person, the driver.

 How about taking a look at the city next door?
 
 Warning: experiment with low volume
*/

let bikeAdded: Bool = false
let busAdded: Bool = false
let rideAdded: Bool = false


//#-hidden-code

let sceneView = SKView(frame: CGRect(x:0 , y:0, width: 640, height: 480))
if let scene = GameScene(fileNamed: "GameScene") {
    // Set the scale mode to scale to fit the window
    scene.scaleMode = .aspectFill
   
    // Present the scene
    sceneView.presentScene(scene)
    
    
    if bikeAdded {
        scene.finalAlpha -= 0.33
        scene.bikeAdded = true
        scene.addedVehicles += 1
        scene.spawnerVelocity += 40
    }
    if busAdded {
        scene.finalAlpha -= 0.33
        scene.busAdded = true
        scene.addedVehicles += 1
        scene.spawnerVelocity += 40
    }
    if rideAdded {
        scene.finalAlpha -= 0.33
        scene.rideAdded = true
        scene.addedVehicles += 1
        scene.spawnerVelocity += 40
    }
    
}
PlaygroundSupport.PlaygroundPage.current.liveView = sceneView

//#-end-hidden-code

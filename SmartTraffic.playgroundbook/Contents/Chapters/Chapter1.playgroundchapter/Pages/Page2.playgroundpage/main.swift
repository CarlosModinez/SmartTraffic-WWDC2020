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
# Bikes
 
 What do you think of knowing a little more about getting around with bicycles?

 The bicycle can be a good alternative when you want to travel short distances, such as when you go to work or school. In addition to being a cheap means of transportation, you can improve your health by doing a little more exercise.

 You can add bicycles in the next city and help the inhabitants of it.
*/

let bikeAdded: Bool = /*#-editable-code*/<#T##answer##Int#>/*#-end-editable-code*/
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

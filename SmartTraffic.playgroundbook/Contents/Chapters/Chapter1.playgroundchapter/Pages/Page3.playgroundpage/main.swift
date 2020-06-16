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
 # Buses

 Buses can also be very practical since they can take several people who go to a common destination or who have a similar trajectory. In addition to helping to improve your city's traffic, you can take advantage of the free time inside it to read that book you've been wanting for a long time.

 Can you help your city a little more?
 */


let bikeAdded: Bool = true
let busAdded: Bool = /*#-editable-code*/<#T##answer##Int#>/*#-end-editable-code*/
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

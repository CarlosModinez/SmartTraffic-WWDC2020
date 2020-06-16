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
 # Rides
 
 Hitchhikers and hitchhikers can help a lot in reducing traffic in large cities, since the car that would carry only one person, can now be fully occupied, thus reducing the number of cars that will be circulating on the streets.

 How about adding a little charity in our city and offering that ride to the neighbors?

 */

let bikeAdded: Bool = true
let busAdded: Bool = true
let rideAdded: Bool = /*#-editable-code*/<#T##answer##Int#>/*#-end-editable-code*/

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

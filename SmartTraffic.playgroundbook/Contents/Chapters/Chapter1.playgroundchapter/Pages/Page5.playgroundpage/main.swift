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
 # Feel free
 
 In cities there are many other ways to get around that you can explore. Now that you know a little more about some alternatives, how about trying one of them in practice?

 Feel free to modify your city by adding and removing means of transport to see how it performs.
 You can also experiment with the full screen!

 */

let bikeAdded: Bool = /*#-editable-code*/<#T##answer##Int#>/*#-end-editable-code*/
let busAdded: Bool = /*#-editable-code*/<#T##answer##Int#>/*#-end-editable-code*/
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

//
//  vehicles.swift
//  BookCore
//
//  Created by Carlos Modinez on 16/05/20.
//

import Foundation
import SpriteKit

class Vehicles: SKNode {
    private var bike: Bool
    private var bus: Bool
    private var ride: Bool

    private var ULVehicles: [String] = []
    private var URVehicles: [String] = []
    private var DLVehicles: [String] = []
    private var DRVehicles: [String] = []

    init(bike: Bool, bus: Bool, ride: Bool) {
        self.bike = bike
        self.bus = bus
        self.ride = ride
        
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initializeVehicles() {
        ULVehicles = setupVehicles(prefix: "UL")
        URVehicles = setupVehicles(prefix: "UR")
        DLVehicles = setupVehicles(prefix: "DL")
        DRVehicles = setupVehicles(prefix: "DR")
    }
    
    private func setupVehicles(prefix: String) -> [String] {
    
        let car1: String = String("car1_"+prefix)
        let car2: String = String("car2_"+prefix)
        let car3: String = String("car3_"+prefix)
        let taxi: String = String("taxi_"+prefix)
        let schoolBus: String = String("schoolBus_"+prefix)
        let bus: String = String("bus_"+prefix)
        let bike: String = String("bike_"+prefix)
        
        var vehicles: [String] = []
        vehicles.append(car1)
        vehicles.append(car2)
        vehicles.append(car3)
        
        if self.ride {
            vehicles.append(taxi)
        }
        if self.bus {
            vehicles.append(schoolBus)
            vehicles.append(bus)
            
        }
        if self.bike {
            vehicles.append(bike)
        }

        return vehicles
    }
    
    
    func sortULVehicle() -> String {
        let positionSorted = Int.random(in: 0...ULVehicles.count - 1)
        return ULVehicles[positionSorted]
    }
    func sortURVehicle() -> String{
        let positionSorted = Int.random(in: 0...URVehicles.count - 1)
        return URVehicles[positionSorted]
    }
    func sortDLVehicle() -> String {
        let positionSorted = Int.random(in: 0...DLVehicles.count - 1)
        return DLVehicles[positionSorted]
    }
    func sortDRVehicle() -> String {
        let positionSorted = Int.random(in: 0...DRVehicles.count - 1)
        return DRVehicles[positionSorted]
    }
}

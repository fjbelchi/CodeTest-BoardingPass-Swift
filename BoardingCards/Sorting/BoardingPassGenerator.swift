//
//  BoardingPassGenerator.swift
//
//  Copyright (c) 2015 Francisco J. Belchi. All rights reserved.

import Foundation

/// Generator of boarding pass for code test

final public class BoardingPassGenerator {
    
    // -- Cities
    fileprivate let madrid : City
    fileprivate let barcelona : City
    fileprivate let gerona : City
    fileprivate let london : City
    fileprivate let newYork : City
    
    // -- Passes
    fileprivate let passMadridToBarcelona : AnyBoardingPass
    fileprivate let passBarcelonaToGerona : AnyBoardingPass
    fileprivate let passGeronaToLondon : AnyBoardingPass
    fileprivate let passLondonToNewYork : AnyBoardingPass
    
    public init() {
        madrid = City(name: "Madrid")
        barcelona = City(name: "Barcelona")
        gerona = City(name: "Gerona")
        london = City(name: "London")
        newYork = City(name: "New York")
        passMadridToBarcelona = AnyBoardingPass(BoardingTrainPass(boardingId: "1", cityFrom: madrid, cityTo: barcelona, train: "Train 78A", seat: "45B")!)
        passBarcelonaToGerona = AnyBoardingPass(BoardingBusPass(boardingId: "2", cityFrom: barcelona, cityTo: gerona, bus: "Alsa", seat: "No seat assignment")!)
        passGeronaToLondon = AnyBoardingPass(BoardingPlanePass(boardingId: "3", cityFrom: gerona, cityTo: london, flightNumber: "SK 455", gate: "45B", seat: "3A")!)
        passLondonToNewYork = AnyBoardingPass(BoardingPlanePass(boardingId: "4", cityFrom: london, cityTo: newYork, flightNumber: "SK 22", gate: "22", seat: "7B")!)
    }
    
    public func boardingPassesUnsorted() -> Set<AnyBoardingPass> {
        // -- Set of boarding passes
        var result = Set<AnyBoardingPass>()
        
        // -- Insert into the result set
        self.addToSet(passLondonToNewYork, set: &result)
        self.addToSet(passBarcelonaToGerona, set: &result)
        self.addToSet(passGeronaToLondon, set: &result)
        self.addToSet(passMadridToBarcelona, set: &result)
        
        return result
    }
    
    public func boardingPassesSorted() -> Array<AnyBoardingPass> {
        return [passMadridToBarcelona, passBarcelonaToGerona, passGeronaToLondon, passLondonToNewYork]
    }
    
    fileprivate func addToSet<T>(_ pass: T?, set:inout Set<T>) {
        if let boardingPass = pass {
            set.insert(boardingPass)
        }
    }
}

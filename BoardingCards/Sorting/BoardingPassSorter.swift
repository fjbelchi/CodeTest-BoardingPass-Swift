//
//  BoardingPassSorter.swift
//
//  Copyright (c) 2015 Francisco J. Belchi. All rights reserved.

import Foundation

/// Sort algorithm for any type of boarding pass

final public class BoardingPassSorter {
    
    public init() {}
    
    public func sort<T: BoardingPassType>(_ set:Set<T>) -> Array<T> {
        
        // Sets of cities
        var fromCitySet : Set<City> = []
        var toCitySet : Set<City> = []
        // Dictionaries of boarding passes
        var fromDictionary : [City : T] = [:]
        var toDictionary : [City : T] = [:]
        
        // fill model data
        for boardingPass in set {
            fromCitySet.insert(boardingPass.cityFrom)
            toCitySet.insert(boardingPass.cityTo)
            fromDictionary[boardingPass.cityFrom] = boardingPass
            toDictionary[boardingPass.cityTo] = boardingPass
        }
        
        // Determine start and end
        let startEndCities = fromCitySet.symmetricDifference(toCitySet)
        var startBoardingPass : T?
        var endBoardingPass : T?
        
        for city in startEndCities {
            // if start citiy is in fromDictionary, we will have the start
            if let pass = fromDictionary[city] {
                startBoardingPass = pass
            }
            
            if let pass = toDictionary[city] {
                endBoardingPass = pass
            }
        }
        
        // Let's start the journey
        var journey: Array<T> = []
        var pass = startBoardingPass!
        while pass != endBoardingPass! {
            let newBoardingPass = fromDictionary[pass.cityTo]
            if let newPass = newBoardingPass {
                journey.append(pass)
                pass = newPass
            }
        }
        journey.append(endBoardingPass!)
        
        return journey
    }
}

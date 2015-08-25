//
//  BoardingPassGeneratorTests.swift
//
//  Copyright (c) 2015 Francisco J. Belchi. All rights reserved.

import Foundation
import XCTest
import BoardingCards

class BoardingPassGeneratorTests: XCTestCase {

    func testExcersiceSet_HasTo_Contains4Passes() {
        let generator = BoardingPassGenerator()
        
        let passes : Set<AnyBoardingPass> = generator.boardingPassesUnsorted()
        
        XCTAssertEqual(passes.count, 4, "It has to return 4 passes")
    }
    
    func testExcerciseSet_HasTo_ContainsPasses_Success() {
        let madrid = City(name: "Madrid")
        let barcelona = City(name: "Barcelona")
        let gerona = City(name: "Gerona")
        let london = City(name: "London")
        let newYork = City(name: "New York")
        
        let passMadridToBarcelona = AnyBoardingPass(BoardingTrainPass(boardingId: "1", cityFrom: madrid, cityTo: barcelona, train: "Train 78A", seat: "45B")!)
        let passBarcelonaToGerona = AnyBoardingPass(BoardingBusPass(boardingId: "2", cityFrom: barcelona, cityTo: gerona, bus: "Alsa", seat: "No seat assignment")!)
        let passGeronaToLondon = AnyBoardingPass(BoardingPlanePass(boardingId: "3", cityFrom: gerona, cityTo: london, flightNumber: "SK 455", gate: "45B", seat: "3A")!)
        let passLondonToNewYork = AnyBoardingPass(BoardingPlanePass(boardingId: "4", cityFrom: london, cityTo: newYork, flightNumber: "SK 22", gate: "22", seat: "7B")!)
        
        let generator = BoardingPassGenerator()
        
        let passes : Set<AnyBoardingPass> = generator.boardingPassesUnsorted()
        
        XCTAssertTrue(passes.contains(passMadridToBarcelona), "Missing from Madrid to Barcelona")
        XCTAssertTrue(passes.contains(passBarcelonaToGerona), "Missing from Barcelona to Gerona")
        XCTAssertTrue(passes.contains(passGeronaToLondon), "Missing from Gerona to London")
        XCTAssertTrue(passes.contains(passLondonToNewYork), "Missing from London to New York")
    }
}
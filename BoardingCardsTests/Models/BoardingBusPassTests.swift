//
//  BoardingPassTests.swift
//
//  Copyright (c) 2015 Francisco J. Belchi. All rights reserved.

import UIKit
import XCTest
import BoardingCards

class BoardingBusPassTests: XCTestCase {

    func testBoardingPassConstructor_Success() {
        let madrid = City(name: "Madrid")
        let barcelona = City(name: "Barcelona")
        let boardingPass = BoardingBusPass(boardingId: "test", cityFrom: madrid, cityTo: barcelona, bus: "bus", seat: "seat")

        if let pass = boardingPass {
            XCTAssertEqual(pass.boardingId, "test")
            XCTAssertEqual(pass.cityFrom.name, madrid.name)
            XCTAssertEqual(pass.cityTo.name, barcelona.name)
            XCTAssertEqual(pass.busName, "bus")
            XCTAssertEqual(pass.seatNumber, "seat")
        } else {
            XCTFail("BoardingPass has Not to be Nil")
        }
    }
    
    func testBoardingPassConstructor_Fail() {
        let madrid = City(name: "Madrid")
        let barcelona = City(name: "Barcelona")
        let boardingPass = BoardingBusPass(boardingId: "", cityFrom: madrid, cityTo: barcelona, bus: "bus", seat: "seat")
        
        if let _ = boardingPass {
            XCTFail("BoardingPass has to be Nil")
        }
    }
    
    func testBoardingPassEquatable_Success() {
        let madrid = City(name: "Madrid")
        let barcelona = City(name: "Barcelona")
        let boardingPass1 = BoardingBusPass(boardingId: "test", cityFrom: madrid, cityTo: barcelona, bus: "bus", seat: "seat")
        let boardingPass2 = BoardingBusPass(boardingId: "test", cityFrom: madrid, cityTo: barcelona, bus: "bus", seat: "seat")
        
        XCTAssertEqual(boardingPass1!, boardingPass2!, "both has to be equal")
    }
    
    func testBoardingPassNotEquatable_Success() {
        let madrid = City(name: "Madrid")
        let barcelona = City(name: "Barcelona")
        
        let boardingPass1 = BoardingBusPass(boardingId: "1", cityFrom: madrid, cityTo: barcelona, bus: "bus", seat: "seat")
        
        let boardingPass2 = BoardingBusPass(boardingId: "2", cityFrom: madrid, cityTo: barcelona, bus: "bus", seat: "seat")
        
        XCTAssertNotEqual(boardingPass1!, boardingPass2!, "both has not to be equal")
    }
}


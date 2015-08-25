//
//  BoardingPassSorterTests.swift
//
//  Copyright (c) 2015 Francisco J. Belchi. All rights reserved.

import Foundation
import XCTest
import BoardingCards

class BoardingPassSorterTests: XCTestCase {
    
    func testSorterWithCodeTestExample_Success() {
        let generator = BoardingPassGenerator()
        let passes : Set<AnyBoardingPass> = generator.boardingPassesUnsorted()
        let sorter = BoardingPassSorter()
        
        let sortedPassses = sorter.sort(passes)
        let resultSorted = generator.boardingPassesSorted()
        
        XCTAssertEqual(sortedPassses, resultSorted, "Both list should be equals")
    }
}
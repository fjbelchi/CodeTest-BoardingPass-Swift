//
//  AnyBoardingPass.swift
//
//  Copyright © 2015 Francisco J. Belchi. All rights reserved.

import Foundation

public struct AnyBoardingPass : BoardingPassType {
    
    public let boardingPass: BoardingPassType
    
    public var boardingId: String {
        return self.boardingPass.boardingId
    }
    
    public var cityFrom: City {
        return self.boardingPass.cityFrom
    }
    
    public var cityTo: City {
        return self.boardingPass.cityTo
    }
    
    public init(_ boardingPass: BoardingPassType) {
        self.boardingPass = boardingPass
    }
}

// MARK: Hashable

extension AnyBoardingPass: Hashable {
    public var hashValue: Int {
        return self.boardingPass.boardingId.hash;
    }
}

// MARK: Equatable

extension AnyBoardingPass: Equatable {}

public func == (lhs: AnyBoardingPass, rhs: AnyBoardingPass) -> Bool {
    return lhs.boardingPass.isEqualTo(rhs.boardingPass)
}

// MARK: CustomStringConvertible

extension AnyBoardingPass: CustomStringConvertible {
    public var description: String {
        return "AnyBoardingPass id=\(self.boardingPass.boardingId), from=\(self.boardingPass.cityFrom.name), to=\(self.boardingPass.cityTo.name)"
    }
}

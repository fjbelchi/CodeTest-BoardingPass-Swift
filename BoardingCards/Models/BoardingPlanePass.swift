//
//  BoardingPlanePass.swift
//
//  Copyright (c) 2015 Francisco J. Belchi. All rights reserved.

import Foundation

public struct BoardingPlanePass : BoardingPassType {
    
    public let boardingId: String
    public let cityFrom: City
    public let cityTo: City
    public let flightNumber: String
    public let gate: String
    public let seatNumber: String
    
    public init?(boardingId: String, cityFrom: City, cityTo: City, flightNumber: String, gate: String, seat: String) {
        guard boardingId.characters.count != 0 else {
            return nil
        }
        
        guard seat.characters.count != 0 else {
            return nil
        }
        
        guard flightNumber.characters.count != 0 else {
            return nil
        }
        
        self.boardingId = boardingId
        self.cityFrom = cityFrom
        self.cityTo = cityTo
        self.flightNumber = flightNumber
        self.gate = gate
        self.seatNumber = seat
    }
}

// MARK: Hashable

extension BoardingPlanePass : Hashable {
    public var hashValue : Int {
        return self.boardingId.hash
    }
}

// MARK: Equatable

extension BoardingPlanePass : Equatable {}

public func == (lhs: BoardingPlanePass, rhs: BoardingPlanePass) -> Bool {
    return lhs.boardingId == rhs.boardingId
}

// MARK: CustomStringConvertible

extension BoardingPlanePass : CustomStringConvertible {
    public var description : String {
        return "BoardingPlanePass : id=\(self.boardingId), from=\(self.cityFrom.name), to=\(self.cityTo.name), seat=\(self.seatNumber), flightNumber=\(self.flightNumber), gate=\(self.gate), seat=\(self.seatNumber)"
    }
}
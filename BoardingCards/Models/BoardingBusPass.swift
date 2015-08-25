//
//  BoardingBusPass.swift
//
//  Copyright (c) 2015 Francisco J. Belchi. All rights reserved.

import Foundation

public struct BoardingBusPass : BoardingPassType {
    
    public let boardingId: String
    public let cityFrom: City
    public let cityTo: City
    public let busName: String
    public let seatNumber: String
    
    public init?(boardingId: String, cityFrom: City, cityTo: City, bus: String, seat: String) {
        guard boardingId.characters.count != 0 else {
            return nil
        }
        
        guard seat.characters.count != 0 else {
            return nil
        }
        
        guard bus.characters.count != 0 else {
            return nil
        }
        
        self.boardingId = boardingId
        self.cityFrom = cityFrom
        self.cityTo = cityTo
        self.busName = bus
        self.seatNumber = seat
    }
}

// MARK: Hashable

extension BoardingBusPass : Hashable {
    public var hashValue : Int {
        return self.boardingId.hash
    }
}

// MARK: Equatable

extension BoardingBusPass : Equatable {}
    
public func == (lhs: BoardingBusPass, rhs: BoardingBusPass) -> Bool {
    return lhs.boardingId == rhs.boardingId
}

// MARK: CustomStringConvertible

extension BoardingBusPass : CustomStringConvertible {
    public var description : String {
        return "BoardingBusPass : id=\(self.boardingId), from=\(self.cityFrom.name), to=\(self.cityTo.name), seat=\(self.seatNumber), bus=\(self.busName)"
    }
}

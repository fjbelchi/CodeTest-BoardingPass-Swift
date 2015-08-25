//
//  BoardingTrainPass.swift
//
//  Copyright (c) 2015 Francisco J. Belchi. All rights reserved.

import Foundation

public struct BoardingTrainPass : BoardingPassType {
    
    public let boardingId: String
    public let cityFrom: City
    public let cityTo: City
    public let trainName: String
    public let seatNumber: String
    
    public init?(boardingId: String, cityFrom: City, cityTo: City, train: String, seat: String) {
        guard boardingId.characters.count != 0 else {
            return nil
        }
        
        guard seat.characters.count != 0 else {
            return nil
        }
        
        guard train.characters.count != 0 else {
            return nil
        }
        
        self.boardingId = boardingId
        self.cityFrom = cityFrom
        self.cityTo = cityTo
        self.trainName = train
        self.seatNumber = seat
    }
}

// MARK: Hashable

extension BoardingTrainPass : Hashable {
    public var hashValue : Int {
        return self.boardingId.hash
    }
}

// MARK: Equatable

extension BoardingTrainPass : Equatable {}

public func == (lhs: BoardingTrainPass, rhs: BoardingTrainPass) -> Bool {
    return lhs.boardingId == rhs.boardingId
}

// MARK: CustomStringConvertible

extension BoardingTrainPass : CustomStringConvertible {
    public var description : String {
        return "BoardingTrainPass : id=\(self.boardingId), from=\(self.cityFrom.name), to=\(self.cityTo.name), seat=\(self.seatNumber), train=\(self.trainName)"
    }
}

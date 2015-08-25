//
//  BoardingPassType.swift
//
//  Copyright (c) 2015 Francisco J. Belchi. All rights reserved.

import Foundation

public protocol BoardingPassType {
    var boardingId: String { get }
    var cityFrom: City { get }
    var cityTo: City { get }
    
    func isEqualTo(boardingPass: BoardingPassType) -> Bool
}

extension Equatable where Self: BoardingPassType {
    
    public func isEqualTo(boarding: BoardingPassType) -> Bool {
        guard let other = boarding as? Self else { return false }
        return other.boardingId == self.boardingId
    }
}

/*
Tweet by Joe Goff (@jckarter):
@fjbelchi @DaveAbrahams No clean way currently. One possibility is to have a struct AnyDrawable: Drawable { var d: Drawable } wrapper.
extension Hashable where Self: BoardingPassType {
    
    public var hashValue : Int {
        return boardingId.hash;
    }
}
*/

/* It worked on xcode 7b4
extension BoardingPassType : CustomDebugStringConvertible {
    public var debugDescription : String {
        return "id=\(self.boardingId), from=\(self.cityFrom.name), to=\(self.cityTo.name)"
    }
}
*/

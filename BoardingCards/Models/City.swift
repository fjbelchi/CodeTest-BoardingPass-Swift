//
//  City.swift
//
//  Copyright (c) 2015 Francisco J. Belchi. All rights reserved.

import Foundation

public struct City : Hashable, CustomStringConvertible {
    public let name : String
    
    public var description : String {
        return "\(self.name)"
    }
    
    public init(name: String){
        self.name = name
    }
    
    public var hashValue: Int {
        return self.name.hash;
    }
}

public func ==(lhs: City, rhs: City) -> Bool {
    return lhs.name == rhs.name
}
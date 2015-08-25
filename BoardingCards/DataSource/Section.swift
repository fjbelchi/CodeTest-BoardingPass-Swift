//
//  Section.swift
//
//  Copyright (c) 2015 Francisco J. Belchi. All rights reserved.

import Foundation

/// Section is a struct which encapsule the sections of a tableview data source

public struct Section<T> {
    public let items: [T]
    
    public init(_ items: [T]) {
        self.items = items
    }
}

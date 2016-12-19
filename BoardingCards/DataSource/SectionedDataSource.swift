//
//  SectionedDataSource.swift
//
//  Copyright (c) 2015 Francisco J. Belchi. All rights reserved.

import Foundation

/// Struct to group multiples sections for a UITableViewDataSource

struct SectionedDataSource<T> {
    let sections: [[T]]
    
    init(sections: [[T]]) {
        self.sections = sections
    }
    
    func numberOfSections() -> Int {
        return self.sections.count
    }
    
    func numberOfItems(inSection: Int) -> Int {
        return self.sections[inSection].count
    }
    
    func itemAt(_ indexPath: IndexPath) -> T {
        return self.sections[indexPath.section][indexPath.row]
    }
}


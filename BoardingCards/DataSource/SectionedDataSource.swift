//
//  SectionedDataSource.swift
//
//  Copyright (c) 2015 Francisco J. Belchi. All rights reserved.

import Foundation

/// Struct to group multiples sections for a UITableViewDataSource

struct SectionedDataSource<T> {
    let sections: [Section<T>]
    
    init(sections: [Section<T>]) {
        self.sections = sections
    }
    
    func numberOfSections() -> Int {
        return sections.count
    }
    
    func numberOfItemsInSection(section: Int) -> Int {
        return sections[section].items.count
    }
    
    func itemAtIndexPath(indexPath: NSIndexPath) -> T {
        return sections[indexPath.section].items[indexPath.row]
    }
}


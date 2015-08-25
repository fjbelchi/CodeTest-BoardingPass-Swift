//
//  TableViewDataSource.swift
//
//  Copyright (c) 2015 Francisco J. Belchi. All rights reserved.

import UIKit

/** 
    TableViewDataSource is an implementation of UITableViewDataSource.

    The class is a composition of following components.
    - TableViewAdapter: UI business logic
    - SectionsDataSource: Collection of data to display
*/

final public class TableViewDataSource<ItemType, Adapter: TableViewAdapter where Adapter.ItemType == ItemType>: NSObject, UITableViewDataSource {
    
    var sections: SectionedDataSource<ItemType>
    let adapter: Adapter
    
    init(sections: SectionedDataSource<ItemType>, tableViewAdapter: Adapter) {
        self.sections = sections
        self.adapter = tableViewAdapter
    }
    
    // MARK: UITableViewDataSource
    
    public func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.sections.numberOfSections()
    }
    
    public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sections.numberOfItemsInSection(section)
    }
    
    public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let object = self.sections.itemAtIndexPath(indexPath)

        let identifier = self.adapter.reuseIdentifierForObject(object)
        
        let cell = tableView.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath)
        self.adapter.configureCell(tableView, cell: cell, object: object, indexPath: indexPath)
        return cell
    }
}

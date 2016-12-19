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

final public class TableViewDataSource<ItemType, Adapter: TableViewAdapter>: NSObject, UITableViewDataSource where Adapter.ItemType == ItemType {
    
    var sections: SectionedDataSource<ItemType>
    let adapter: Adapter
    
    init(sections: SectionedDataSource<ItemType>, tableViewAdapter: Adapter) {
        self.sections = sections
        self.adapter = tableViewAdapter
    }
    
    // MARK: UITableViewDataSource
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections.numberOfSections()
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sections.numberOfItems(inSection: section)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let object = self.sections.itemAt(indexPath)

        let identifier = self.adapter.reuseIdentifierForObject(object)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        self.adapter.configureCell(tableView, cell: cell, object: object, indexPath: indexPath)
        return cell
    }
}

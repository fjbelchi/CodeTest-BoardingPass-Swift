//
//  TableViewAdapter.swift
//
//  Copyright (c) 2015 Francisco J. Belchi. All rights reserved.

import Foundation
import UIKit

public typealias CellAdapterRegistration = (identifier: String, cellClass: AnyClass)

/**
    TableViewAdapter is an adapter class in charge 
*/
public protocol TableViewAdapter {
    typealias ItemType
    
    var rowHeight: CGFloat { get }
    var classOfCellToRegister: [CellAdapterRegistration] { get }
    
    func reuseIdentifierForObject(object: ItemType) -> String
    func configureCell(tableView: UITableView, cell:UITableViewCell, object:ItemType, indexPath:NSIndexPath)
}

extension UITableView {
    func registerCells<T: TableViewAdapter>(adapter: T) {
        for cellAdapter in adapter.classOfCellToRegister  {
            self.registerClass(cellAdapter.cellClass, forCellReuseIdentifier: cellAdapter.identifier)
        }
    }
}

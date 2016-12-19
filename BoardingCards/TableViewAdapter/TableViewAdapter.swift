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
    associatedtype ItemType
    
    var rowHeight: CGFloat { get }
    var classOfCellToRegister: [CellAdapterRegistration] { get }
    
    func reuseIdentifierForObject(_ object: ItemType) -> String
    func configureCell(_ tableView: UITableView, cell:UITableViewCell, object:ItemType, indexPath:IndexPath)
}

extension UITableView {
    func registerCells<T: TableViewAdapter>(_ adapter: T) {
        for cellAdapter in adapter.classOfCellToRegister  {
            self.register(cellAdapter.cellClass, forCellReuseIdentifier: cellAdapter.identifier)
        }
    }
}

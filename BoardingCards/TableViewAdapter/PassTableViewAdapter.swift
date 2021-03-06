//
//  PassTableViewAdapter.swift
//
//  Copyright (c) 2015 Francisco J. Belchi. All rights reserved.

import Foundation
import UIKit

/// TableViewAdapter for displaying Boarding Passes

final class PassTableViewAdapter : TableViewAdapter {
    
    typealias ItemType = AnyBoardingPass
    
    let rowHeight = UITableViewAutomaticDimension
    
    var classOfCellToRegister : [CellAdapterRegistration] {
        let busCell = CellAdapterRegistration(identifier: BoardingBusPass.cellIdentifier(), cellClass: UITableViewCell.self)
        let trainCell = CellAdapterRegistration(identifier: BoardingTrainPass.cellIdentifier(), cellClass: TrainTableViewCell.self)
        let planeCell = CellAdapterRegistration(identifier: BoardingPlanePass.cellIdentifier(), cellClass: UITableViewCell.self)
        return [busCell, trainCell, planeCell]
    }
    
    func reuseIdentifierForObject(_ object: ItemType) -> String {
        if let boardingPass = object.boardingPass.self as? ConfigureCell {
            return type(of: boardingPass).cellIdentifier()
        } else {
            return ""
        }
    }
    
    func configureCell(_ tableView: UITableView, cell:UITableViewCell, object:ItemType, indexPath:IndexPath) {
        if let boardingPass = object.boardingPass.self as? ConfigureCell {
            boardingPass.configureCell(cell)
        }
    }
    
}

private protocol ConfigureCell {
    static func cellIdentifier() -> String
    func configureCell(_ cell: UITableViewCell)
}

extension BoardingBusPass: ConfigureCell {
    static func cellIdentifier() -> String {
        return "busIdentifier"
    }
    
    func configureCell(_ cell: UITableViewCell) {
        cell.textLabel?.text = self.description
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.font = UIFont.systemFont(ofSize: 12.0)
        cell.backgroundColor = UIColor.cyan
    }
}

extension BoardingTrainPass: ConfigureCell {
    static func cellIdentifier() -> String {
        return "trainIdentifier"
    }
    
    func configureCell(_ cell: UITableViewCell) {
        guard let cell = cell as? TrainTableViewCell else {
            return
        }
        
        cell.titleHeader = "Train"
        cell.trainDescription = self.description
    }
}

extension BoardingPlanePass: ConfigureCell {
    static func cellIdentifier() -> String {
        return "PlaneIdentifier"
    }
    
    func configureCell(_ cell: UITableViewCell) {
        cell.textLabel?.text = self.description
        cell.textLabel?.font = UIFont.systemFont(ofSize: 12.0)
        cell.textLabel?.numberOfLines = 0
        cell.backgroundColor = UIColor.brown
    }
}

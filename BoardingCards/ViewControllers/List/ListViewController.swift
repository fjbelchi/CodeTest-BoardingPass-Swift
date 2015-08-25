//
//  ListViewController.swift
//
//  Copyright (c) 2015 Francisco J. Belchi. All rights reserved.

import UIKit

final public class ListViewController: UIViewController {

    lazy private var autolayoutConstrains = [NSLayoutConstraint]()
    
    lazy private var tableView: UITableView = {
        [unowned self] in
        let view = UITableView(frame: CGRectZero, style: .Plain)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.registerCells(self.tableViewAdapter)
        view.rowHeight = self.tableViewAdapter.rowHeight
        view.estimatedRowHeight = 44.0
        view.dataSource = self.tableViewDataSource
        view.allowsSelection = false
        
        let xConstraint = NSLayoutConstraint(item: view, attribute: .Left,
                                             relatedBy: .Equal,
                                             toItem: self.view, attribute: .Left, multiplier: 1.0, constant: 0)
        
        let yConstraint = NSLayoutConstraint(item: view, attribute: .Top,
                                             relatedBy: .Equal,
                                             toItem: self.view, attribute: .Top, multiplier: 1.0, constant: 0)
        
        let widthConstraint = NSLayoutConstraint(item: view, attribute: .Right,
                                                 relatedBy: .Equal,
                                                 toItem: self.view, attribute: .Right, multiplier: 1.0, constant: 0)
        
        let heightConstraint = NSLayoutConstraint(item: view, attribute: .Bottom,
                                                  relatedBy: .Equal,
                                                  toItem: self.view, attribute: .Bottom, multiplier: 1.0, constant: 0)
        
        self.autolayoutConstrains += [xConstraint, yConstraint, widthConstraint, heightConstraint]
        return view
    }()
    
    lazy private var tableViewAdapter = PassTableViewAdapter()
    
    lazy private var tableViewDataSource: TableViewDataSource<AnyBoardingPass,PassTableViewAdapter>? = {
        [unowned self] in
        let passes = Array<AnyBoardingPass>(self.boardingPass)
        let sections = SectionedDataSource(sections: [Section(passes)])
        return TableViewDataSource(sections: sections, tableViewAdapter: self.tableViewAdapter)
    }()
    
    lazy private var boardingPass: Set<AnyBoardingPass> = {
        let generator = BoardingPassGenerator()
        return generator.boardingPassesUnsorted()
    }()
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Boarding Cards"
        self.view.addSubview(self.tableView)
        
        NSLayoutConstraint.activateConstraints(autolayoutConstrains)
        
        let sortButton = UIBarButtonItem(title: "Sort", style: .Plain, target: self, action:"sort")
        self.navigationItem.rightBarButtonItem = sortButton
    }
    
    func sort() {
        let sorter = BoardingPassSorter()
        let newSection = Section(sorter.sort(self.boardingPass))
        self.tableViewDataSource?.sections = SectionedDataSource(sections: [newSection])
        self.tableView.reloadData()
    }
}

//
//  ListViewController.swift
//
//  Copyright (c) 2015 Francisco J. Belchi. All rights reserved.

import UIKit

final public class ListViewController: UIViewController {

    lazy fileprivate var autolayoutConstrains = [NSLayoutConstraint]()
    
    lazy fileprivate var tableView: UITableView = {
        [unowned self] in
        let view = UITableView(frame: CGRect.zero, style: .plain)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.registerCells(self.tableViewAdapter)
        view.rowHeight = self.tableViewAdapter.rowHeight
        view.estimatedRowHeight = 44.0
        view.dataSource = self.tableViewDataSource
        view.allowsSelection = false
        
        let xConstraint = NSLayoutConstraint(item: view, attribute: .left,
                                             relatedBy: .equal,
                                             toItem: self.view, attribute: .left, multiplier: 1.0, constant: 0)
        
        let yConstraint = NSLayoutConstraint(item: view, attribute: .top,
                                             relatedBy: .equal,
                                             toItem: self.view, attribute: .top, multiplier: 1.0, constant: 0)
        
        let widthConstraint = NSLayoutConstraint(item: view, attribute: .right,
                                                 relatedBy: .equal,
                                                 toItem: self.view, attribute: .right, multiplier: 1.0, constant: 0)
        
        let heightConstraint = NSLayoutConstraint(item: view, attribute: .bottom,
                                                  relatedBy: .equal,
                                                  toItem: self.view, attribute: .bottom, multiplier: 1.0, constant: 0)
        
        self.autolayoutConstrains += [xConstraint, yConstraint, widthConstraint, heightConstraint]
        return view
    }()
    
    lazy fileprivate var tableViewAdapter = PassTableViewAdapter()
    
    lazy fileprivate var tableViewDataSource: TableViewDataSource<AnyBoardingPass,PassTableViewAdapter>? = {
        [unowned self] in
        let passes = Array<AnyBoardingPass>(self.boardingPass)
        let sections = SectionedDataSource(sections: [passes])
        return TableViewDataSource(sections: sections, tableViewAdapter: self.tableViewAdapter)
    }()
    
    lazy fileprivate var boardingPass: Set<AnyBoardingPass> = {
        let generator = BoardingPassGenerator()
        return generator.boardingPassesUnsorted()
    }()
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Boarding Cards"
        self.view.addSubview(self.tableView)
        
        NSLayoutConstraint.activate(autolayoutConstrains)
        
        let sortButton = UIBarButtonItem(title: "Sort", style: .plain, target: self, action:#selector(ListViewController.sort))
        self.navigationItem.rightBarButtonItem = sortButton
    }
    
    func sort() {
        let sorter = BoardingPassSorter()
        let newSection = sorter.sort(self.boardingPass)
        self.tableViewDataSource?.sections = SectionedDataSource(sections: [newSection])
        self.tableView.reloadData()
    }
}

//
//  TrainTableViewCell.swift
//
//  Copyright © 2015 Francisco J. Belchi. All rights reserved.

import UIKit

/// TrainTableViewCell is a custom cell to display Boarding Train Passes

final class TrainTableViewCell: UITableViewCell {
    
    lazy private var autolayoutConstrains = [NSLayoutConstraint]()
    
    lazy private var headerTitleLabel: UILabel = {
        [unowned self] in
        let view = UILabel(frame: CGRectZero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .Center
        view.font = UIFont.boldSystemFontOfSize(14.0)
        view.textColor = UIColor.blueColor()

        let xConstraint = NSLayoutConstraint(item: view, attribute: .Left,
            relatedBy: .Equal,
            toItem: self.contentView, attribute: .Left, multiplier: 1.0, constant: 20)
        
        let yConstraint = NSLayoutConstraint(item: view, attribute: .Top,
            relatedBy: .Equal,
            toItem: self.contentView, attribute: .Top, multiplier: 1.0, constant: 10)
        
        let widthConstraint = NSLayoutConstraint(item: view, attribute: .Right,
            relatedBy: .Equal,
            toItem: self.contentView, attribute: .Right, multiplier: 1.0, constant: -20)
        
        self.autolayoutConstrains += [xConstraint, yConstraint, widthConstraint]
        return view
    }()
    
    lazy private var trainDescriptionLabel: UILabel = {
        [unowned self] in
        let view = UILabel(frame: CGRectZero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont.systemFontOfSize(12.0)
        view.textAlignment = .Center
        view.numberOfLines = 0
        
        let xConstraint = NSLayoutConstraint(item: view, attribute: .Left,
            relatedBy: .Equal,
            toItem: self.contentView, attribute: .Left, multiplier: 1.0, constant: 20)
        
        let yConstraint = NSLayoutConstraint(item: view, attribute: .Top,
            relatedBy: .Equal,
            toItem: self.headerTitleLabel, attribute: .Bottom, multiplier: 1.0, constant: 10)
        
        let widthConstraint = NSLayoutConstraint(item: view, attribute: .Right,
            relatedBy: .Equal,
            toItem: self.contentView, attribute: .Right, multiplier: 1.0, constant: -20)
        
        let heightConstraint = NSLayoutConstraint(item: self.contentView, attribute: .Bottom,
            relatedBy: .Equal,
            toItem: view, attribute: .Bottom, multiplier: 1.0, constant: 20)
        
        self.autolayoutConstrains += [xConstraint, yConstraint, widthConstraint, heightConstraint]
        return view
        }()
    
    var titleHeader: String? {
        didSet {
            self.headerTitleLabel.text = titleHeader
        }
    }
    
    var trainDescription: String? {
        didSet {
            self.trainDescriptionLabel.text = trainDescription
        }
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(self.headerTitleLabel)
        self.contentView.addSubview(self.trainDescriptionLabel)
        
        NSLayoutConstraint.activateConstraints(autolayoutConstrains)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

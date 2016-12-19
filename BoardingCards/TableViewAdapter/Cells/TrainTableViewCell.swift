//
//  TrainTableViewCell.swift
//
//  Copyright © 2015 Francisco J. Belchi. All rights reserved.

import UIKit

/// TrainTableViewCell is a custom cell to display Boarding Train Passes

final class TrainTableViewCell: UITableViewCell {
    
    lazy fileprivate var autolayoutConstrains = [NSLayoutConstraint]()
    
    lazy fileprivate var headerTitleLabel: UILabel = {
        [unowned self] in
        let view = UILabel(frame: CGRect.zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .center
        view.font = UIFont.boldSystemFont(ofSize: 14.0)
        view.textColor = UIColor.blue

        let xConstraint = NSLayoutConstraint(item: view, attribute: .left,
            relatedBy: .equal,
            toItem: self.contentView, attribute: .left, multiplier: 1.0, constant: 20)
        
        let yConstraint = NSLayoutConstraint(item: view, attribute: .top,
            relatedBy: .equal,
            toItem: self.contentView, attribute: .top, multiplier: 1.0, constant: 10)
        
        let widthConstraint = NSLayoutConstraint(item: view, attribute: .right,
            relatedBy: .equal,
            toItem: self.contentView, attribute: .right, multiplier: 1.0, constant: -20)
        
        self.autolayoutConstrains += [xConstraint, yConstraint, widthConstraint]
        return view
    }()
    
    lazy fileprivate var trainDescriptionLabel: UILabel = {
        [unowned self] in
        let view = UILabel(frame: CGRect.zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont.systemFont(ofSize: 12.0)
        view.textAlignment = .center
        view.numberOfLines = 0
        
        let xConstraint = NSLayoutConstraint(item: view, attribute: .left,
            relatedBy: .equal,
            toItem: self.contentView, attribute: .left, multiplier: 1.0, constant: 20)
        
        let yConstraint = NSLayoutConstraint(item: view, attribute: .top,
            relatedBy: .equal,
            toItem: self.headerTitleLabel, attribute: .bottom, multiplier: 1.0, constant: 10)
        
        let widthConstraint = NSLayoutConstraint(item: view, attribute: .right,
            relatedBy: .equal,
            toItem: self.contentView, attribute: .right, multiplier: 1.0, constant: -20)
        
        let heightConstraint = NSLayoutConstraint(item: self.contentView, attribute: .bottom,
            relatedBy: .equal,
            toItem: view, attribute: .bottom, multiplier: 1.0, constant: 20)
        
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
        
        NSLayoutConstraint.activate(autolayoutConstrains)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

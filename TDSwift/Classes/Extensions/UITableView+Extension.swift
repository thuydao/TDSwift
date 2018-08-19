//
//  UITableView+Extension.swift
//

import Foundation
import UIKit

public extension UITableView {
    
    func disableStickyHeader() {
        let dummyViewHeight = CGFloat(40)
        self.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: dummyViewHeight))
        self.contentInset = UIEdgeInsets(top: -dummyViewHeight, left: 0, bottom: 0, right: 0)
    }
    
    func registerCells(_ identifiers: String...) {
        
        for identifier in identifiers {
            self.register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
        }
    }
}

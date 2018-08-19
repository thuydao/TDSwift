//
//  String+Extension.swift
//

import Foundation
import UIKit

extension NSObject {
    
    var className: String {
        
        return String(describing: type(of: self))
    }
    
    class var className: String {
        
        return String(describing: self)
    }
}

extension UINavigationController {
    
    func setHiddenNavigation() {
        
        self.isNavigationBarHidden = true
        self.navigationBar.isTranslucent = false
    }
}

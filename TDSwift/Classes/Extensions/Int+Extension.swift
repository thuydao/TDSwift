//
//  Int.swift
//

import Foundation

public extension Int {
    
    func toViews() -> String {
        if (self/1000000) > 0 {
            return String(format: "%01dM", arguments: [self/1000000])
        } else if (self/1000) > 0{
            return String(format: "%01dK", arguments: [self/1000])
        } else {
            return "\(self)"
        }
    }
}

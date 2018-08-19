//
//  UIStoryboard+Extension.swift
//

import Foundation
import UIKit

extension UIStoryboard {
    class func loadViewControler(_ nameStoryBoard: String, nameController: String) -> UIViewController? {
        let storyboard = UIStoryboard(name: nameStoryBoard, bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: nameController)
        return controller
    }
}

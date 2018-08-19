//
//  UIView+Extension.swift
//

import Foundation
import UIKit
extension UIView {
    func getParentViewController(_ current: UIView) -> UIViewController? {
        var parentController: UIViewController?
        var responder: UIResponder? = current
        while true {
            responder = responder!.next
            if responder == nil {
                break
            }
            parentController = responder as? UIViewController
            if parentController != nil {
                break
            }
        }
        return parentController
    }
    
    class func fromNib<T: UIView>() -> T {
        
        guard let view = Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)?.first as? T else {
            return T()
        }
        
        return view
    }
    
    func convertDateString(dateString: String, fromFormat sourceFormat: String, toFormat desFormat: String!) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = sourceFormat
        guard let date = dateFormatter.date(from: dateString) else {
            return ""
        }
        dateFormatter.dateFormat = desFormat
        
        return dateFormatter.string(from: date)
    }
    
    func setGradientBackground(startColor: UIColor, endColor: UIColor) {
        
        let colorTop = startColor.cgColor
        let colorBottom = endColor.cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [ colorTop, colorBottom]
        gradientLayer.locations = [ 0.0, 1.0]
        gradientLayer.frame = UIScreen.main.bounds
        
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        
        get {
            return layer.borderWidth
        }
        
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat {
        
        get {
            return layer.shadowRadius
        }
        
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable
    var shadowOpacity: Float {
        
        get {
            return layer.shadowOpacity
        }
        
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize {
        
        get {
            return layer.shadowOffset
        }
        
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor? {
        
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
}

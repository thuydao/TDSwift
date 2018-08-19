//
//  BaseCustomXibView.swift
//

import UIKit
class BaseCustomXibView: UIView {
    var view: UIView!
    fileprivate(set) var nibName: String!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
        xibSetup()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
        xibSetup()
    }
    fileprivate func xibSetup() {
        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.isUserInteractionEnabled = true
        addSubview(view)
        didLoadFromNib()
    }
    
    func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        if let view = nib.instantiate(withOwner: self, options: nil)[0] as? UIView {
            return view
        }
        return UIView()
    }
    
    func initialize() {
        nibName = "\(self.classForCoder)"
    }
    
    func didLoadFromNib() {}
}

//
//  Utils.swift
//

import Foundation
import UIKit


public class Utils: NSObject {
    
    class func screenSize() -> CGSize {
        return UIScreen.main.bounds.size
    }

    
    // MARK: Storyboard
    class func mainStoryboard() -> UIStoryboard {
        let storyboard = storyboardBoardWithName(storyboardName: "Main")
        return storyboard
    }
    
    class func storyboardBoardWithName(storyboardName: String) -> UIStoryboard {
        let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle.main)
        return storyboard
    }
    
    class func viewController(storyboardId: String, storyboardName: String) -> UIViewController? {
        let storyboard = storyboardBoardWithName(storyboardName: storyboardName)
        let viewController: AnyObject = storyboard.instantiateViewController(withIdentifier: storyboardId)
        return viewController as? UIViewController
    }


    class func registerNibWithTableView(nibName: String, tableView: UITableView) {
        let nib = Utils.nib(name: nibName)
        tableView.register(nib, forCellReuseIdentifier: nibName)
    }

    class func registerNibWithCollectionView(nibName: String, collectionView: UICollectionView) {
        let nib = Utils.nib(name: nibName)
        collectionView.register(nib, forCellWithReuseIdentifier: nibName)
    }
    
    class func registerSupplementaryElementOfKindNibWithCollectionView(nibName: String, kind: String, collectionView: UICollectionView) {
        let nib = Utils.nib(name: nibName)
        collectionView.register(nib, forSupplementaryViewOfKind: kind, withReuseIdentifier: nibName)
    }
    
    

    class func convertStringToDictionary(text: String) -> [String:AnyObject]? {
        if let data = text.data(using: String.Encoding.utf8) {
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:AnyObject]
                return json
            } catch {
                print(NSLocalizedString("Convert String To Dictionary Error", comment: ""))
            }
        }
        return nil
    }
    
    class func nib(name: String) -> UINib? {
        let nib: UINib? = UINib(nibName: name, bundle: Bundle.main)
        return nib
    }
    
    class func viewFrom(nibName: String) -> UIView? {
        if let objects = Bundle.main.loadNibNamed(nibName, owner: nil, options: nil), objects.count > 0 {
            return objects[0] as? UIView
        }
        return nil
    }
    
    
    internal static func getApplicationDetails() -> (name:String, version:String) {
        var version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
        var name = Bundle(for:object_getClass(self)!).bundleIdentifier
        if name == nil {
            print("Could not retrieve application name. Application name is set to nil")
            name = "nil"
        }
        if version == nil {
            print("Could not retrieve application version. Application version is set to nil")
            version = "nil"
        }
        return (name!, version!)
        
    }
}

//
//  DeviceType.swift
//

import Foundation
import UIKit

public enum UIUserInterfaceIdiom : Int
{
    case unspecified
    case phone
    case pad
}

public struct ScreenSize
{
    static let SCREEN_WIDTH         = UIScreen.main.bounds.size.width
    static let SCREEN_HEIGHT        = UIScreen.main.bounds.size.height
    static let SCREEN_MAX_LENGTH    = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    static let SCREEN_MIN_LENGTH    = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
}

public struct DeviceType
{
    static let IS_IPHONE_4          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH < 568.0
    static let IS_IPHONE_5          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 568.0
    static let IS_IPHONE_6          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 667.0
    static let IS_IPHONE_6P         = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 736.0
    static let IS_IPAD              = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.SCREEN_MAX_LENGTH == 1024.0
    static let IS_IPAD_PRO          = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.SCREEN_MAX_LENGTH == 1366.0
    static let IS_IPHONE_X          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 812.0
    static let IS_IPHONE_7          = IS_IPHONE_6
    static let IS_IPHONE_7P         = IS_IPHONE_6P
    
    static let isIpad = IS_IPAD_PRO || IS_IPAD
    static let isIphone = !(IS_IPAD_PRO || IS_IPAD)
}

public struct DeviceFrame {
    static let IPHONE_6 = CGSize(width: 375, height: 667)
    static let IPHONE_6P = CGSize(width: 414, height: 736)
    static let IPHONE_7 = IPHONE_6
    static let IPHONE_7P = IPHONE_6P
    static let IPHONE_5 = CGSize(width: 320, height: 568)
    static let IPHONE_4 = CGSize(width: 320, height: 480)
}

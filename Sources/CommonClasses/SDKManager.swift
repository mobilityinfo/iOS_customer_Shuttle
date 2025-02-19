//
//  Initialize.swift
//  Orca Shuttle
//
//  Created by Harshit Garg on 14/02/25.
//

import UIKit
import SwiftUI

public class SDKManager {
    
    @MainActor public static let shared = SDKManager()
       // public var personalData : UserData?
    public var appInfo: AppInfo = AppInfo(theme: .red)

    public func initializeSDK( theme: UIColor?) {
//        if let userModel = userModel {
//            personalData = userModel
//        }
        if let theme = theme {
            self.appInfo.theme = theme
        }
        
        print("✅ SDK Initialized with Theme: \(theme?.description ?? "Default")")
    }
}

extension Color {
    static let backgroundGray = Color("background_gray", bundle: .module)
    static let backgroundBlue = Color("background_blue", bundle: .module)
    static let border = Color("border", bundle: .module)
    static let darkGray = Color("dark_gray", bundle: .module)
    static var theme: Color {
           @MainActor get { // Ensures execution on the main thread
               Color(uiColor: SDKManager.shared.appInfo.theme)
           }
       }
   
}


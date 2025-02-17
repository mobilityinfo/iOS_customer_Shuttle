//
//  Initialize.swift
//  Orca Shuttle
//
//  Created by Harshit Garg on 14/02/25.
//

import UIKit

public class SDKManager {
    
    @MainActor public static let shared = SDKManager()
        public var personalData : PeronalInfo?
    public var appInfo: AppInfo = AppInfo(theme: .red)

    public func initializeSDK(userModel: PeronalInfo?, theme: UIColor?) {
        if let userModel = userModel {
            personalData = userModel
        }
        if let theme = theme {
            self.appInfo.theme = theme
        }
        
        print("✅ SDK Initialized with User: \(String(describing: personalData?.userName ?? "")) and Theme: \(theme?.description ?? "Default")")
    }
}

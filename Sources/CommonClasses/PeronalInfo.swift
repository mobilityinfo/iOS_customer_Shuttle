//
//  PeronalInfo.swift
//  Orca Shuttle
//
//  Created by Harshit Garg on 14/02/25.
//

import UIKit


@MainActor var getPersonalData : UserData?
@MainActor var appInfo : AppInfo?

public struct AppInfo{
   public var theme : UIColor
}


public struct UserData {
    var city:Int?
    var emailVerificationStatus:Int?
    var gender:Int?
    var phone:String?
    var userId:Int?
    var userImage:String?
    var userName:String?
    var userEmail:String?
    var dob:String?
    
   public init(json: [String: Any]) {
        if let name = json["user_name"] as? String {
            userName = name
        }
        if let id = json["user_id"] as? Int {
            userId = id
        }
        if let cityid = json["city_id"] as? Int {
            city = cityid
        }
        if let emailVerificationStatus = json["email_verification_status"] as? Int {
            self.emailVerificationStatus = emailVerificationStatus
        }
        if let userImage = json["user_image"] as? String {
            self.userImage = userImage
        }
        
        if let userEmail = json["user_email"] as? String {
            self.userEmail = userEmail
        }
        if let phoneNumber = json["phone_number"] as? String{
            self.phone = phoneNumber
        }
        
        if let gender = json["gender"] as? Int{
            self.gender = gender
        }
        
        if let dob = json["date_of_birth"] as? String{
            self.dob = dob
        }
    }
    
}



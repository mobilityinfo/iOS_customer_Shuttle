//
//  RegisterFont.swift
//  ShuttleDevelopment
//
//  Created by Harshit Garg on 19/02/25.
//

import SwiftUI
import CoreText

public struct FontLoader {
    public static func registerFonts() {
        let fontNames = [
            "Poppins-Black",
            "Poppins-BlackItalic",
            "Poppins-Bold",
            "Poppins-BoldItalic",
            "Poppins-ExtraBold",
            "Poppins-ExtraBoldItalic",
            "Poppins-ExtraLight",
            "Poppins-ExtraLightItalic",
            "Poppins-Italic",
            "Poppins-Light",
            "Poppins-LightItalic",
            "Poppins-Medium",
            "Poppins-MediumItalic",
            "Poppins-Regular",
            "Poppins-SemiBold",
            "Poppins-SemiBoldItalic",
            "Poppins-Thin",
            "Poppins-ThinItalic"
        ]

        for fontName in fontNames {
            //for library
            guard let fontURL = Bundle.module.url(forResource: fontName, withExtension: "ttf") else {
            // for swiftui project
           // guard let fontURL = Bundle.main.url(forResource: fontName, withExtension: "ttf") else {
                print("⚠️ Font \(fontName) not found in package bundle")
                continue
            }

            var error: Unmanaged<CFError>?
            if !CTFontManagerRegisterFontsForURL(fontURL as CFURL, .process, &error) {
                print("❌ Failed to register \(fontName): \(error.debugDescription)")
            } else {
                print("✅ Successfully registered \(fontName)")
            }
        }
    }
}



//
//  SwiftUIView.swift
//  Orca Shuttle
//
//  Created by Harshit Garg on 14/02/25.
//

import SwiftUI

public struct SwiftUIView: View {
    public init() {}
    public var body: some View {
        ZStack{
            HStack{
                Color(cgColor: SDKManager.shared.appInfo.theme.cgColor)
                    }
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
        
    }
}

#Preview {
        SwiftUIView()
  
}

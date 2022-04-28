//
//  View+Extensions.swift
//  LastSubmissionIOSSederhana
//
//  Created by Enygma System on 05/04/22.
//

import Foundation
import SwiftUI

extension View{
    @ViewBuilder func hidden(_ hide : Bool) -> some View{
        switch hide{
        case true : self.hidden()
        case false : self
        }
    }
    
    func enableLightStatusBar() -> some View {
        self.modifier(LightStatusBarModifier())
    }
}

struct TintOverlay: View {
    var body: some View {
        ZStack {
            Text(" ")
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(
            LinearGradient(gradient: Gradient(colors: Color.gradient), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
        )
        .cornerRadius(25)
    }
}

struct LightStatusBarModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .onAppear {
                UIApplication.shared.statusBarStyle = .lightContent
            }
            .onDisappear {
                UIApplication.shared.statusBarStyle = .default
            }
    }
}


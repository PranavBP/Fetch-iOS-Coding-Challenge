//
//  TextModifiers.swift
//  Fetch-Recipe
//
//  Created by Pranav Bellam Prasad on 5/8/24.
//

import SwiftUI

struct TitleStyleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("Avenir-Black", size: 34.0))
            .bold()
            .multilineTextAlignment(.center)
    }
}

struct SubTitleStyleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("Avenir-Medium", size: 24.0))
            .bold()
    }
}

struct BodyTextStyleModifier: ViewModifier {
    var isBold: Bool
    
    func body(content: Content) -> some View {
        content
            .font(isBold ? .custom("Avenir-Medium", size: 16.0) : .custom("Avenir", size: 16.0))
    }
}

extension View {
    func titleStyle() -> some View {
        self.modifier(TitleStyleModifier())
    }
    
    func subTitleStyle() -> some View {
        self.modifier(SubTitleStyleModifier())
    }
    
    func bodyTextStyle(isBold: Bool) -> some View {
        self.modifier(BodyTextStyleModifier(isBold: isBold))
    }
}


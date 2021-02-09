//
//  Extensions.swift
//  Netflim
//
//  Created by Hiram Castro on 21/01/21.
//

import UIKit
import SwiftUI

extension LinearGradient {
    
    static let blackOpacityGradiente = LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.0), Color.black.opacity(0.95)]),
                                                      startPoint: .top,
                                                      endPoint: .bottom)
    
}

extension String {
    func widthOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }
}

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

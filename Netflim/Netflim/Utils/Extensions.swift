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

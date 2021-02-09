//
//  ActivityIndicator.swift
//  Netflim
//
//  Created by Hiram Castro on 09/02/21.
//

import Foundation
import SwiftUI

struct ActitivyIndicator: UIViewRepresentable {

    let style: UIActivityIndicatorView.Style
    @Binding var animate: Bool
    
    private let spinner: UIActivityIndicatorView = {
        $0.hidesWhenStopped = true
        return $0
    }(UIActivityIndicatorView(style: .medium))
    
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIActivityIndicatorView {
        spinner.style = style
        return spinner
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        animate ? uiView.startAnimating() : uiView.stopAnimating()
    }
    
    func configure(_ indicator:(UIActivityIndicatorView) -> Void) -> some View {
        indicator(spinner)
        return self
    }
    
}

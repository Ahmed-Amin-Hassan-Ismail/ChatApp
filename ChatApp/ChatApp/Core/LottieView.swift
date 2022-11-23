//
//  LottieView.swift
//  ChatApp
//
//  Created by Ahmed Amin on 23/11/2022.
//

import Foundation
import SwiftUI
import Lottie


struct LottieView: UIViewRepresentable {
    let lottieFile: String
    private let animationView = AnimationView()
    
    func makeUIView(context: Context) -> some UIView {

        let view = UIView(frame: .zero)

        animationView.animation = Animation.named(lottieFile)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play()
        
        view.addSubview(animationView)
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        animationView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true

        return view
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {

    }
}

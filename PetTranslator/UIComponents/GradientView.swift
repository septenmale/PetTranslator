//
//  GradientView.swift
//  PetTranslator
//
//  Created by Viktor Zavhorodnii on 13/02/2025.
//

import UIKit

extension UIView {
    func applyGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor(named: "backgroundWhite")?.cgColor ?? UIColor.white.cgColor,
            UIColor(named: "backgroundColorGreen")?.cgColor ?? UIColor.green.cgColor
        ]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        gradientLayer.frame = bounds
        layer.insertSublayer(gradientLayer, at: 0)
    }
}

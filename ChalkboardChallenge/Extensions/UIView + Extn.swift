//
//  UIViewExtensions.swift
//  UIViewExtensions
//
//  Created by Darren Gillman on 03/10/2021.
//

import UIKit

// One of my standard time-saving extensions.  Copied in.

extension UIView {
   func addForAutoLayout(_ views: UIView..., andPinWithInset inset: CGFloat? = nil) {
      views.forEach{
         $0.translatesAutoresizingMaskIntoConstraints = false
         addSubview($0)
         if let inset = inset {
            NSLayoutConstraint.activate([
               $0.leadingAnchor.constraint(equalTo: leadingAnchor, constant: inset),
               $0.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -inset),
               $0.topAnchor.constraint(equalTo: topAnchor, constant: inset),
               $0.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -inset)
            ])
         }
      }
   }
   
   // render the view within the view's bounds, then capture it as image
   func asImage() -> UIImage {
      let renderer = UIGraphicsImageRenderer(bounds: bounds)
      return renderer.image(actions: { rendererContext in
         layer.render(in: rendererContext.cgContext)
      })
   }
   
   
   func rotate360Degrees(duration: CFTimeInterval = 3) {
      let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
      rotateAnimation.fromValue = 0.0
      rotateAnimation.toValue = CGFloat(Double.pi * 2)
      rotateAnimation.isRemovedOnCompletion = false
      rotateAnimation.duration = duration
      rotateAnimation.repeatCount=Float.infinity
      self.layer.add(rotateAnimation, forKey: nil)
   }
   
   
   func stopAnimating() {
      self.layer.removeAllAnimations()
   }
}

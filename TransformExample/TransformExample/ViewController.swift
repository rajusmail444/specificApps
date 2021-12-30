//
//  ViewController.swift
//  TransformExample
//
//  Created by Rajesh Billakanti on 9/12/21.
//

import UIKit

class ViewController: UIViewController {
    
    private let myView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(myView)
        myView.backgroundColor = .systemBlue
        myView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        myView.center = view.center
        
        // Translate, scale, rotation
        
        // Identity
        
        DispatchQueue.main.asyncAfter(deadline: .now()+2) {
            UIView.animate(withDuration: 1) {
                self.applyMultiple()
            } completion: { done in
                DispatchQueue.main.asyncAfter(deadline: .now()+2) {
                    UIView.animate(withDuration: 1) {
                        self.myView.transform = .identity
                    }
                }
            }
        }
    }

    private func applyMultiple() {
        myView.transform = CGAffineTransform(rotationAngle: .pi/2)
            .concatenating(CGAffineTransform(translationX: -100, y: -200))
            .concatenating(CGAffineTransform(scaleX: 0.5, y: 0.5))
    }
    
    func translate() {
        myView.transform = CGAffineTransform(translationX: 100, y: 200)
    }
    
    func rotate() {
        myView.transform = CGAffineTransform(rotationAngle: .pi / 2)
    }
    
    func scale() {
        myView.transform = CGAffineTransform(scaleX: 2, y: 2)
    }
}


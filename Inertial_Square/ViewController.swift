//
//  ViewController.swift
//  Inertial_Square
//
//  Created by Стас on 18.05.2023.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var square: UIView = {
        let square = UIView()
        square.frame.size = CGSize(width: 100, height: 100)
        square.center = self.view.center
        square.translatesAutoresizingMaskIntoConstraints = false
        square.backgroundColor = .systemBlue
        square.layer.cornerRadius = 10
        return square
    }()
    
    lazy var animatior = UIDynamicAnimator(referenceView: view)
    
    lazy var snapBehavior = UISnapBehavior(item: square, snapTo: square.center)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(square)
        
        let move = UITapGestureRecognizer(target: self, action: #selector(moveAction))
        view.addGestureRecognizer(move)
        snapBehavior.damping = 2
        animatior.addBehavior(snapBehavior)
    }
    
    @objc private func moveAction(_ recognizer: UITapGestureRecognizer) {
        snapBehavior.snapPoint = recognizer.location(in: view)
    }
}


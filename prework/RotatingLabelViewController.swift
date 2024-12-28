//
//  RotatingLabelViewController.swift
//  prework
//
//  Created by Joshua Akan-Etuk on 11/5/24.
//

import UIKit

class RotatingLabelViewController: UIViewController {
    
    let rotatingContainer = UIView()
    let centerImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupRotatingContainer()
        createCircularText(text: "J O S H U A  A K A N - E T U K", radius: 100)
        setupCenterImage()
        startRotationAnimation()
    }
    
    private func setupRotatingContainer() {
        rotatingContainer.frame = view.bounds
        rotatingContainer.center = view.center
        view.addSubview(rotatingContainer)
    }
    
    private func createCircularText(text: String, radius: CGFloat) {
        let characters = Array(text) // Convert text into array of characters
        let count = characters.count
        let angleIncrement = CGFloat(2 * Double.pi) / CGFloat(count) // Calculate angle between each character
        
        for (index, character) in characters.enumerated() {
            let angle = angleIncrement * CGFloat(index) // Angle for each character position
            let xPosition = rotatingContainer.center.x + radius * cos(angle) - rotatingContainer.frame.minX
            let yPosition = rotatingContainer.center.y + radius * sin(angle) - rotatingContainer.frame.minY
            
            // Create a label for each character
            let label = UILabel()
            label.textColor = UIColor.black
            label.text = String(character)
            label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
            label.sizeToFit()
            label.center = CGPoint(x: xPosition, y: yPosition)
            label.transform = CGAffineTransform(rotationAngle: angle + CGFloat.pi / 2) // Rotate label to face outward
            
            rotatingContainer.addSubview(label)
        }
    }
    
    private func setupCenterImage() {
        centerImageView.image = UIImage(named: "self") // Replace with your image name
        centerImageView.contentMode = .scaleAspectFit
        centerImageView.frame.size = CGSize(width: 155, height: 155) // Adjust size as needed
        centerImageView.center = view.center
        view.addSubview(centerImageView)
    }
    
    private func startRotationAnimation() {
        let rotation = CABasicAnimation(keyPath: "transform.rotation")
        rotation.fromValue = 0
        rotation.toValue = 2 * Double.pi
        rotation.duration = 10 // Adjust for speed
        rotation.repeatCount = .infinity
        rotatingContainer.layer.add(rotation, forKey: "circularRotation")
    }
}

//
//  ViewController.swift
//  prework
//
//  Created by Joshua Akan-Etuk on 11/3/24.
//

import UIKit


class ViewController: UIViewController {
    @IBOutlet weak var heading: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var school: UILabel!
    @IBOutlet weak var dream: UILabel!
    @IBOutlet weak var science: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func changeBackgroundColor(_ sender: UIButton) {
        // Randomly generates a UIColor.
        func changeColor() -> UIColor{

                let red = CGFloat.random(in: 0...1)
                let green = CGFloat.random(in: 0...1)
                let blue = CGFloat.random(in: 0...1)

                return UIColor(red: red, green: green, blue: blue, alpha: 0.5)
            }
        // Generates a color for text based on background.
        func textColor(for backgroundColor: UIColor) -> UIColor {
            var red: CGFloat = 0
            var green: CGFloat = 0
            var blue: CGFloat = 0
            backgroundColor.getRed(&red, green: &green, blue: &blue, alpha: nil)
            
            // Using perceived brightness formula (0.299*R + 0.587*G + 0.114*B)
            let brightness = (0.299 * red + 0.587 * green + 0.114 * blue)
            return brightness > 0.5 ? .black : .white
        }
        
        let randomColor = changeColor()
        let fontColor = textColor(for: randomColor)
        view.backgroundColor = randomColor;
        name.textColor = fontColor;
        heading.textColor = fontColor;
        dream.textColor = fontColor;
        school.textColor = fontColor;
        science.textColor = fontColor;
 
    }
    
}


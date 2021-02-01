//
//  ViewController.swift
//  GolenovichAL_HW2.2
//
//  Created by Andrei Halianovich on 30.01.21.
//

import UIKit

class ViewController: UIViewController {

    // View
    @IBOutlet var coloredView: UIView!
    
    // Labels with current value of sliders
    @IBOutlet var redColorLabel: UILabel!
    @IBOutlet var greenColorLabel: UILabel!
    @IBOutlet var blueColorLabel: UILabel!
    
    // Sliders
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coloredView.layer.cornerRadius = coloredView.frame.height / 10
        coloredView.backgroundColor = UIColor(displayP3Red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1.0)
    }
    
    @IBAction func slidersValueDidChanged(_ sender: UISlider) {
        let red = CGFloat(redSlider.value)
        let green = CGFloat(greenSlider.value)
        let blue = CGFloat(blueSlider.value)
        
        let color = UIColor(displayP3Red: red, green: green, blue: blue, alpha: 1.0)
        coloredView.backgroundColor = color
        
        redColorLabel.text = String(format: "%.02f", red)
        greenColorLabel.text = String(format: "%.02f", green)
        blueColorLabel.text = String(format: "%.02f", blue)
    }
}

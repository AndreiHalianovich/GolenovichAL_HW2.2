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
    }
    
    @IBAction func slidersValueDidChanged(_ sender: UISlider) {
        let red = redSlider.value
        let green = greenSlider.value
        let blue = blueSlider.value
        
        let color = UIColor(displayP3Red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: 1.0)
        coloredView.backgroundColor = color
        
        redColorLabel.text = String(format: "%.02f", red)
        greenColorLabel.text = String(format: "%.02f", green)
        blueColorLabel.text = String(format: "%.02f", blue)
    }
}

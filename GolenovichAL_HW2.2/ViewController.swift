//
//  ViewController.swift
//  GolenovichAL_HW2.2
//
//  Created by Andrei Halianovich on 30.01.21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var coloredView: UIView!
    
    @IBOutlet var redColorLabel: UILabel!
    @IBOutlet var greenColorLabel: UILabel!
    @IBOutlet var blueColorLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coloredView.layer.cornerRadius = coloredView.frame.height / 10
        
        setColor()
        
        redColorLabel.text = String(format: "%.02f", redSlider.value)
        greenColorLabel.text = String(format: "%.02f", greenSlider.value)
        blueColorLabel.text = String(format: "%.02f", blueSlider.value)
    }
    
    @IBAction func slidersValueDidChanged(_ sender: UISlider) {
        setColor()
        
        redColorLabel.text = String(format: "%.02f", redSlider.value)
        greenColorLabel.text = String(format: "%.02f", greenSlider.value)
        blueColorLabel.text = String(format: "%.02f", blueSlider.value)
    }
    
    private func setColor() {
        coloredView.backgroundColor = UIColor(displayP3Red: CGFloat(redSlider.value),
                                              green: CGFloat(greenSlider.value),
                                              blue: CGFloat(blueSlider.value),
                                              alpha: 1.0)
    }
}

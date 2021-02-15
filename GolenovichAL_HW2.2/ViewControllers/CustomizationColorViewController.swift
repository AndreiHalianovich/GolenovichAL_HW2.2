//
//  ViewController.swift
//  GolenovichAL_HW2.2
//
//  Created by Andrei Halianovich on 30.01.21.
//

import UIKit

class CustomizationColorViewController: UIViewController {
    
    @IBOutlet var coloredView: UIView!
    
    @IBOutlet var redColorLabel: UILabel!
    @IBOutlet var greenColorLabel: UILabel!
    @IBOutlet var blueColorLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redColorTextField: UITextField!
    @IBOutlet var greenColorTextField: UITextField!
    @IBOutlet var blueColorTextField: UITextField!
    
    var color: UIColor!
    var delegate: CustomizationColorViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coloredView.layer.cornerRadius = coloredView.frame.height / 10
        
        setValuesForSliders()
        
        redColorLabel.text = String(format: "%.02f", redSlider.value)
        greenColorLabel.text = String(format: "%.02f", greenSlider.value)
        blueColorLabel.text = String(format: "%.02f", blueSlider.value)
    }
    
    @IBAction func slidersValueDidChanged(_ sender: UISlider) {
        setColorForView()
        
        redColorLabel.text = String(format: "%.02f", redSlider.value)
        greenColorLabel.text = String(format: "%.02f", greenSlider.value)
        blueColorLabel.text = String(format: "%.02f", blueSlider.value)
    }
    
    @IBAction func doneButtonDidClick() {
        guard let color = coloredView.backgroundColor else { return }
        delegate.setNewValue(for: color)
        dismiss(animated: true)
    }
}

// MARK: - Setting color colored view and values for sliders
extension CustomizationColorViewController {
    private func setColorForView() {
        coloredView.backgroundColor = UIColor(displayP3Red: CGFloat(redSlider.value),
                                              green: CGFloat(greenSlider.value),
                                              blue: CGFloat(blueSlider.value),
                                              alpha: 1.0)
    }
    
    private func setValuesForSliders() {
        redSlider.value = Float(color.components.red)
        greenSlider.value = Float(color.components.green)
        blueSlider.value = Float(color.components.blue)
        setColorForView()
    }
}

// MARK: - UIColor to CGFloat values
extension UIColor {
    var coreImageColor: CIColor {
        return CIColor(color: self)
    }
    var components: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        let coreImageColor = self.coreImageColor
        return (coreImageColor.red, coreImageColor.green, coreImageColor.blue, coreImageColor.alpha)
    }
}






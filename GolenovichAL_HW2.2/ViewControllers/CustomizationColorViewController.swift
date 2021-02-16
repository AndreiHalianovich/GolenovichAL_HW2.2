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
    
    // MARK: - Public properties
    var color: UIColor!
    var delegate: CustomizationColorViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        coloredView.layer.cornerRadius = coloredView.frame.height / 10
        
        coloredView.backgroundColor = color
        
        setValuesForSliders()
        setValue(for: redColorLabel, greenColorLabel, blueColorLabel)
        setValue(for: redColorTextField, greenColorTextField, blueColorTextField)
        addDoneButton(to: redColorTextField, greenColorTextField, blueColorTextField)
    }
    
    @IBAction func slidersValueDidChanged(_ sender: UISlider) {
        
        switch sender.tag {
        case 0:
            setValue(for: redColorLabel)
            setValue(for: redColorTextField)
        case 1:
            setValue(for: greenColorLabel)
            setValue(for: greenColorTextField)
        case 2:
            setValue(for: blueColorLabel)
            setValue(for: blueColorTextField)
        default:
            break
        }
        setColorForView()
    }
    
    @IBAction func doneButtonDidClick() {
        delegate.setNewValue(for: coloredView.backgroundColor ?? .white)
        dismiss(animated: true)
    }
}

// MARK: - Setting color colored view and values for sliders
extension CustomizationColorViewController {
    
    private func setColorForView() {
        coloredView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                              green: CGFloat(greenSlider.value),
                                              blue: CGFloat(blueSlider.value),
                                              alpha: 1.0)
    }
    
    private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label.tag {
            case 0: redColorLabel.text = String(format: "%.02f", redSlider.value)
            case 1: greenColorLabel.text = String(format: "%.02f", greenSlider.value)
            case 2: blueColorLabel.text = String(format: "%.02f", blueSlider.value)
            default: break
            }
        }
    }
    
    private func setValue(for textFields: UITextField...) {
        textFields.forEach { textField in
            switch textField.tag {
            case 0: redColorTextField.text = String(format: "%.02f", redSlider.value)
            case 1: greenColorTextField.text = String(format: "%.02f", greenSlider.value)
            case 2: blueColorTextField.text = String(format: "%.02f", blueSlider.value)
            default: break
            }
        }
    }
    
    private func setValuesForSliders() {
        let ciColor = CIColor(color: color)
        redSlider.value = Float(ciColor.red)
        greenSlider.value = Float(ciColor.green)
        blueSlider.value = Float(ciColor.blue)
        setColorForView()
    }
    
    private func addDoneButton(to textFields: UITextField...) {
        
        textFields.forEach { textField in
            let keyboardToolBar = UIToolbar()
            textField.inputAccessoryView = keyboardToolBar
            keyboardToolBar.sizeToFit()
            
            let doneButton = UIBarButtonItem(
                title: "Done",
                style: .done,
                target: self,
                action: #selector(didTapDone)
            )
            
            let flexBarButton = UIBarButtonItem(
                barButtonSystemItem: .flexibleSpace,
                target: nil,
                action: nil
            )
            
            keyboardToolBar.items = [flexBarButton, doneButton]
        }
    }
    
    @objc private func didTapDone() {
        view.endEditing(true)
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

//MARK: - UITextFieldDelegate
extension CustomizationColorViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else { return }
        
        if let currentValue = Float(text) {
            switch textField.tag {
            case 0:
                redSlider.setValue(currentValue, animated: true)
                setValue(for: redColorLabel)
            case 1:
                greenSlider.setValue(currentValue, animated: true)
                setValue(for: greenColorLabel)
            case 2:
                blueSlider.setValue(currentValue, animated: true)
                setValue(for: blueColorLabel)
            default: break
            }
            setColorForView()
            return
        }
        showAlert(title: "Wrong format!", message: "Please, enter correct value")
    }
}






//
//  ColoredViewController.swift
//  GolenovichAL_HW2.2
//
//  Created by Andrei Halianovich on 14.02.21.
//

import UIKit

protocol CustomizationColorViewControllerDelegate {
    func setNewValue(for color: UIColor)
}

class ColoredViewController: UIViewController {
    
    override func viewDidLoad() {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let customizationColorVC = segue.destination as? CustomizationColorViewController else { return }
        customizationColorVC.color = view.backgroundColor
        customizationColorVC.delegate = self
    }
    
    
    @IBAction func setColorBarButtonDidClick(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "setColor", sender: nil)
    }
}

extension ColoredViewController: CustomizationColorViewControllerDelegate {
    func setNewValue(for color: UIColor) {
        view.backgroundColor = color
    }
}

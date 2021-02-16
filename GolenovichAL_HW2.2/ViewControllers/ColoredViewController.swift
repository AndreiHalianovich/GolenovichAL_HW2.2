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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let customizationColorVC = segue.destination as? CustomizationColorViewController else { return }
        customizationColorVC.delegate = self
        customizationColorVC.color = view.backgroundColor
    }
}

extension ColoredViewController: CustomizationColorViewControllerDelegate {
    func setNewValue(for color: UIColor) {
        view.backgroundColor = color
    }
}

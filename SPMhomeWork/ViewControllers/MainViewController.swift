//
//  ViewController.swift
//  SPMhomeWork
//
//  Created by Денис Сташков on 8.11.2023.
//

import UIKit
import SpringAnimation

final class MainViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var greenView: SpringView!
    @IBOutlet weak var descriptionTV: SpringTextView!
    @IBOutlet weak var runButtonLabel: SpringButton!
    
    // MARK: - Private properties
    private let models = Model.getModel()
    
    // MARK: - Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStartView()
    }
    
    // MARK: - IBACtions
    @IBAction private func runAnimationButton(_ sender: SpringButton) {
        setupAnimations()
        setupStartView()

    }
}
// MARK: - Extension MainVC
extension MainViewController {
    private func setupStartView() {
        greenView.layer.cornerRadius = 15
        runButtonLabel.layer.cornerRadius = 15
        descriptionTV.text = """
preset: \(models[getIndex()].animation)\n
curve: \(models[getIndex()].curve)\n
force: \(models[getIndex()].force)\n
duration: \(models[getIndex()].duration)\n
delay: 1.00\n
"""
        descriptionTV.isEditable = false
    }
    
    private func getIndex() -> Int {
        let index = Int.random(in: 0..<models.count)
        return index
    }
    
    private func setupAnimations() {
        greenView.animation = models[getIndex()].animation
        greenView.curve = models[getIndex()].curve
        greenView.force = models[getIndex()].force
        greenView.duration = models[getIndex()].duration
        greenView.animate()
    }
}

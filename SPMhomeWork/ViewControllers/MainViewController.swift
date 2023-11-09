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
        setupStartView(index: getIndex())
    }
    override func viewWillLayoutSubviews() {
        runButtonLabel.titleLabel?.text = "Run \(models[getIndex()].buttonlabel)"
    }
    // MARK: - IBACtions
    @IBAction func runAnimationButton(_ sender: SpringButton) {
            let index = getIndex()
            setupAnimations(index: index)
            setupStartView(index: index)
    }
}
// MARK: - Extension MainVC
extension MainViewController {
    private func setupStartView(index: Int) {
        greenView.layer.cornerRadius = 15
        runButtonLabel.layer.cornerRadius = 15
        descriptionTV.text = """
preset: \(models[index].animation)\n
curve: \(models[index].curve)\n
force: \(models[index].force)\n
duration: \(models[index].duration)\n
delay: 1.00\n
"""
        descriptionTV.isEditable = false
    }
    
    private func getIndex() -> Int {
        let index = Int.random(in: 0..<models.count)
        return index
    }
    
    private func setupAnimations(index: Int) {
        greenView.animation = models[index].animation
        greenView.curve = models[index].curve
        greenView.force = models[index].force
        greenView.duration = models[index].duration
        greenView.animate()

    }
}

/* меня так и не хватило времени разобраться почему title на кнопке меняется несколько раз((((,
 а когда я сдавал , то прочитал ,что нужно было поменять на название следующей анимации(((((
 еще больше расстроился и теперь сдаю как есть
*/

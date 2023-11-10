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
    private var animations = Animation.getModel()
    
    // MARK: - Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStartView(index: getIndex())
    }
    override func viewWillLayoutSubviews() {
        runButtonLabel.titleLabel?.text = "Run \(animations[getIndex()].animation)"
    }
    // MARK: - IBACtions
    @IBAction func runAnimationButton(_ sender: SpringButton) {
            let index = getIndex()
        setupStartView(index: index)
        setupAnimations(index: index)
        sender.titleLabel?.text = animations[getIndex()].animation
    }
}
// MARK: - Extension MainVC
extension MainViewController {
    private func setupStartView(index: Int) {
        greenView.layer.cornerRadius = 15
        runButtonLabel.layer.cornerRadius = 15
        descriptionTV.text = """
preset: \(animations[index].animation)\n
curve: \(animations[index].curve)\n
force: \(animations[index].force)\n
duration: \(animations[index].duration)\n
delay: \(animations[index].delay)\n
"""
        descriptionTV.isEditable = false
    }
    
    private func getIndex() -> Int {
        let index = Int.random(in: 0..<animations.count)
        return index
    }
    
    private func setupAnimations(index: Int) {
        greenView.animation = animations[index].animation
                greenView.curve = animations[index].curve
                greenView.force = animations[index].force
                greenView.duration = animations[index].duration
                greenView.animate()
                animations = Animation.getModel()
    }
}

/* меня так и не хватило времени разобраться почему title на кнопке меняется несколько раз((((,
 а когда я сдавал , то прочитал ,что нужно было поменять на название следующей анимации(((((
 еще больше расстроился и теперь сдаю как есть
*/

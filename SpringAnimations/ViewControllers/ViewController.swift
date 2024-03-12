//
//  ViewController.swift
//  SpringAnimations
//
//  Created by Tatiana Lazarenko on 3/12/24.
//

import UIKit
import SpringAnimation

final class ViewController: UIViewController {

    @IBOutlet var delayLabel: UILabel!
    @IBOutlet var durationLabel: UILabel!
    @IBOutlet var forceLabel: UILabel!
    @IBOutlet var curveLabel: UILabel!
    @IBOutlet var presetLabel: UILabel!
    
    @IBOutlet var animatedView: SpringView!
    @IBOutlet var runButton: UIButton!
    
    private var nextAnimation = Animation.getAnimation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animatedView.layer.cornerRadius = 20
        runButton.layer.cornerRadius = 10
        
        setLabelsFor(nextAnimation)
    }

    @IBAction func startSpringAnimation(_ sender: SpringButton) {
        let animation = nextAnimation
        nextAnimation = Animation.getAnimation()
        
        sender.setTitle("Run \(nextAnimation.preset)", for: .normal)
        
        setLabelsFor(animation)
        
        animatedView.animation = animation.preset
        animatedView.curve = animation.curve
        animatedView.force = animation.force
        animatedView.duration = animation.duration
        animatedView.delay = animation.delay
        
        animatedView.animate()
    }
    
    private func setLabelsFor(_ animation: Animation) {
        presetLabel.text = "preset: \(animation.preset)"
        curveLabel.text = "curve: \(animation.curve)"
        forceLabel.text = String(format: "force: %.2f", animation.force)
        durationLabel.text = String(format: "duration: %.2f", animation.duration)
        delayLabel.text = String(format: "delay: %.2f", animation.delay)
    }
    
}


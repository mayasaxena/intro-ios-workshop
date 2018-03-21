//
//  ViewController.swift
//  intro-ios-workshop
//
//  Created by Maya Saxena on 3/21/18.
//  Copyright © 2018 Maya Saxena. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let responses = [
        "It is certain",
        "It is decidedly so",
        "Without a doubt",
        "Yes definitely",
        "You may rely on it",
        "As I see it, yes",
        "Most likely",
        "Outlook good",
        "Yes",
        "Signs point to yes",
        "Reply hazy try again",
        "Ask again later",
        "Better not tell you now",
        "Cannot predict now",
        "Concentrate and ask again",
        "Don't count on it",
        "My reply is no",
        "My sources say no",
        "Outlook not so good",
        "Very doubtful"
    ]

    @IBOutlet weak var responseLabel: UILabel!
    @IBOutlet weak var ballInsideImageView: UIImageView!

    override var canBecomeFirstResponder: Bool {
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        becomeFirstResponder()
    }

    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            updateResponse()
        }
    }

    @IBAction func handleShakeButtonPressed(_ sender: Any) {
        updateResponse()
    }

    private func updateResponse() {
        let shrinkFactor: CGFloat = 0.1
        let animationTime = 0.9
        UIView.animate(
            withDuration: animationTime,
            animations: {
                self.ballInsideImageView.transform = CGAffineTransform(scaleX: shrinkFactor, y: shrinkFactor)
                self.ballInsideImageView.alpha = shrinkFactor
                self.responseLabel.transform = CGAffineTransform(scaleX: shrinkFactor, y: shrinkFactor)
                self.responseLabel.alpha = 0
            }, completion: { _ in
                let randomIndex = Int(arc4random_uniform(UInt32(self.responses.count)))
                self.responseLabel.text = self.responses[randomIndex]

                UIView.animate(withDuration: animationTime) {
                    self.ballInsideImageView.transform = .identity
                    self.ballInsideImageView.alpha = 1

                    self.responseLabel.transform = .identity
                    self.responseLabel.alpha = 1
                }
            }
        )

    }
}

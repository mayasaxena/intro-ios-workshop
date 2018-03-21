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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func handleShakeButtonPressed(_ sender: Any) {
        responseLabel.text = getRandomResponse()
    }

    private func getRandomResponse() -> String {
        let randomIndex = Int(arc4random_uniform(UInt32(responses.count)))
        return responses[randomIndex]
    }

}

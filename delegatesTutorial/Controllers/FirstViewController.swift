//
//  ViewController.swift
//  delegatesTutorial
//
//  Created by Yasmin Benatti on 2017-10-09.
//  Copyright © 2017 Yasmin Benatti. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, SecondViewControllerDelegate {

    //MARK: - IBOutlets
    @IBOutlet weak var balloonView: UIView!
    @IBOutlet weak var ballonLabel: UILabel!
    @IBOutlet weak var CTAButton: UIButton!
    
    //MARK: - Variables
    var isTryingAgain : Bool = false
    
    //MARK: - UIView Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "First"
        
        self.balloonView.layer.cornerRadius = 20
        self.initiateView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initiateView() {
        self.balloonView.backgroundColor = ColorUtils.Colors.PetroleumBlue
        self.CTAButton.backgroundColor = ColorUtils.Colors.LightPink
        self.ballonLabel.text = "Hello!"
        self.CTAButton.setTitle("SEND GREETINGS",for: .normal)
    }
    
    func changeViewToShowAnswer(answer: String) {
        self.balloonView.backgroundColor = ColorUtils.Colors.LightPink
        self.CTAButton.backgroundColor = ColorUtils.Colors.PetroleumBlue
        self.ballonLabel.text = answer
        self.CTAButton.setTitle("TRY AGAIN",for: .normal)
    }

    //MARK: - IBActions
    @IBAction func didTapCTAButton(_ sender: Any) {
        if self.isTryingAgain {
            self.isTryingAgain = false
            self.initiateView()
            
        } else {
            if let vc = self.storyboard?.instantiateViewController(withIdentifier: StoryboardUtils.StoryboardId.SecondViewController) as? SecondViewController {
                vc.delegate = self
                vc.greeting = self.ballonLabel.text
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    
    //MARK: - Second View Controller Delegate
    func showAnswer(answer: String) {
        self.isTryingAgain = true
        self.changeViewToShowAnswer(answer: answer)
    }
    
}


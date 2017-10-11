//
//  SecondViewController.swift
//  delegatesTutorial
//
//  Created by Yasmin Benatti on 2017-10-09.
//  Copyright © 2017 Yasmin Benatti. All rights reserved.
//

import UIKit

protocol SecondViewControllerDelegate {
    func showAnswer(answer: String)
}

class SecondViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var balloonView: UIView!
    @IBOutlet weak var balloonLabel: UILabel!
    @IBOutlet weak var CTAButton: UIButton!
    
    //MARK: - Variables
    var delegate : SecondViewControllerDelegate?
    var greeting : String?
    let bubbleImageView: VJChatBubbleImageView = VJChatBubbleImageView()

    //MARK: - UIView Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Second"
        
        self.balloonView.backgroundColor = UIColor.clear
        self.bubbleImageView.constraintImageOnView(view: self.balloonView)
        self.bubbleImageView.setSpecialInsetImage(name: Images.LeftTailBubble)
        self.bubbleImageView.tintColor = ColorUtils.Colors.PetroleumBlue

        if let message = self.greeting {
            self.balloonLabel.text = "Raccoon said: \(message)"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    //MARK: - IBActions
    @IBAction func didTapCTAButton(_ sender: Any) {
        self.delegate?.showAnswer(answer: "Piggy answered with kisses!")
        self.navigationController?.popViewController(animated: true)
    }
    

}

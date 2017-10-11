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
    @IBOutlet weak var answerBalloonView: UIView!
    @IBOutlet weak var answerBalloonLabel: UILabel!
    @IBOutlet weak var balloonView: UIView!
    @IBOutlet weak var ballonLabel: UILabel!
    @IBOutlet weak var CTAButton: UIButton!
    @IBOutlet weak var raccoonImageView: UIImageView!
    @IBOutlet weak var raccoonImageViewTrailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var balloonViewCenterXConstraint: NSLayoutConstraint!
    
    //MARK: - Variables
    var isTryingAgain : Bool = false
    let bubbleImageView: VJChatBubbleImageView = VJChatBubbleImageView()
    let bubbleAnswerImageView: VJChatBubbleImageView = VJChatBubbleImageView()

    //MARK: - UIView Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "First"
        
        self.balloonView.backgroundColor = UIColor.clear
        self.bubbleImageView.constraintImageOnView(view: self.balloonView)
        self.answerBalloonView.backgroundColor = UIColor.clear
        self.bubbleAnswerImageView.constraintImageOnView(view: self.answerBalloonView)
        
        if self.isInASmallScreen() {
            self.raccoonImageViewTrailingConstraint.constant = 96
            self.balloonViewCenterXConstraint.constant = 16
        } else {
            self.raccoonImageViewTrailingConstraint.constant = 72
            self.balloonViewCenterXConstraint.constant = -8
        }

        self.initiateView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Helpers
    func initiateView() {
        self.CTAButton.setTitle("SEND GREETINGS",for: .normal)
        self.CTAButton.backgroundColor = ColorUtils.Colors.LightPink
        self.ballonLabel.text = "Hello!"
        
        self.bubbleImageView.tintColor = ColorUtils.Colors.PetroleumBlue
        self.bubbleImageView.setSpecialInsetImage(name: Images.LeftTailBubble)
        
        self.raccoonImageView.isHidden = false
        self.answerBalloonView.isHidden = true
        self.balloonView.isHidden = false
    }
    
    func changeViewToShowAnswer(answer: String) {
        self.CTAButton.setTitle("TRY AGAIN",for: .normal)
        self.CTAButton.backgroundColor = ColorUtils.Colors.PetroleumBlue
        self.answerBalloonLabel.text = answer
        
        self.bubbleAnswerImageView.tintColor = ColorUtils.Colors.LightPink
        self.bubbleAnswerImageView.setSpecialInsetImage(name: Images.RightTailBubble)
        
        self.raccoonImageView.isHidden = true
        self.answerBalloonView.isHidden = false
        self.balloonView.isHidden = true
    }
    
    func isInASmallScreen() -> Bool {
        //FIXME: - Treat zoomed screen
        if UIDevice().userInterfaceIdiom == .phone {
            switch UIScreen.main.bounds.height {
            case 480:
                return true
            case 568:
                return true
            default:
                return false
            }
        }
        
        return false
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


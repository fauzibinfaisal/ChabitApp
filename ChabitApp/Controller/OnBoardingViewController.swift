//
//  OnBoardingViewController.swift
//  ChabitApp
//
//  Created by Pramahadi Tama Putra on 17/07/19.
//  Copyright © 2019 C2G10. All rights reserved.
//

import UIKit
import paper_onboarding

class OnBoardingViewController: UIViewController, PaperOnboardingDataSource, PaperOnboardingDelegate {

    @IBOutlet weak var skipButton: UIButton!
    
    @IBOutlet weak var onBoardingView: PaperOnboarding!
    
    var fontName: String = "Avenir"
    //    @IBOutlet weak var onBoardingView: PaperOnboarding!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupOnBoardingPaperView()
        skipButton.alpha = 0
        skipButton.layer.cornerRadius = 10
        skipButton.tintColor = #colorLiteral(red: 0.09019607843, green: 0.7176470588, blue: 0.831372549, alpha: 1)
        skipButton.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        onBoardingView.bringSubviewToFront(skipButton)
    }
    
    fileprivate func setupOnBoardingPaperView() {
        // Do any additional setup after loading the view.
        
        onBoardingView.dataSource = self
        onBoardingView.delegate = self
        onBoardingView.translatesAutoresizingMaskIntoConstraints = true
        
        
        //         add constraints
        for attribute: NSLayoutConstraint.Attribute in [.left, .right, .top, .bottom] {
            let constraint = NSLayoutConstraint(item: onBoardingView,
                                                attribute: attribute,
                                                relatedBy: .equal,
                                                toItem: view,
                                                attribute: attribute,
                                                multiplier: 1,
                                                constant: 0)
            view.addConstraint(constraint)
        }
    }
    
    
    func onboardingItem(at index: Int) -> OnboardingItemInfo {
        
        
        return [
            
            OnboardingItemInfo(informationImage: UIImage(named: "2r")!,
                               title: "Happier employees are more productive!",
                               description: "",
                               pageIcon: UIImage(named: "2r")!,
                               color: #colorLiteral(red: 0.1176470588, green: 0.7411764706, blue: 0.6666666667, alpha: 1),
                               titleColor: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1),
                               descriptionColor: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1),
                               titleFont: UIFont(name: fontName, size: 25)!,
                               descriptionFont: UIFont(name: fontName, size: 0)!
            ),
            
            OnboardingItemInfo(informationImage: UIImage(named: "3r")!,
                               title: "Happier employees are more productive!",
                               description: "",
                               pageIcon: UIImage(named: "3r")!,
                               color: #colorLiteral(red: 0.09019607843, green: 0.7176470588, blue: 0.831372549, alpha: 1),
                               titleColor: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1),
                               descriptionColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1),
                               titleFont: UIFont(name: fontName, size: 25)!,
                               descriptionFont: UIFont(name: fontName, size: 0)!
            ),
            
            
            ][index]
        
    }
    
    func onboardingItemsCount() -> Int {
        return 2
    }
    
    func onboardingConfigurationItem(item: OnboardingContentViewItem, index: Int) {
    }
    
    func onboardingWillTransitonToIndex(_ index: Int) {
        if index == 0 {
            UIView.animate(withDuration: 0.4) {
                self.skipButton.alpha = 0
            }
        }
    }
    
    func onboardingDidTransitonToIndex(_ index: Int) {
        if index == 1 {
            UIView.animate(withDuration: 0.4) {
                self.skipButton.alpha = 1
            }
        }
    }

}

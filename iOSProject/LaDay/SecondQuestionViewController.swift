//
//  SecondQuestionViewController.swift
//  LaDay
//
//  Created by Sungeun Park on 01/12/2018.
//  Copyright © 2018 Sungeun Park. All rights reserved.
//

import UIKit

class SecondQuestionViewController: UIViewController {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var viewTopHeight: NSLayoutConstraint!
    
    var dayPost: DayPost?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureScene()
        self.navigationController?.setNavigationItemTitleView()
        self.navigationController?.setWriteViewIcon()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textView.becomeFirstResponder()
        viewTopHeight.constant = -30
    }
    
    func configureScene() {
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor.lightGray.cgColor
        
        if let dayPost = dayPost {
            dateLabel.text = "\(dayPost.date.tracformSpecificFormat())"
            textView.text = dayPost.happy
        }
    }
    
    @IBAction func nextAction(_ sender: Any) {
        let nextVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ThirdQuestionViewController") as! ThirdQuestionViewController
        nextVC.dayPost = DayPost(date: dayPost!.date, stress: dayPost!.stress, happy: textView.text, todo: "")
        nextVC.textDate = dateLabel.text ?? " "
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @IBAction func prevAction(_ sender: Any) {
        let prevVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FirstQuestionViewController") as! FirstQuestionViewController
        prevVC.dayPost = DayPost(date: dayPost!.date, stress: dayPost!.stress, happy: "", todo: "")
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tapAction(_ sender: Any) {
        viewTopHeight.constant = 80
        textView.resignFirstResponder()
    }
}

extension SecondQuestionViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.becomeFirstResponder()
        viewTopHeight.constant = -10
    }
}

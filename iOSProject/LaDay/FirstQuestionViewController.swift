//
//  FirstQuestionViewController.swift
//  LaDay
//
//  Created by Sungeun Park on 01/12/2018.
//  Copyright © 2018 Sungeun Park. All rights reserved.
//

import UIKit

class FirstQuestionViewController: UIViewController {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    var dayPost: DayPost?
    
    var dateData: Date?
    
    @IBOutlet weak var viewTopHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureScene()
        
        self.navigationController?.setNaviTitle()
        self.navigationController?.setWriteViewIcon()
        textView.delegate = self
    }
    @IBAction func tapAction(_ sender: Any) {
        viewTopHeight.constant = 80
        textView.resignFirstResponder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textView.becomeFirstResponder()
        viewTopHeight.constant = -30
    }
    
    @IBAction func nextBtnAction(_ sender: Any) {
        if textView.text.count != 0 {
            let nextVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondQuestionViewController") as! SecondQuestionViewController
            nextVC.dayPost = DayPost(date: self.dateData!, stress: textView.text, happy: "", todo: "")
            
            self.navigationController?.pushViewController(nextVC, animated: true)
        }
    }
    
    func configureScene() {
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor.lightGray.cgColor
        
        if let dayPost = dayPost {
            dateLabel.text = "\(dayPost.dateText)"
            textView.text = dayPost.stress
        }
        
        if let dateData = dateData {
            dateLabel.text = dateData.tracformSpecificFormat()
        }
    }
    
}

extension FirstQuestionViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.becomeFirstResponder()
        viewTopHeight.constant = -10
    }
}


extension Date {
    func tracformSpecificFormat() -> String {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "YYYY. MM. dd EEE"
        return dateFormat.string(from: self)
    }
}

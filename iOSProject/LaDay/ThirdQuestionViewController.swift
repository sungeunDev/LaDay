//
//  ThirdQuestionViewController.swift
//  LaDay
//
//  Created by Sungeun Park on 01/12/2018.
//  Copyright © 2018 Sungeun Park. All rights reserved.
//

import UIKit
import RealmSwift

class ThirdQuestionViewController: UIViewController {
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    var dayPost: DayPost?
    
    var textDate: String = ""
    
    @IBOutlet weak var viewTopHeight: NSLayoutConstraint!
    
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
            dateLabel.text = textDate
            textView.text = dayPost.todo
        }
    }
    
    @IBAction func doneAction(_ sender: Any) {
        
        let post = DayPost(date: dayPost!.date, stress: dayPost!.stress, happy: dayPost!.happy, todo: textView.text)
        
        let realm = try! Realm()
        try! realm.write {
            realm.add(post)
        }
        
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func prevAction(_ sender: Any) {
        let prevVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondQuestionViewController") as! SecondQuestionViewController
        prevVC.dayPost = DayPost(date: dayPost!.date, stress: dayPost!.stress, happy: textView.text, todo: "")
        self.navigationController?.popViewController(animated: true)
    }
    

    @IBAction func tapAction(_ sender: Any) {
        viewTopHeight.constant = 80
        textView.resignFirstResponder()
    }
}

extension ThirdQuestionViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.becomeFirstResponder()
        viewTopHeight.constant = -10
    }
}

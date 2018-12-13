//
//  SeeViewController.swift
//  LaDay
//
//  Created by Sungeun Park on 01/12/2018.
//  Copyright © 2018 Sungeun Park. All rights reserved.
//

import UIKit

class SeeViewController: UIViewController {

    var posts: DayPost?
    
    @IBOutlet weak var datelabel: UILabel!
    @IBOutlet weak var stress: UILabel!
    @IBOutlet weak var happy: UILabel!
    @IBOutlet weak var todo: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        configurePost()
    }
    
    func configurePost() {
        if let posts = posts {
            datelabel.text = posts.date.tracformSpecificFormat()
            stress.text = posts.stress
            happy.text = posts.happy
            todo.text = posts.todo
        }
    }

}

//
//  ViewController.swift
//  LaDay
//
//  Created by Sungeun Park on 01/12/2018.
//  Copyright © 2018 Sungeun Park. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    var dayPostList: [DayPost] = [DayPost(date: Date(), stress: "stress", happy: "happy", todo: "todo")]
    
    var testingList: Results<DayPost>? {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        configureTableViewCell()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        testingList = fetchPost()
    }
    
    
    func configureTableViewCell() {
        tableView.register(UINib(nibName: "DayCell", bundle: nil), forCellReuseIdentifier: "DayCell")
    }
    
    @IBAction func writeBtn(_ sender: Any) {
        let nextVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FirstQuestionViewController") as! FirstQuestionViewController
        let date = Date()
        nextVC.dateData = date
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    func fetchPost() -> Results<DayPost> {
        let realm = try! Realm()
        let posts = realm.objects(DayPost.self)
        
        return posts.sorted(byKeyPath: "date", ascending: false)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testingList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DayCell") as! DayCell
        
        if let test = testingList?[indexPath.row] {
            cell.dayLabel.text = "\(test.date.tracformSpecificFormat())"
            cell.descLabel.text =
            """
            \(test.stress)
            \(test.happy)
            \(test.todo)
            """
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SeeViewController") as! SeeViewController
        nextVC.posts = testingList![indexPath.row]
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}

//
//  Day.swift
//  LaDay
//
//  Created by Sungeun Park on 01/12/2018.
//  Copyright © 2018 Sungeun Park. All rights reserved.
//

import Foundation
import RealmSwift

class DayPost: Object {
    @objc dynamic var postId = NSUUID().uuidString
    @objc dynamic var date: Date!
    @objc dynamic var dateText: Int = 0
    
    @objc dynamic var stress: String = ""
    @objc dynamic var happy: String = ""
    @objc dynamic var todo: String = ""
    
    
    override class func primaryKey() -> String? {
        return "postId"
    }
    
    convenience init(date: Date, stress: String, happy: String, todo: String) {
        self.init()
        self.date = date
        self.stress = stress
        self.happy = happy
        self.todo = todo
        
        self.dateText = date.trasformInt()
    }
}


extension Date {
    public func trasformInt() -> Int {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "yyyyMMdd"
        let str = dateFormatter.string(from: self)
        
        return Int(str)!
    }
}

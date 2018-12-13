//
//  DayCell.swift
//  LaDay
//
//  Created by Sungeun Park on 01/12/2018.
//  Copyright © 2018 Sungeun Park. All rights reserved.
//

import UIKit

class DayCell: UITableViewCell {

    @IBOutlet var dayLabel: UILabel!
    @IBOutlet var descLabel: UILabel!

    @IBOutlet var boxView: UIView!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        boxView.layer.borderWidth = 1
        boxView.layer.borderColor = UIColor.darkGray.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}

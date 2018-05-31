//
//  NotePadTableViewCell.swift
//  NotePad
//
//  Created by Nando Septian Husni on 5/28/18.
//  Copyright © 2018 imastudio. All rights reserved.
//

import UIKit

class NotePadTableViewCell: UITableViewCell {
    
    
    
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    
    @IBOutlet weak var lblDesc: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

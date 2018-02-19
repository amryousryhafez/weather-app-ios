//
//  TableViewCell.swift
//  Clima
//
//  Created by amr yousry on 2/16/18.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var labelTwo: UILabel!
    @IBOutlet weak var labelOne: UILabel!
    
    
    @IBOutlet weak var buttonUI: UIButton!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        labelOne.layer.borderWidth=1
        labelOne.layer.borderColor = UIColor.black.cgColor
        labelTwo.layer.borderWidth=1
        labelTwo.layer.borderColor=UIColor.black.cgColor
        buttonUI.layer.borderWidth=1
        buttonUI.layer.borderColor=UIColor.black.cgColor
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

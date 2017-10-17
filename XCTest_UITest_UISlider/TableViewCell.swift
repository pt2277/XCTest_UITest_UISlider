//
//  TableViewCell.swift
//  XCTest_Unit_UI
//
//  Created by Papoj Thamjaroenporn on 10/16/17.
//  Copyright © 2017 Papoj Thamjaroenporn. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var valueSlider: UISlider!
    @IBOutlet weak var button: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        valueSlider.minimumValue = 0
        valueSlider.maximumValue = 20
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    }

    func configure(with value: Float) {
        valueLabel.text = String(format: "%1.f", value)
        valueSlider.value = value
    }
    
    @IBAction func valueChanged(_ sender: UISlider) {
        configure(with: sender.value)
    }
    
    
    @IBAction func tapButton(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
    
}

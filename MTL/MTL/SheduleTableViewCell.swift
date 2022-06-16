//
//  SheduleTableViewCell.swift
//  MTL
//
//  Created by Саша  Мінаєв on 28.05.2022.
//

import UIKit

class SheduleTableViewCell: UITableViewCell {
    static let identifier = "SheduleViewCell"
    
    
    
    @IBOutlet weak var dateLabel: UILabel!
    
//    static func nib() -> UINib{
//        return UINib(nibName: "SheduleViewCell", bundle: nil)
//    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

//    public func configure(){
//        movName.text = "dff"
//        mapName.text = "fff"
//        date.text = "ff"
//    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}

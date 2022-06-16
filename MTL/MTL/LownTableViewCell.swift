//
//  LownTableViewCell.swift
//  MTL
//
//  Created by Саша  Мінаєв on 08.06.2022.
//

import UIKit

class LownTableViewCell: UITableViewCell {

    @IBOutlet weak var lownNa: UILabel!
    //    @IBOutlet weak var lownCellName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setName(name:String){
        lownNa.text = name
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

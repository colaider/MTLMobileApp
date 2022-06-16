//
//  MapTableViewCell.swift
//  MTL
//
//  Created by Саша  Мінаєв on 09.06.2022.
//

import UIKit

class MapTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setName(name:String){
        self.name.text = name
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

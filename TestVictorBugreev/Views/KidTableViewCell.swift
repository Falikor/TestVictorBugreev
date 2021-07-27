//
//  KidTableViewCell.swift
//  TestVictorBugreev
//
//  Created by 17760021 on 26.07.2021.
//

import UIKit

class KidTableViewCell: UITableViewCell {

    @IBOutlet weak var FullnameKid: UILabel!
    @IBOutlet weak var AgeKid: UILabel!
    
    var kids: Kids?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        FullnameKid.text = " "
        AgeKid.text = " "
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)


        // Configure the view for the selected state
    }

}

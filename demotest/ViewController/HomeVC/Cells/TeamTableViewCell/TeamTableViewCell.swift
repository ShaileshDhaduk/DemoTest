//
//  TeamTableViewCell.swift
//  demotest
//
//  Created by Atologist Mac 3 on 03/07/21.
//

import UIKit

class TeamTableViewCell: UITableViewCell {

    @IBOutlet weak var lblNo: UILabel!
    @IBOutlet weak var lblName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupCell(no:String, name: String) {
        lblNo.text = no
        lblName.text = name
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

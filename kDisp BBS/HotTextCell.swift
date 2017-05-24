//
//  HotTextCell.swift
//  kDisp BBS
//
//  Created by KyleCheng on 2017/5/24.
//  Copyright © 2017年 KyleCheng. All rights reserved.
//

import UIKit

class HotTextCell: UITableViewCell {

    
    @IBOutlet weak var thumbImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  AlbumTableViewCell.swift
//  21_06_2023_JSONDecoderDemo
//
//  Created by Vishal Jagtap on 04/08/23.
//

import UIKit

class AlbumTableViewCell: UITableViewCell {

    @IBOutlet weak var userIdLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}

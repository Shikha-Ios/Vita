//
//  TableViewCell.swift
//  VitaCollection
//
//  Created by Shikha Singla on 8/2/17.
//  Copyright © 2017 Shikha Singla. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var collectionVw: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

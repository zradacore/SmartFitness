//
//  CategoriesTableViewCell.swift
//  SmartFitness
//
//  Created by Владимир Никитин on 19.10.2022.
//

import UIKit

class CategoriesTableViewCell: UITableViewCell {

    static let identifier = "CategoriesTableViewCell"
    
    @IBOutlet weak var proImage: UIImageView!
    @IBOutlet weak var exImageView: UIImageView!
    @IBOutlet weak var namelabel: UILabel!
    @IBOutlet weak var exDescrLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.layer.cornerRadius = 16
        let margins = UIEdgeInsets(top: 0, left: 0, bottom: 16, right: 0)
           contentView.frame = contentView.frame.inset(by: margins)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    
    }

}

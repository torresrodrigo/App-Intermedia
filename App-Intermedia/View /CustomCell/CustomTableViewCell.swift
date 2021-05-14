//
//  customTableViewCell.swift
//  App-Intermedia
//
//  Created by Rodrigo Torres on 14/05/2021.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet var imageCell: UIImageView!
    @IBOutlet var titleCell: UILabel!
    @IBOutlet var descriptionCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func configure(with title: String, description: String, imageName: String){
        titleCell.text = title
        descriptionCell.text = description
        imageCell.image = UIImage(systemName: imageName)
    }
}

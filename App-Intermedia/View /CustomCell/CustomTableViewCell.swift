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
    
    static var identifier = "CustomTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "CustomTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    public func configureCell(title: String, description: String, imageName: String){
        titleCell.text? = title.uppercased()
        descriptionCell.text = description
        imageCell.image = UIImage(systemName: imageName)
        
    }
    
    private func setupUI() {
        containerView.layer.cornerRadius = 5
        containerView.backgroundColor = .white
        contentView.backgroundColor = #colorLiteral(red: 0.8895466059, green: 0.893653141, blue: 0.9059727462, alpha: 1)
        selectionStyle = .none
        
    }
    
}

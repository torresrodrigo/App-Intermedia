//
//  customTableViewCell.swift
//  App-Intermedia
//
//  Created by Rodrigo Torres on 14/05/2021.
//

import UIKit
import SDWebImage

class CharactersTableViewCell: UITableViewCell {

    var characterDetails : Characters! {
        didSet {
            titleCell.text = characterDetails.name
            if characterDetails.description == "" {
                descriptionCell.text = "Description not available"
            } else {
                descriptionCell.text = characterDetails.description
            }
            guard let path = characterDetails.thumbnail?.path, let ext = characterDetails.thumbnail?.fileExtension else {return}
            let url = path + "." + ext
            imageCell?.sd_setImage(with: URL(string: url))
            
        }
    }
    
    
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
    
    
    private func setupUI() {
        containerView.layer.cornerRadius = 5
        containerView.backgroundColor = .white
        contentView.backgroundColor = #colorLiteral(red: 0.8895466059, green: 0.893653141, blue: 0.9059727462, alpha: 1)
        selectionStyle = .none
        
        imageCell.contentMode = .scaleAspectFill
        imageCell.clipsToBounds = true
        
    }
    
}

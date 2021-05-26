//
//  EventsTableViewCell.swift
//  App-Intermedia
//
//  Created by Rodrigo Torres on 19/05/2021.
//

import UIKit

class EventsTableViewCell: UITableViewCell {

    var eventsDetails: Events! {
        didSet {
            titleCell.text = eventsDetails.title
            let formatter = DateFormatter.descriptionDate
            let date = eventsDetails.modified
            
            if date == nil {
                dateCell.text = "Doesn't exist date"
            } else {
                dateCell.text = formatter.string(from: date!)
            }
            
            guard let path = eventsDetails.thumbnail?.path, let ext = eventsDetails.thumbnail?.fileExtension else {
                imageCell.image = UIImage(systemName: "gear")
                return
            }
            let url = path + "." + ext
            imageCell.sd_setImage(with: URL(string: url))
        }
    }
    
    
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var titleCell: UILabel!
    @IBOutlet weak var dateCell: UILabel!
    @IBOutlet weak var imageCell: UIImageView!
    
    static var identifier = "EventsTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "EventsTableViewCell", bundle: nil)
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

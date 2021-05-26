//
//  ComicTableViewCell.swift
//  App-Intermedia
//
//  Created by Rodrigo Torres on 20/05/2021.
//

import UIKit

class ComicTableViewCell: UITableViewCell {

    

    @IBOutlet weak var comicName: UILabel!
    @IBOutlet weak var yearComic: UILabel!
    
    
    static var identifier = "ComicTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "ComicTableViewCell", bundle: nil)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
   
}


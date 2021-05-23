//
//  ComicTableViewCell.swift
//  App-Intermedia
//
//  Created by Rodrigo Torres on 20/05/2021.
//

import UIKit

class ComicTableViewCell: UITableViewCell {

    

    @IBOutlet weak var comicName: UILabel!
    
    
    static var identifier = "ComicTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "ComicTableViewCell", bundle: nil)
    }
    
    /*
    fileprivate func configureCell(nameComic : String) {
        comicName.text = nameComic
    }
    */
}


//
//  DetailEventVC.swift
//  App-Intermedia
//
//  Created by Rodrigo Torres on 25/05/2021.
//

import UIKit

class DetailEventVC: UIViewController {

    var eventDetail: Events!
    
    @IBOutlet weak var imgEvent: UIImageView!
    @IBOutlet weak var titleEvent: UILabel!
    @IBOutlet weak var dateEvent: UILabel!
    @IBOutlet weak var comicsTablesView: UITableView!
    @IBOutlet weak var heightComicsTableView: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTableView()
    }
    
    
    private func setupUI() {
        let formatter = DateFormatter.descriptionDate
        let date = formatter.string(from: eventDetail.modified!)
        titleEvent.text = eventDetail.title
        dateEvent.text = date
        
                
        guard let path = eventDetail.thumbnail?.path, let ext = eventDetail.thumbnail?.fileExtension else {return}
        let url = path + "." + ext
        imgEvent.sd_setImage(with: URL(string: url))
        imgEvent.contentMode = .scaleAspectFill
        imgEvent.layer.cornerRadius = 3
    }
    
    private func setupTableView() {
        comicsTablesView.register(ComicTableViewCell.nib(), forCellReuseIdentifier: ComicTableViewCell.identifier)
        comicsTablesView.dataSource = self
        comicsTablesView.delegate = self
        comicsTablesView.reloadData()
        comicsTablesView.separatorStyle = .singleLine
    }

}


extension DetailEventVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventDetail.comics.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = comicsTablesView.dequeueReusableCell(withIdentifier: ComicTableViewCell.identifier, for: indexPath) as! ComicTableViewCell
        let cellData = eventDetail.comics.items[indexPath.row]
        cell.comicName.text = cellData.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height : CGFloat = 51
        return height
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        return heightComicsTableView.constant = CGFloat(Double(eventDetail.comics.items.count) * 52)
    }
    
}

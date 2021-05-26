//
//  DetailVC.swift
//  App-Intermedia
//
//  Created by Rodrigo Torres on 19/05/2021.
//

import UIKit

class DetailVC: UIViewController {

    var characterDetail: Characters!
    
    @IBOutlet weak var imageDetail: UIImageView!
    @IBOutlet weak var descriptionDetail: UILabel!
    @IBOutlet weak var titleComics: UILabel!
    @IBOutlet weak var comicsTablesView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configureTableView()
    }
    
    
    private func setupUI() {
        title = characterDetail.name.uppercased()
        if characterDetail.description == "" {
            descriptionDetail.text = "Description not available"
        } else {
            descriptionDetail.text = characterDetail.description
        }
        guard let path = characterDetail.thumbnail?.path, let ext = characterDetail.thumbnail?.fileExtension else {return}
        let url = path + "." + ext
        imageDetail?.sd_setImage(with: URL(string: url))
        imageDetail?.contentMode = .scaleAspectFill
        imageDetail?.clipsToBounds = true
    }
    
    private func configureTableView() {
        comicsTablesView.register(ComicTableViewCell.nib(), forCellReuseIdentifier: ComicTableViewCell.identifier)
        comicsTablesView.dataSource = self
        comicsTablesView.delegate = self
        comicsTablesView.reloadData()
        comicsTablesView.separatorStyle = .none
    }
}

extension DetailVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characterDetail.comics?.items.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = comicsTablesView.dequeueReusableCell(withIdentifier: ComicTableViewCell.identifier, for: indexPath) as! ComicTableViewCell
        let cellData = characterDetail.comics?.items[indexPath.row]
        cell.comicName.text = cellData?.name
        return cell
    }
    
    
}

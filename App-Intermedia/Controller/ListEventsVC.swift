//
//  ListEventsVC.swift
//  App-Intermedia
//
//  Created by Rodrigo Torres on 13/05/2021.
//

import UIKit

class ListEventsVC: UIViewController {

    @IBOutlet weak var eventsTableView: UITableView!
    let characters = [Characters]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    
    private func configureTableView() {
        eventsTableView.register(CustomTableViewCell.nib(), forCellReuseIdentifier: CustomTableViewCell.identifier)
        eventsTableView.dataSource = self
        eventsTableView.delegate = self
        
        eventsTableView.separatorStyle = .none
    }

    
    
}

extension ListEventsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = eventsTableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as! CustomTableViewCell
        cell.configureCell(title: "Chau", description: "Esta es otra celda", imageName: "gear")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let heightCell : CGFloat = 150
        return heightCell
    }
    

}

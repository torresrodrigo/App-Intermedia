//
//  ListEventsVC.swift
//  App-Intermedia
//
//  Created by Rodrigo Torres on 13/05/2021.
//

import UIKit

class ListEventsVC: UIViewController {

    @IBOutlet weak var eventsTableView: UITableView!
    
    var eventsList = [Events]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        getEventsData()
    }
   
    
    
    private func configureTableView() {
        eventsTableView.register(EventsTableViewCell.nib(), forCellReuseIdentifier: EventsTableViewCell.identifier)
        eventsTableView.dataSource = self
        eventsTableView.delegate = self
        
        eventsTableView.separatorStyle = .none
    }
    
    
    func getEventsData() {
        ServiceAPI.shared.getEvents(limit: 25) { result in
            switch result {
            case .success(let result):
                print(result)
                self.eventsList = result.apiDataSource?.events ?? []
                print(self.eventsList.count)
                
                DispatchQueue.main.async {
                    self.eventsTableView.reloadData()
                }
                
            case .failure(let error):
                print(error)
                }
            }
        }
    }
    


extension ListEventsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = eventsTableView.dequeueReusableCell(withIdentifier: EventsTableViewCell.identifier, for: indexPath) as! EventsTableViewCell
        let cellData = eventsList[indexPath.row]
        cell.eventsDetails = cellData
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let heightCell : CGFloat = 150
        return heightCell
    }
    

}

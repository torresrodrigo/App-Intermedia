//
//  ListCharacterVC.swift
//  App-Intermedia
//
//  Created by Rodrigo Torres on 13/05/2021.
//

import UIKit

class ListCharacterVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var characterTableView: UITableView!
    let characters = [Characters]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        characterTableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomCell")
        characterTableView.delegate = self
        characterTableView.dataSource = self
        characterTableView.reloadData()
    }
    /*
    func registerCell() {
        characterTableView.delegate = self
        characterTableView.dataSource = self
        characterTableView.register(CustomTableViewCell.nib(), forCellReuseIdentifier: CustomTableViewCell.identifier)
    }
    */
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = characterTableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomTableViewCell
        cell.configure(with: "Hola", description: "Rodrigo", imageName: "gear")
        return cell
    }
}


//
//  ListCharacterVC.swift
//  App-Intermedia
//
//  Created by Rodrigo Torres on 13/05/2021.
//

import UIKit
import Alamofire


class ListCharacterVC: UIViewController  {

    @IBOutlet weak var characterTableView: UITableView!
    var charactersList = [Characters]()
    var pageNumbers : Int = 1
    var offSetParameters: Int = 15
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        setupNavigation()
        getCharactersData()
    }
    
    
    private func configureTableView() {
        characterTableView.register(CharactersTableViewCell.nib(), forCellReuseIdentifier: CharactersTableViewCell.identifier)
        characterTableView.dataSource = self
        characterTableView.delegate = self
        
        characterTableView.separatorStyle = .none
    }
    
    func getCharactersData() {
        DispatchQueue.global().async {
        ServiceAPI.shared.getCharacters(limit: 15,  offset: 0) { result in
            switch result {
            case .success(let result):
                self.charactersList = result.apiDataSource?.characters! ?? []
                DispatchQueue.main.async {
                    self.characterTableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
    
    
    func getMoreCharactersData() {
        ServiceAPI.shared.getCharacters(limit: 15, offset: offSetParameters) { result in
            switch result {
            case .success(let result):
                self.charactersList.append(contentsOf: result.apiDataSource?.characters ?? [] )
                DispatchQueue.main.async {
                    self.characterTableView.reloadData()
                }
                

            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func setupNavigation() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: nil, action: #selector(logOut))
        self.navigationItem.rightBarButtonItem?.tintColor = .white
    }
    
    
    @objc func logOut() {
        
    }
    
}

extension ListCharacterVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return charactersList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = characterTableView.dequeueReusableCell(withIdentifier: CharactersTableViewCell.identifier, for: indexPath) as! CharactersTableViewCell
        let cellData = charactersList[indexPath.row]
        cell.characterDetails = cellData
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height : CGFloat = 150
        return height
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let position = scrollView.contentOffset.y
        let heigth = scrollView.contentSize.height
        
        if position > heigth - scrollView.frame.size.height - 160 {
            getMoreCharactersData()
            self.pageNumbers += 1
            self.offSetParameters = 15 * self.pageNumbers
        }
    }
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dataCharacters = charactersList[indexPath.row]
        let detailCharacterVC = DetailVC(nibName: "DetailVC", bundle: nil)
        detailCharacterVC.characterDetail = dataCharacters
        self.navigationController?.pushViewController(detailCharacterVC, animated: true)
    }
}

    


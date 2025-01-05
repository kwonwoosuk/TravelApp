//
//  ShoppingTableViewController.swift
//  TravelApp
//
//  Created by 권우석 on 1/3/25.
//

import UIKit

class ShoppingTableViewController: UITableViewController {

    @IBOutlet weak var textFieldOfView: UIView!
    
    @IBOutlet weak var buyTextField: UITextField!
    
    @IBOutlet weak var addButton: UIButton!
    
    var shopping = ShoppingInfo().list
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUp()
        tableView.rowHeight = 48
        
    }
    

    
    
    func setUp() {
        textFieldOfView.backgroundColor = .lightGray
        textFieldOfView.layer.cornerRadius = 15
        textFieldOfView.clipsToBounds = true
        addButton.backgroundColor = .darkGray
        addButton.layer.cornerRadius = 8
        addButton.clipsToBounds = true
        addButton.titleLabel?.textColor = .black
        buyTextField.placeholder = "무엇을 구매하실 건가요?"
        
        
        
    }
    
    @objc func starButtonTapped(_ sender: UIButton) {
        shopping[sender.tag].star.toggle()
        tableView.reloadData()
        
    }
    @objc func checkButtonTapped(_ sender: UIButton) {
        shopping[sender.tag].check.toggle()
        tableView.reloadData()
    }
    
    @IBAction func addListButtonTapped(_ sender: UIButton) {
        guard let text = buyTextField.text else { buyTextField.text = "다시 입력하세요"
            return }
        shopping.append(Shopping(name: text))
        tableView.reloadData()
    }
        
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shopping.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingTableViewCell", for: indexPath) as! ShoppingTableViewCell
        
        let row = shopping[indexPath.row]
        
        
        
        
        let star = row.star ? "star.fill" : "star"
        cell.starButton.setImage(UIImage(systemName: star), for: .normal)
        // 버튼을 구분짓기 위해서 tag를 분류
        cell.starButton.tag = indexPath.row
        cell.starButton.addTarget(self, action: #selector(starButtonTapped), for: .touchUpInside)
        
        
        let check = row.check ? "checkmark.square.fill" : "checkmark.square"
        cell.checkButton.setImage(UIImage(systemName: check), for: .normal)
        cell.checkButton.tag = indexPath.row
        cell.checkButton.addTarget(self, action: #selector(checkButtonTapped), for: .touchUpInside)
        
        cell.shoppingLabel.text = shopping[indexPath.row].name
        cell.shoppingLabel.font = .systemFont(ofSize: 13)
        
        return cell
    }
    
    
    

}

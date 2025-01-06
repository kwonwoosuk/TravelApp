//
//  DetailTableViewController.swift
//  TravelApp
//
//  Created by 권우석 on 1/5/25.
//

import UIKit
import Kingfisher

class TravelTableViewController: UITableViewController {
    var travel = TravelInfo().travel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    @objc func likeButtonTapped(_ sender: UIButton) {
        travel[sender.tag].like?.toggle()
        tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .none)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        travel.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let row = travel[indexPath.row]
        if row.ad { //== true!!
            let cell = tableView.dequeueReusableCell(withIdentifier: adViewTableViewCell.identifier, for: indexPath) as! adViewTableViewCell
            
            let randomColor = ["viewColor1", "viewColor2"]
            
            cell.backView.backgroundColor = UIColor(named: randomColor.randomElement() ?? "viewColor1")
            cell.backView.layer.cornerRadius = 15
            cell.backView.clipsToBounds = true
            
            cell.titleLabel.text = row.title
            cell.titleLabel.numberOfLines = 0
            cell.titleLabel.textColor = .black
            cell.titleLabel.font = .boldSystemFont(ofSize: 15)
            cell.titleLabel.textAlignment = .center
            cell.adLabel.isHidden = false
            
            cell.adLabel.text = "AD"
            cell.adLabel.backgroundColor = .lightGray
            cell.adLabel.textColor = .black
            cell.adLabel.layer.cornerRadius = 5
            cell.adLabel.clipsToBounds = true
            cell.adLabel.font = .systemFont(ofSize: 12)
            return cell
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: TravelTableViewCell.identifier, for: indexPath) as! TravelTableViewCell
            configureCell(cell: cell, with: row, at: indexPath)
            
            return cell
        }
    }
    
    
    private func configureCell(cell: TravelTableViewCell, with row: Travel, at indexPath: IndexPath) {
        
        
        if let like = row.like {
            let heart = like ? "heart.fill" : "heart"
            cell.likeButton.setImage(UIImage(systemName: heart), for: .normal)
            cell.likeButton.tag = indexPath.row
            cell.likeButton.tintColor = .red
            cell.likeButton.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
        } else {
            cell.likeButton.isHidden = true
        }
        if let image = row.travel_image {
            let url = URL(string: image)
            cell.travel_image.kf.setImage(with: url)
            cell.travel_image.contentMode = .scaleAspectFill
            cell.travel_image.layer.cornerRadius = 15
            cell.travel_image.clipsToBounds = true
        }
        cell.titleLabel.text = row.title
        cell.titleLabel.numberOfLines = 0
        cell.titleLabel.textColor = .black
        cell.titleLabel.font = .boldSystemFont(ofSize: 15)
        if let text = row.description {
            cell.descriptionLabel.text = text
            cell.descriptionLabel.textColor = .gray
            cell.descriptionLabel.font = .boldSystemFont(ofSize: 13)
        }
        
        if let score = row.grade {
            cell.starLabel.textColor = .lightGray
            cell.starLabel.font = .boldSystemFont(ofSize: 13)
            switch score {
            case 1.0..<2.0:
                cell.starLabel.text = "⭐️" + "(\(String(score)))"
            case 2.0..<3.0:
                cell.starLabel.text = "⭐️⭐️" + "(\(String(score)))"
            case 3.0..<4.0:
                cell.starLabel.text = "⭐️⭐️⭐️" + "(\(String(score)))"
            case 4.0..<5.0:
                cell.starLabel.text = "⭐️⭐️⭐️⭐️" + "(\(String(score)))"
            case 5.0:
                cell.starLabel.text = "⭐️⭐️⭐️⭐️⭐️" + "(\(String(score)))"
            default:
                cell.starLabel.text = String(score)
            }
            if let num = row.save?.formatted() {
                cell.saveLabel.text = "• 저장\(num)"
                cell.saveLabel.font = .systemFont(ofSize: 13)
                cell.saveLabel.textColor = .lightGray
            }
        }
    }
       
        
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
}

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
    // like 버튼 상태변경
    @objc func likeButtonTapped(_ sender: UIButton) {
        travel[sender.tag].like?.toggle()
        let indexPath = IndexPath(row: sender.tag, section: 0)
        tableView.reloadRows(at: [indexPath], with: .none)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        travel.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TravelTableViewCell", for: indexPath) as! TravelTableViewCell
        
        // 오른쪽 위에 ad 버튼
        
        let row = travel[indexPath.row]
        cell.adLabel.isHidden = true
        cell.adLabel.text = "AD"
        cell.adLabel.backgroundColor = .lightGray
        cell.adLabel.textColor = .black
        cell.adLabel.layer.cornerRadius = 5
        cell.adLabel.clipsToBounds = true
        cell.adLabel.font = .systemFont(ofSize: 12)
        if row.ad == true {
            cell.adLabel.isHidden = false
        }
        // like 버튼 상태변경
        // Bool?
        if let like = row.like {
            let heart = like ? "heart.fill" : "heart"
            cell.likeButton.setImage(UIImage(systemName: heart), for: .normal)
            cell.likeButton.tag = indexPath.row
            cell.likeButton.tintColor = .red
            cell.likeButton.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
        } else {
            cell.likeButton.isHidden = true
        }
        
        let randomColor = ["viewColor1", "viewColor2"]
        // String?
        // 질문 : 이미지뷰없을때 title에 있는 텍스트가 아예 중앙으로 오게하고-미해결..
        //       배경색바꾸려고 uiview집어넣어서 색 바꿔줬는데 왜 안바뀌는지...-해결
        
        let image = row.travel_image
        if let image {
            let url = URL(string: image)
            cell.travel_image.kf.setImage(with: url)
            cell.travel_image.contentMode = .scaleAspectFill
            cell.travel_image.layer.cornerRadius = 15
            cell.travel_image.clipsToBounds = true
        } else {
            cell.travel_image.isHidden = true
            cell.backView.isHidden = false
            cell.backView.backgroundColor = UIColor(named: randomColor.randomElement() ?? "viewColor1")
            cell.backView.layer.cornerRadius = 15
            cell.backView.clipsToBounds = true
        }
        
        // String
        cell.titleLabel.text = row.title
        cell.titleLabel.numberOfLines = 0
        cell.titleLabel.textColor = .black
        cell.titleLabel.font = .boldSystemFont(ofSize: 15)
        
        // String?
        if let text = row.description {
            cell.descriptionLabel.text = text
            cell.descriptionLabel.textColor = .gray
            cell.descriptionLabel.font = .boldSystemFont(ofSize: 13)
        } else {
            cell.descriptionLabel.isHidden = true
            cell.titleLabel.textAlignment = .center
        }
        
        // Double?
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
        } else {
            cell.starLabel.isHidden = true
        }
        // Int?
        if let num = row.save?.formatted() {
            cell.saveLabel.text = "• 저장\(num)"
            cell.saveLabel.font = .systemFont(ofSize: 13)
            cell.saveLabel.textColor = .lightGray
        } else {
            cell.saveLabel.isHidden = true
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
}

//
//  DetailTableViewCell.swift
//  TravelApp
//
//  Created by 권우석 on 1/5/25.
//

import UIKit

class TravelTableViewCell: UITableViewCell {
    
    
    static let identifier = "TravelTableViewCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var starLabel: UILabel!
    @IBOutlet weak var saveLabel: UILabel!
    @IBOutlet weak var travel_image: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    
    @IBOutlet weak var adLabel: UILabel!
    
}
    
//        let cell = tableView.dequeueReusableCell(withIdentifier: TravelTableViewCell.identifier, for: indexPath) as! TravelTableViewCell
//        
//        let cellAd = tableView.dequeueReusableCell(withIdentifier: adViewTableViewCell.identifier, for: indexPath) as! adViewTableViewCell
//        
//        // 오른쪽 위에 ad 버튼
//        
//        let row = travel[indexPath.row]
//        cell.adLabel.text = "AD"
//        cell.adLabel.backgroundColor = .lightGray
//        cell.adLabel.textColor = .black
//        cell.adLabel.layer.cornerRadius = 5
//        cell.adLabel.clipsToBounds = true
//        cell.adLabel.font = .systemFont(ofSize: 12)
//        if  row.ad == false {
//            cell.adLabel.isHidden = true
//            // like 버튼 상태변경
            // Bool?
//            if let like = row.like {
//                let heart = like ? "heart.fill" : "heart"
//                cell.likeButton.setImage(UIImage(systemName: heart), for: .normal)
//                cell.likeButton.tag = indexPath.row
//                cell.likeButton.tintColor = .red
//                cell.likeButton.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
//            } else {
//                cell.likeButton.isHidden = true
//            }
//            let image = row.travel_image
//            if let image {
//                let url = URL(string: image)
//                cell.travel_image.kf.setImage(with: url)
//                cell.travel_image.contentMode = .scaleAspectFill
//                cell.travel_image.layer.cornerRadius = 15
//                cell.travel_image.clipsToBounds = true
//            }
//            cell.titleLabel.text = row.title
//            cell.titleLabel.numberOfLines = 0
//            cell.titleLabel.textColor = .black
//            cell.titleLabel.font = .boldSystemFont(ofSize: 15)
//            if let text = row.description {
//                cell.descriptionLabel.text = text
//                cell.descriptionLabel.textColor = .gray
//                cell.descriptionLabel.font = .boldSystemFont(ofSize: 13)
//            } else {
//                cell.descriptionLabel.isHidden = true
//                cell.titleLabel.textAlignment = .center
//            }
//            if let score = row.grade {
//                cell.starLabel.textColor = .lightGray
//                cell.starLabel.font = .boldSystemFont(ofSize: 13)
//                switch score {
//                case 1.0..<2.0:
//                    cell.starLabel.text = "⭐️" + "(\(String(score)))"
//                case 2.0..<3.0:
//                    cell.starLabel.text = "⭐️⭐️" + "(\(String(score)))"
//                case 3.0..<4.0:
//                    cell.starLabel.text = "⭐️⭐️⭐️" + "(\(String(score)))"
//                case 4.0..<5.0:
//                    cell.starLabel.text = "⭐️⭐️⭐️⭐️" + "(\(String(score)))"
//                case 5.0:
//                    cell.starLabel.text = "⭐️⭐️⭐️⭐️⭐️" + "(\(String(score)))"
//                default:
//                    cell.starLabel.text = String(score)
//                }
//            } else {
//                cell.starLabel.isHidden = true
//            }
//            // Int?
//            if let num = row.save?.formatted() {
//                cell.saveLabel.text = "• 저장\(num)"
//                cell.saveLabel.font = .systemFont(ofSize: 13)
//                cell.saveLabel.textColor = .lightGray
//            } else {
//                cell.saveLabel.isHidden = true
//            }
//        } else {
//            cell.travel_image.isHidden = true
//            cellAd.backView.isHidden = false
//            cellAd.backView.backgroundColor = UIColor(named: randomColor.randomElement() ?? "viewColor1")
//            cellAd.backView.layer.cornerRadius = 15
//            cellAd.backView.clipsToBounds = true
//            cellAd.titleLabel.text = row.title
//        }
//    
//    
//    
//    
//    
//    
//}



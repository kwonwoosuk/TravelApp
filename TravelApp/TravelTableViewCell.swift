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
    
    func configureData(row: Travel) {
        
        if let image = row.travel_image {
            let url = URL(string: image)
            travel_image.kf.setImage(with: url)
            travel_image.contentMode = .scaleAspectFill
            travel_image.layer.cornerRadius = 15
            travel_image.clipsToBounds = true
        }
        titleLabel.text = row.title
        titleLabel.numberOfLines = 0
        titleLabel.textColor = .black
        titleLabel.font = .boldSystemFont(ofSize: 15)
        if let text = row.description {
            descriptionLabel.text = text
            descriptionLabel.textColor = .gray
            descriptionLabel.font = .boldSystemFont(ofSize: 13)
        }
        
        if let score = row.grade {
            starLabel.textColor = .lightGray
            starLabel.font = .boldSystemFont(ofSize: 13)
            switch score {
            case 1.0..<2.0:
                starLabel.text = "⭐️" + "(\(String(score)))"
            case 2.0..<3.0:
                starLabel.text = "⭐️⭐️" + "(\(String(score)))"
            case 3.0..<4.0:
                starLabel.text = "⭐️⭐️⭐️" + "(\(String(score)))"
            case 4.0..<5.0:
                starLabel.text = "⭐️⭐️⭐️⭐️" + "(\(String(score)))"
            case 5.0:
                starLabel.text = "⭐️⭐️⭐️⭐️⭐️" + "(\(String(score)))"
            default:
                starLabel.text = String(score)
            }
            if let num = row.save?.formatted() {
                saveLabel.text = "• 저장\(num)"
                saveLabel.font = .systemFont(ofSize: 13)
                saveLabel.textColor = .lightGray
            }
        }
        
        
        
    }
    
}
    

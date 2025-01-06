//
//  TravelTableViewCell.swift
//  TravelApp
//
//  Created by 권우석 on 1/5/25.
//

import UIKit

class MagazineTableViewCell: UITableViewCell {

    
    static let identifier = "MagazineTableViewCell"
    
    override func prepareForReuse() {
        photo_Image.image = UIImage(systemName: "person")
    }
    
    
    
    @IBOutlet weak var photo_Image: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var subtitleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    func configureData(row: Magazine) {
        
        titleLabel.text = row.title
        subtitleLabel.text = row.subtitle
        
        titleLabel.font = .boldSystemFont(ofSize: 22)
        titleLabel.numberOfLines = 0
        subtitleLabel.font = .boldSystemFont(ofSize: 13)
        subtitleLabel.textColor = .darkGray
        
        let format = DateFormatter()
        format.dateFormat = "yyMMdd"
        
        if let date = format.date(from: row.date) {
            format.dateFormat = "yy년 MM월 dd일"
            let result = format.string(from: date)
            dateLabel.text = result
        }
        dateLabel.textColor = .darkGray
        dateLabel.font = .systemFont(ofSize: 11)
        
        
        
        
        photo_Image.contentMode = .scaleAspectFill
        photo_Image.layer.cornerRadius = 15
        photo_Image.clipsToBounds = true
        
        let image = row.photo_image
        if let image {
            let url = URL(string: image)
            photo_Image.kf.setImage(with: url)
        }
    }
    
    
    
    
    
    
    
    
    
}

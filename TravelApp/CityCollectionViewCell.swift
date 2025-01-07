//
//  CityCollectionCollectionViewCell.swift
//  TravelApp
//
//  Created by 권우석 on 1/7/25.
//

import UIKit
import Kingfisher

class CityCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CityCollectionViewCell"
    
    @IBOutlet weak var cityImageView: UIImageView!//배경
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var cityExplain: UILabel!//하단
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //이미지뷰 설정해주기
    }

    func configureData(row: City) {
        cityNameLabel.text = "\(row.city_name) | \(row.city_english_name)"
        cityNameLabel.textColor = .black
        cityNameLabel.font = .boldSystemFont(ofSize: 18)
        
        cityExplain.text = row.city_explain
        cityExplain.font = .systemFont(ofSize: 12)
        cityExplain.textColor = .gray
        cityExplain.numberOfLines = 0
                
        let image = row.city_image
        if let image {
            let url = URL(string: image)
            cityImageView.kf.setImage(with: url)
            cityImageView.contentMode = .scaleAspectFill
            cityImageView.layer.cornerRadius = cityImageView.frame.height/2
            cityImageView.layer.borderWidth = 5
            cityImageView.clipsToBounds = true
            
        }
        
        
    }
}

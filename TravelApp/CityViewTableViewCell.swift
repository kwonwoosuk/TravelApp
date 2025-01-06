//
//  CityViewTableViewCell.swift
//  TravelApp
//
//  Created by 권우석 on 1/7/25.
//

import UIKit
import Kingfisher
class CityViewTableViewCell: UITableViewCell {
    static let identifier = "CityViewTableViewCell"
    
    @IBOutlet weak var cityImageView: UIImageView!//배경
    @IBOutlet weak var cityNameLabel: UILabel!//우상단
    @IBOutlet weak var labelBackGround: UIView!
    @IBOutlet weak var cityExplain: UILabel!//하단
    
    
    override func prepareForReuse() {
        cityImageView.image = UIImage(systemName: "star")
     
    }
    // 세그먼트컨트롤을 통해 true = 국내 // false = 해외 구분해서 보여주기
   
    // 안녕하세요 세그님 처음 뵙겠습니다 :(
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//    }
    
    func configureData(row: City) {
        cityNameLabel.text = "\(row.city_name) | \(row.city_english_name)"
        cityNameLabel.textColor = .white //기본이 흰색이였나? 아니네
        cityNameLabel.font = .boldSystemFont(ofSize: 25)
        
        cityExplain.text = row.city_explain
        cityExplain.font = .systemFont(ofSize: 12)
        cityExplain.textColor = .white
        
        
        labelBackGround.backgroundColor = UIColor.black
        labelBackGround.layer.opacity = 0.5
        labelBackGround.layer.cornerRadius = 18 // 오른쪽 아래만 15🔥🔥🔥
        labelBackGround.layer.maskedCorners = CACornerMask.layerMaxXMaxYCorner
        labelBackGround.clipsToBounds = true
        
        let image = row.city_image
        if let image {
            let url = URL(string: image)
            cityImageView.kf.setImage(with: url)
            cityImageView.contentMode = .scaleAspectFill
            cityImageView.layer.cornerRadius = 18  //왼쪽위 오른쪽 아래 15씩?
            cityImageView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMinYCorner, .layerMaxXMaxYCorner)
            cityImageView.clipsToBounds = true
            
            //🔥🔥🔥🔥🔥모서리 한쪽만 조지는건 나중에... 🔥🔥🔥🔥🔥🔥
            // MARK: - 커밋시 삭제...
            //https://velog.io/@loganberry/iOS-View%EC%9D%98-%EB%AA%A8%EC%84%9C%EB%A6%AC-%EB%91%A5%EA%B8%80%EA%B2%8C-%EB%A7%8C%EB%93%A4%EA%B8%B0-feat.-cornerRadius
        }
        
        
    }


    
    
    
    
    
}

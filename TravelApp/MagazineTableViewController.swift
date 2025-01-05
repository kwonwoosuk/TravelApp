//
//  TravelTableViewController.swift
//  TravelApp
//
//  Created by 권우석 on 1/5/25.
//

import UIKit
import Kingfisher

class MagazineTableViewController: UITableViewController {

    @IBOutlet var magazineTableView: UITableView!
    
    var magazine = MagazineInfo().magazine
        
    override func viewDidLoad() {
        super.viewDidLoad()
        magazineTableView.separatorStyle = .none
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        magazine.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MagazineTableViewCell", for: indexPath) as! MagazineTableViewCell
            
        // 이미지 킹피셔로 옵셔널 처리
        let row = magazine[indexPath.row]
        let image = row.photo_image
        if let image {
            let url = URL(string: image)
            cell.photo_Image.kf.setImage(with: url)
        } else {
            cell.photo_Image.image = UIImage(systemName: "person")
        }
        // 제목,,, 자동 줄바꿈? 하고싶어요 😂
//        cell.titleLabel.lineBreakMode = .byWordWrapping // 단어 단위로 줄바꿈
//        cell.titleLabel.frame = CGRect(x: 30, y: 365, width: 200, height: 100) // 적절한 크기 지정
//        cell.titleLabel.sizeToFit()
        
        cell.photo_Image.contentMode = .scaleAspectFill
        cell.photo_Image.layer.cornerRadius = 15
        cell.photo_Image.clipsToBounds = true
        /*
         let title: String
         let subtitle: String
         var photo_image: String? kingfisher사용
         let date: String
         
         @IBOutlet weak var photo_Image: UIImageView!
         @IBOutlet weak var titleLabel: UILabel!
         @IBOutlet weak var subtitleLabel: UILabel!
         @IBOutlet weak var dateLabel: UILabel!
         */
        // 제목, 부제목
        cell.titleLabel.text = row.title
        cell.subtitleLabel.text = row.subtitle
        
        cell.titleLabel.font = .boldSystemFont(ofSize: 22)
        cell.titleLabel.numberOfLines = 0
        cell.subtitleLabel.font = .boldSystemFont(ofSize: 13)
        cell.subtitleLabel.textColor = .darkGray
        
        // 날짜 - 데이트 포멧으로 처리
        let format = DateFormatter()
        format.dateFormat = "yyMMdd"
        
        if let date = format.date(from: row.date) {
            format.dateFormat = "yy년 MM월 dd일"
            let result = format.string(from: date)
            cell.dateLabel.text = result
        }
        cell.dateLabel.textColor = .darkGray
            
        
        
        cell.dateLabel.font = .systemFont(ofSize: 11)
     
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        500
    }
    
    

}

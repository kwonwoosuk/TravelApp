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
        let cell = tableView.dequeueReusableCell(withIdentifier: MagazineTableViewCell.identifier, for: indexPath) as! MagazineTableViewCell
            
        // 이미지 킹피셔로 옵셔널 처리하기
        let row = magazine[indexPath.row]
//        cell.configureData(row: row)
//        
//        
//        else {
//            cell.photo_Image.image = UIImage(systemName: "person")
//        }
//         제목,,, 자동 줄바꿈? 하고싶어요 😂
//        cell.titleLabel.lineBreakMode = .byWordWrapping // 단어 단위로 줄바꿈
//        cell.titleLabel.frame = CGRect(x: 30, y: 365, width: 200, height: 100) // 적절한 크기 지정...안되농,,,
//        cell.titleLabel.sizeToFit()

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
  
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        500
    }
    
    

}

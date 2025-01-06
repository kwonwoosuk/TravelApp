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
        cell.configureData(row: row)
        
  
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        500
    }
    
    

}

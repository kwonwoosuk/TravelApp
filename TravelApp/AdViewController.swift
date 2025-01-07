//
//  AdViewController.swift
//  TravelApp
//
//  Created by 권우석 on 1/7/25.
//

import UIKit

class AdViewController: UIViewController {

    @IBOutlet weak var adlabel: UILabel!
    // Pass Data 1
    var content: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        adlabel.text = content
        adlabel.textAlignment = .center
        adlabel.font = .boldSystemFont(ofSize: 20)
        adlabel.numberOfLines = 0
        
        
    }
   
    @objc func leftBarButtonItemTapped() {
        dismiss(animated: true)
    }
    
}

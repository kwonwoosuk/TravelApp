//
//  GameViewController.swift
//  TravelApp
//
//  Created by 권우석 on 1/8/25.
//

import UIKit

class GameViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate, UITextViewDelegate {
    
    
    let numbers = Array(1...100) // 1부터 100까지 이렇게 넣을수 있네... 새삼
    var num = ""
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var resultTextView: UITextView!
    @IBOutlet weak var resultClapLabel: UILabel!
    let pickerView = UIPickerView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setTextView()
        
    }
    

    func setupUI() {
        
        userTextField.delegate = self
        pickerView.delegate = self
        pickerView.dataSource = self
        
        mainLabel.text = "369게임"
        mainLabel.textAlignment = .center
        mainLabel.font = .boldSystemFont(ofSize: 28)
        
        userTextField.inputView = pickerView
        userTextField.placeholder = "최대 숫자를 입력해주세여"
        
        resultClapLabel.text = ""
        resultClapLabel.textAlignment = .center
        resultClapLabel.textColor = .black
        resultClapLabel.numberOfLines = 0
        resultClapLabel.font = .boldSystemFont(ofSize: 28)
        
        
        }
    
    func setTextView() {
            // TextView 기본 설정
        resultTextView.delegate = self
        resultTextView.isEditable = false  // 편집 막기 / 아예 인터렉션을 막아도 될 것 같다
        resultTextView.text = "숫자를 선택하세요"
        resultTextView.textAlignment = .center
        resultTextView.textColor = .gray
        resultTextView.font = .systemFont(ofSize: 20)
        }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let reverseRow = numbers.count - 1 - row
        
        userTextField.text = "\(numbers[reverseRow])"
        num = "\(numbers[reverseRow])"
        return "\(numbers[reverseRow])"
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        numbers.count
    }
    
   
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let selectedRow = pickerView.selectedRow(inComponent: 0)
        let selectedNumber = numbers[selectedRow]
        
        userTextField.text = "\(selectedNumber)"
        game369(number: selectedNumber)
        textField.endEditing(true)
        return true
    }
    
    func game369(number: Int) {
        var result = ""
        var clapCount = 0
        
        for i in 1...number {
            let numberString = String(i)
            if numberString.contains("3") || numberString.contains("6") || numberString.contains("9") {
                result += "👏🏻"
                clapCount += 1
            } else {
                result += "\(i)"
            }
            
            if i != number {
                result += ", "
            }
        }
        resultTextView.text = "\(result)"
        resultClapLabel.text = " 숫자\(num)까지 총 박수는\n \(clapCount)번 입니당."
        // 33,63, 99, 등등... 이면 -> 👏🏻👏🏻 ... 나중에... 문법 복습후에 시간이 남으면,,,
        // 박수의 갯수가 늘어난 만큼 늘어난 박수 갯수 출력도,,,
        
    }


}

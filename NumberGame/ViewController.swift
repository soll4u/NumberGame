//
//  ViewController.swift
//  NumberGame
//
//  Created by Dasoll Park on 2020/08/10.
//  Copyright © 2020 soll4u. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    var randomValue: Int = 0
    var tryCount: Int = 0
//    var minimumValue: Int = 0
//    var maximumValue: Int = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var tryCountLabel: UILabel!
    @IBOutlet weak var sliderValueLabel: UILabel!
    @IBOutlet weak var minimumValueLabel: UILabel!
    @IBOutlet weak var maximumValueLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        slider.setThumbImage(#imageLiteral(resourceName: "slider_thumb"), for: .normal)
        reset()
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider){
        print(sender.value)
        // 인트타입으로 Slider의 value를 변환해서 integerValue에 넣음
        let integerValue: Int = Int(sender.value)
        // 그 값을 스트링으로 변환해서 slider label . text 에 넣음
        sliderValueLabel.text = String(integerValue)
    }
    
    func showAlert(message: String) {
        
        let alert = UIAlertController(title: nil,
                                      message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK",
                                     style: .default) { (action) in
                                        self.reset()
        }
        
        alert.addAction(okAction)
        present(alert,
                animated: true,
                completion: nil)
        
    }
    
    @IBAction func touchUpHitButton(_ sender: UIButton){
        print(slider.value)
        // 슬라이더의 소숫점 값을 Int로 떼낸다.
        let hitValue: Int = Int(slider.value)
        // 슬라이더는 float을 받아 들이기 때문에 다시 float으로 가공해서 넣어줌
        // 슬라이더는 사용자가 미세하게 움직여서 소수값까지 전달해 주기 때문
        slider.value = Float(hitValue)
        
        tryCount = tryCount + 1
//        tryCountLabel.text = String(tryCount) + " / 5"
        // 문자열 보간법 , 문자열로 치환해줌
        tryCountLabel.text = "\(tryCount) /5"
        
        if randomValue == hitValue {
//            print("You hit!")
            showAlert(message: "You hit!")
            reset()
        } else if tryCount >= 5 {
//            print("You lose..")
            showAlert(message: "YOu lose...")
            reset()
        } else if randomValue > hitValue {
            // 슬라이더의 최솟값에 hitValue를 Float 형변환해서 넣고
            slider.minimumValue = Float(hitValue)
            // 레이블 텍스트에 hitValue를 String 형변환해서 넣어줌
            minimumValueLabel.text = String(hitValue)
        } else {
            slider.maximumValue = Float(hitValue)
            maximumValueLabel.text = String(hitValue)
        }
    }
    

    @IBAction func touchUpResetButton(_ sender:UIButton){
//        print("touch up reset button")
        reset()
    }
    
    func reset(){
        print("Reset!")
        // 정수중 랜덤한 0부터 30 사이의 숫자를 randomValue에 할당
        randomValue = Int.random(in: 0...30)
        print(randomValue)
        
        // 시도 수를 0으로 만들고 레이블 텍스트에 "0 / 5" 를 스트링 형태로 넣어줌
        tryCount = 0
        tryCountLabel.text = "0 / 5"
        
        // 슬라이더의 최소값, 최댓값, 현재값을 초기화 시켜주고 레이블 텍스트에 스트링 형태로 넣어줌
        slider.minimumValue = 0
        slider.maximumValue = 30
        slider.value = 15
        minimumValueLabel.text = "0"
        maximumValueLabel.text = "30"
        sliderValueLabel.text = "15"
    }
    
}


//
//  PintuViewController.swift
//  創作有梗的 iOS App 遊戲
//
//  Created by User03 on 2019/5/9.
//  Copyright © 2019 00657123. All rights reserved.
//

import UIKit

    var gradetimestore:Double = 0.0
    var hgradetimestore:Double = 0.0

class PintuViewController: UIViewController {
    var iscomplete = false
    var number=[1,1,1,1,1,1,1,1,1,1,1,1]
    var counter = 0.0
    var timer = Timer()
    var isPlaying = false

    @IBOutlet var pintu: [UIButton]!
    @IBOutlet weak var failView: UIImageView!
    @IBOutlet weak var completeView: UIImageView!
    @IBOutlet weak var timelabel: UILabel!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    
    @objc func UpdateTimer() {
        counter = counter + 0.1
        timelabel.text = String(format: "%.1f", counter)
    }
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //亂數圖片方向
        for i in 0...11{
            pintu[i].isEnabled=false
        }
        timelabel.text = String(counter)
        for i in 0...11{
            number[i] = Int.random(in: 1...4)
        }
        for i in 0...11{
            if number[i] == 2{
                pintu[i].transform = CGAffineTransform(rotationAngle: -(CGFloat.pi/2))
            }else if number[i] == 3{
                pintu[i].transform = CGAffineTransform(rotationAngle: CGFloat.pi)
            }else{
                pintu[i].transform = CGAffineTransform(rotationAngle: -3*(CGFloat.pi/2))
            }
        }
    }
    
    @IBAction func startTimer(_ sender: Any) {
        for i in 0...11{
            self.pintu[i].isEnabled=true
        }
        if(isPlaying) {
            return
        }
        startButton.isEnabled = false
        pauseButton.isEnabled = true
        
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(UpdateTimer), userInfo: nil, repeats: true)
        isPlaying = true
    }
    
    
    @IBAction func pauseTimer(_ sender: Any) {
        for i in 0...11{
            pintu[i].isEnabled=false
        }
        startButton.isEnabled = true
        pauseButton.isEnabled = false
        
        timer.invalidate()
        isPlaying = false
    }
    
    @IBAction func resetTimer(_ sender: Any) {
        
        
        if iscomplete == false{
            let controller = UIAlertController(title: "尚未完成", message: "重置後紀錄將遺失，是否確認重置？", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "確定", style: .default) { (_) in
                self.viewDidLoad()
                
                self.startButton.isEnabled = true
                self.pauseButton.isEnabled = false
                
                self.timer.invalidate()
                self.isPlaying = false
                self.counter = 0.0
                self.timelabel.text = String(self.counter)
                
                
                self.failView.frame = CGRect(x: -15, y: 200, width: 400, height: 300)
                self.failView.alpha = 0
                self.completeView.frame = CGRect(x: -15, y: 200, width: 400, height: 300)
                self.completeView.alpha = 0
                self.iscomplete=false
            }
            controller.addAction(okAction)
            let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
            controller.addAction(cancelAction)
            present(controller, animated: true, completion: nil)
        }else{
            self.viewDidLoad()
            
            self.startButton.isEnabled = true
            self.pauseButton.isEnabled = false
            
            timer.invalidate()
            isPlaying = false
            counter = 0.0
            self.timelabel.text = String(counter)

            self.failView.frame = CGRect(x: -15, y: 200, width: 400, height: 300)
            self.failView.alpha = 0
            self.completeView.frame = CGRect(x: -15, y: 200, width: 400, height: 300)
            self.completeView.alpha = 0
            iscomplete=false
        }
        
        
        
        
        
        
        
        
       
    }
    
    
    @IBAction func complete(_ sender: Any) {
        iscomplete=true
        var count = 0
        timer.invalidate()
        for i in 0...11{
            count=count+number[i]
        }
        for i in 0...11{
            pintu[i].isEnabled=false
        }
        if count == 12{
            
            UIView.animate(withDuration: 0.25) {
                self.completeView.frame = CGRect(x: -220, y: 83, width: 800, height: 500)
                self.completeView.alpha = 1
                self.completeView.transform = CGAffineTransform(rotationAngle: CGFloat.pi/8 * 33)
            }
                gradetimestore=counter
            if gradetimestore > hgradetimestore{
                hgradetimestore=gradetimestore
            }
            
        }else{
            UIView.animate(withDuration: 0.25) {
                self.failView.frame = CGRect(x: -220, y: 83, width: 800, height: 500)
                self.failView.alpha = 1
                self.failView.transform = CGAffineTransform(rotationAngle: CGFloat.pi/8 * 33)
            }
        }
        
    }

    
   

    

    

  
    
    
    
    
    @IBAction func pintu1x1(_ sender: Any) {
        if number[0] == 1{
            pintu[0].transform = CGAffineTransform(rotationAngle: -(CGFloat.pi/2))
            number[0] = number[0] + 1
        }else if number[0] == 2{
            pintu[0].transform = CGAffineTransform(rotationAngle: CGFloat.pi)
            number[0] = number[0] + 1
        }else if number[0] == 3{
            pintu[0].transform = CGAffineTransform(rotationAngle: -3*(CGFloat.pi/2))
            number[0] = number[0] + 1
        }else{
            pintu[0].transform = CGAffineTransform(rotationAngle: 0)
            number[0] = 1
        }
    }
    
    @IBAction func pintu1x2(_ sender: Any) {
        if number[1] == 1{
            pintu[1].transform = CGAffineTransform(rotationAngle: -(CGFloat.pi/2))
            number[1] = number[1] + 1
        }else if number[1] == 2{
            pintu[1].transform = CGAffineTransform(rotationAngle: CGFloat.pi)
            number[1] = number[1] + 1
        }else if number[1] == 3{
            pintu[1].transform = CGAffineTransform(rotationAngle: -3*(CGFloat.pi/2))
            number[1] = number[1] + 1
        }else{
            pintu[1].transform = CGAffineTransform(rotationAngle: 0)
            number[1] = 1
        }
    }
    
    @IBAction func pintu1x3(_ sender: Any) {
        if number[2] == 1{
            pintu[2].transform = CGAffineTransform(rotationAngle: -(CGFloat.pi/2))
            number[2] = number[2] + 1
        }else if number[2] == 2{
            pintu[2].transform = CGAffineTransform(rotationAngle: CGFloat.pi)
            number[2] = number[2] + 1
        }else if number[2] == 3{
            pintu[2].transform = CGAffineTransform(rotationAngle: -3*(CGFloat.pi/2))
            number[2] = number[2] + 1
        }else{
            pintu[2].transform = CGAffineTransform(rotationAngle: 0)
            number[2] = 1
        }
    }
    
    @IBAction func pintu1x4(_ sender: Any) {
        if number[3] == 1{
            pintu[3].transform = CGAffineTransform(rotationAngle: -(CGFloat.pi/2))
            number[3] = number[3] + 1
        }else if number[3] == 2{
            pintu[3].transform = CGAffineTransform(rotationAngle: CGFloat.pi)
            number[3] = number[3] + 1
        }else if number[3] == 3{
            pintu[3].transform = CGAffineTransform(rotationAngle: -3*(CGFloat.pi/2))
            number[3] = number[3] + 1
        }else{
            pintu[3].transform = CGAffineTransform(rotationAngle: 0)
            number[3] = 1
        }
    }
    
    
    @IBAction func pintu2x1(_ sender: Any) {
        if number[4] == 1{
            pintu[4].transform = CGAffineTransform(rotationAngle: -(CGFloat.pi/2))
            number[4] = number[4] + 1
        }else if number[4] == 2{
            pintu[4].transform = CGAffineTransform(rotationAngle: CGFloat.pi)
            number[4] = number[4] + 1
        }else if number[4] == 3{
            pintu[4].transform = CGAffineTransform(rotationAngle: -3*(CGFloat.pi/2))
            number[4] = number[4] + 1
        }else{
            pintu[4].transform = CGAffineTransform(rotationAngle: 0)
            number[4] = 1
        }
    }
    
    @IBAction func pintu2x2(_ sender: Any) {
        if number[5] == 1{
            pintu[5].transform = CGAffineTransform(rotationAngle: -(CGFloat.pi/2))
            number[5] = number[5] + 1
        }else if number[5] == 2{
            pintu[5].transform = CGAffineTransform(rotationAngle: CGFloat.pi)
            number[5] = number[5] + 1
        }else if number[5] == 3{
            pintu[5].transform = CGAffineTransform(rotationAngle: -3*(CGFloat.pi/2))
            number[5] = number[5] + 1
        }else{
            pintu[5].transform = CGAffineTransform(rotationAngle: 0)
            number[5] = 1
        }
    }
    
    @IBAction func pintu2x3(_ sender: Any) {
        if number[6] == 1{
            pintu[6].transform = CGAffineTransform(rotationAngle: -(CGFloat.pi/2))
            number[6] = number[6] + 1
        }else if number[6] == 2{
            pintu[6].transform = CGAffineTransform(rotationAngle: CGFloat.pi)
            number[6] = number[6] + 1
        }else if number[6] == 3{
            pintu[6].transform = CGAffineTransform(rotationAngle: -3*(CGFloat.pi/2))
            number[6] = number[6] + 1
        }else{
            pintu[6].transform = CGAffineTransform(rotationAngle: 0)
            number[6] = 1
        }
    }
    
    @IBAction func pintu2x4(_ sender: Any) {
        if number[7] == 1{
            pintu[7].transform = CGAffineTransform(rotationAngle: -(CGFloat.pi/2))
            number[7] = number[7] + 1
        }else if number[7] == 2{
            pintu[7].transform = CGAffineTransform(rotationAngle: CGFloat.pi)
            number[7] = number[7] + 1
        }else if number[7] == 3{
            pintu[7].transform = CGAffineTransform(rotationAngle: -3*(CGFloat.pi/2))
            number[7] = number[7] + 1
        }else{
            pintu[7].transform = CGAffineTransform(rotationAngle: 0)
            number[7] = 1
        }
    }
    
    
    @IBAction func pintu3x1(_ sender: Any) {
        if number[8] == 1{
            pintu[8].transform = CGAffineTransform(rotationAngle: -(CGFloat.pi/2))
            number[8] = number[8] + 1
        }else if number[8] == 2{
            pintu[8].transform = CGAffineTransform(rotationAngle: CGFloat.pi)
            number[8] = number[8] + 1
        }else if number[8] == 3{
            pintu[8].transform = CGAffineTransform(rotationAngle: -3*(CGFloat.pi/2))
            number[8] = number[8] + 1
        }else{
            pintu[8].transform = CGAffineTransform(rotationAngle: 0)
            number[8] = 1
        }
    }
    
    
    @IBAction func pintu3x2(_ sender: Any) {
        if number[9] == 1{
            pintu[9].transform = CGAffineTransform(rotationAngle: -(CGFloat.pi/2))
            number[9] = number[9] + 1
        }else if number[9] == 2{
            pintu[9].transform = CGAffineTransform(rotationAngle: CGFloat.pi)
            number[9] = number[9] + 1
        }else if number[9] == 3{
            pintu[9].transform = CGAffineTransform(rotationAngle: -3*(CGFloat.pi/2))
            number[9] = number[9] + 1
        }else{
            pintu[9].transform = CGAffineTransform(rotationAngle: 0)
            number[9] = 1
        }
    }
    
    @IBAction func pintu3x3(_ sender: Any) {
        if number[10] == 1{
            pintu[10].transform = CGAffineTransform(rotationAngle: -(CGFloat.pi/2))
            number[10] = number[10] + 1
        }else if number[10] == 2{
            pintu[10].transform = CGAffineTransform(rotationAngle: CGFloat.pi)
            number[10] = number[10] + 1
        }else if number[10] == 3{
            pintu[10].transform = CGAffineTransform(rotationAngle: -3*(CGFloat.pi/2))
            number[10] = number[10] + 1
        }else{
            pintu[10].transform = CGAffineTransform(rotationAngle: 0)
            number[10] = 1
        }
    }
    
    @IBAction func pintu3x4(_ sender: Any) {
        if number[11] == 1{
            pintu[11].transform = CGAffineTransform(rotationAngle: -(CGFloat.pi/2))
            number[11] = number[11] + 1
        }else if number[11] == 2{
            pintu[11].transform = CGAffineTransform(rotationAngle: CGFloat.pi)
            number[11] = number[11] + 1
        }else if number[11] == 3{
            pintu[11].transform = CGAffineTransform(rotationAngle: -3*(CGFloat.pi/2))
            number[11] = number[11] + 1
        }else{
            pintu[11].transform = CGAffineTransform(rotationAngle: 0)
            number[11] = 1
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
}

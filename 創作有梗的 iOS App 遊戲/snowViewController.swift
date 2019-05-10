//
//  snowViewController.swift
//  創作有梗的 iOS App 遊戲
//
//  Created by User03 on 2019/5/10.
//  Copyright © 2019 00657123. All rights reserved.
//

import UIKit
import SafariServices

class snowViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let flakeEmitterCell = CAEmitterCell()
        flakeEmitterCell.contents = UIImage(named: "snowflake")?.cgImage
        flakeEmitterCell.scale = 0.015
        flakeEmitterCell.scaleRange = 0.03
        flakeEmitterCell.emissionRange = .pi
        flakeEmitterCell.lifetime = 20.0
        flakeEmitterCell.birthRate = 15
        flakeEmitterCell.velocity = -30
        flakeEmitterCell.velocityRange = -20
        flakeEmitterCell.yAcceleration = 30
        flakeEmitterCell.xAcceleration = 5
        flakeEmitterCell.spin = -0.5
        flakeEmitterCell.spinRange = 1.0
        let snowEmitterLayer = CAEmitterLayer()
        snowEmitterLayer.emitterPosition = CGPoint(x: view.bounds.width / 2.0, y: -50)
        snowEmitterLayer.emitterSize = CGSize(width: view.bounds.width, height: 0)
        snowEmitterLayer.emitterShape = CAEmitterLayerEmitterShape.line
        snowEmitterLayer.beginTime = CACurrentMediaTime()
        snowEmitterLayer.timeOffset = 10
        snowEmitterLayer.emitterCells = [flakeEmitterCell]
        view.layer.addSublayer(snowEmitterLayer)
        // Do any additional setup after loading the view.
    }
    

    @IBAction func support(_ sender: Any) {

        if let url = URL(string: "https://medium.com/@cherry880807") {
            let Controller = SFSafariViewController(url: url)
            Controller.delegate = self as? SFSafariViewControllerDelegate
            self.present(Controller, animated: true, completion: nil)
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

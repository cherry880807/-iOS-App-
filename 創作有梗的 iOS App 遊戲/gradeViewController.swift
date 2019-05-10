//
//  gradeViewController.swift
//  創作有梗的 iOS App 遊戲
//
//  Created by User03 on 2019/5/10.
//  Copyright © 2019 00657123. All rights reserved.
//

import UIKit

class gradeViewController: UIViewController {
    

    
    @IBOutlet weak var hgradetimestoreText: UILabel!
    @IBOutlet weak var gradetimestoreText: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
            gradetimestoreText.text = String(format:"%f",gradetimestore)
            hgradetimestoreText.text = String(format:"%f",hgradetimestore)
        // Do any additional setup after loading the view.
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

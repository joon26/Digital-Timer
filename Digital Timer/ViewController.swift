//
//  ViewController.swift
//  Digital Timer
//
//  Created by D7703_28 on 2018. 4. 11..
//  Copyright © 2018년 YDuChoi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var timerStrat: UISwitch!
    
    var myTimer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        myTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        timerStrat.isOn = false
        
        //클로저 Closure의 사용
//        myTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {
//            (myTimer) in
//            self.updateTime()
//
//
//        })
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func updateTime () {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss a"
        lblTime.text = formatter.string(from: date)
    }
    @IBAction func switchChanged(_ sender: Any) {
        if timerStrat.isOn == true {
            // closure 사용
            myTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {(myTimer) in
                self.updateTime()
            })
            
        } else {
            myTimer.invalidate()
            
        }
    }
    

}


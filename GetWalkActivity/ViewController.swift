//
//  ViewController.swift
//  GetWalkActivity
//
//  Created by 岡大輔 on 2018/09/30.
//  Copyright © 2018年 岡大輔. All rights reserved.
//

import UIKit

import CoreMotion

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    let pedometer:CMPedometer = CMPedometer()

    @IBAction func getStepCount(_ sender: Any) {
        
        
        
        if(!CMPedometer.isStepCountingAvailable()) {
            print("cannot get stepcount")
        }
        let from = Date(timeIntervalSinceNow: -10000)
        let to = Date()
        
        pedometer.queryPedometerData(from: from, to: to, withHandler: {(pedometerData, error) in
            print("歩数は\(pedometerData!.numberOfSteps)")
            print("距離は\(String(describing: pedometerData?.distance))") // 距離
            print("登った回数\(String(describing: pedometerData?.floorsAscended))") // 上った回数
            print("降った回数\(String(describing: pedometerData?.floorsDescended))")
            
            
            })
    }
}


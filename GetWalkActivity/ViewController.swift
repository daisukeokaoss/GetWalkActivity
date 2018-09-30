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

    @IBAction func getWalk(_ sender: Any) {
        if(!CMPedometer.isStepCountingAvailable()) {
            print("cannot get stepcount")
        }
        
        let pedometer:CMPedometer = CMPedometer()
        
        let now = Date()
        
        let oneWeekAgo = Date(timeInterval: 604800, since: now as Date)
        
        pedometer.queryPedometerData(from: oneWeekAgo, to: now, withHandler: {(pedometerData:CMPedometerData!, error:NSError!) in
            //print("\(pedometerData.numberOfSteps)") // 歩数
            //print("\(pedometerData.distance)") // 距離
            //print("\(pedometerData.floorsAscended)") // 上った回数
            //print("\(pedometerData.floorsDescended)")
            
            
            } as! CMPedometerHandler)
        

        
    

    }
    
}


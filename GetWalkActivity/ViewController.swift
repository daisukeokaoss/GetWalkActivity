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
        
        
        let pedometer:CMPedometer = CMPedometer()
        if(!CMPedometer.isStepCountingAvailable()) {
            print("cannot get stepcount")
        }
        //let now = Date()
        
        //let oneWeekAgo = Date(timeIntervalSinceNow:604800)
        
        let now:NSDate = NSDate()
        let formatter:DateFormatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let from:NSDate = self.stringToDate(date: formatter.string(from: now as Date), isStart: true)
        let to:NSDate = self.stringToDate(date: formatter.string(from: now as Date), isStart: false)
        
        pedometer.queryPedometerData(from: from as Date, to: to as Date, withHandler: {(pedometerData, error) in
            print("\(pedometerData?.numberOfSteps)") // 歩数
            //print("\(pedometerData.distance)") // 距離
            //print("\(pedometerData.floorsAscended)") // 上った回数
            //print("\(pedometerData.floorsDescended)")
            
            
            })
    }
    
    private func stringToDate(date: String, isStart: Bool) -> NSDate {
        let timestamp = (isStart) ? date + " 00:00:00" : date + " 23:59:59"
        let formatter:DateFormatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter.date(from: timestamp)! as NSDate
    }
    
}


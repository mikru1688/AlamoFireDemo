//
//  ViewController.swift
//  AlamoFireDemo
//
//  Created by Frank.Chen on 2017/3/11.
//  Copyright © 2017年 Frank.Chen. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Alamofire.request("http://data.taipei/opendata/datalist/apiAccess?scope=resourceAquire&rid=e6831708-02b4-4ef8-98fa-4b4ce53459d9").responseJSON(completionHandler: { response in
            if response.result.isSuccess {
                // convert data to dictionary array
                if let result = response.value as? [String: AnyObject] {
                    let dataList: [[String : Any]] = result["result"]?["results"] as! [[String : Any]]
                    for data in dataList {
                        print("locationName: \(data["locationName"]!)") // 所在縣市
                        print("parameterName1: \(data["parameterName1"]!)") // 天氣
                        print("startTime: \(data["startTime"]!)") // 起始時間
                        print("endTime: \(data["endTime"]!)") // 結束時間
                        print() // 結束時間
                    }
                }
            } else {
                print("error: \(response.error)")
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


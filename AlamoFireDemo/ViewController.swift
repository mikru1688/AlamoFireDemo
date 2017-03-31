//
//  ViewController.swift
//  AlamoFireDemo
//
//  Created by Frank.Chen on 2017/3/11.
//  Copyright © 2017年 Frank.Chen. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
                        
        Alamofire.request("http://data.taipei/opendata/datalist/apiAccess?scope=resourceAquire&rid=e6831708-02b4-4ef8-98fa-4b4ce53459d9").responseJSON(completionHandler: { response in
            if response.result.isSuccess {
                
                // 修改前
                // convert data to dictionary array
//                if let result = response.value as? [String: AnyObject] {
//                    let dataList: [[String : Any]]? = result["result"]?["results"] as? [[String : Any]]
//                    for data in dataList! {
//                        print("locationName: \(data["locationName"]!)") // 所在縣市
//                        print("parameterName1: \(data["parameterName1"]!)") // 天氣
//                        print("startTime: \(data["startTime"]!)") // 起始時間
//                        print("endTime: \(data["endTime"]!)") // 結束時間
//                    }
//                }
                
                // 修改後，取得結果集陣列(使用SwiftyJSON)
                let json: JSON = JSON(data: response.data!)
                if let result = json["result"]["results"].array {
                    for data in result {
                        print("locationName: \(data["locationName"])") // 所在縣市
                        print("parameterName1: \(data["parameterName1"])") // 天氣
                        print("startTime: \(data["startTime"])") // 起始時間
                        print("endTime: \(data["endTime"])") // 結束時間
                    }
                }
                
                // 修改後，取得第0筆陣列裡的所在縣市名稱(使用SwiftyJSON)
                if let locationName = json["result"]["results"][0]["locationName"].string {
                    print("locationName: \(locationName)")
                }
            } else {
                print("error: \(response.error)")
            }
        })
    }

}


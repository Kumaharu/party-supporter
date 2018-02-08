//
//  YasaiController.swift
//  party_supporter
//
//  Created by 一木貴裕 on 2018/02/05.
//  Copyright © 2018年 Univ-ryukyu. All rights reserved.
//

import UIKit

class YasaiController: UIViewController {
    let settingKey = "party_value"
    @IBOutlet weak var gram_yasai: UILabel!
    @IBOutlet weak var gram_now: UILabel!
    @IBOutlet weak var gram_now_kyb: UILabel!
    var gram_kyb : Int = 0;
    var sum_now_gram : Int = 0;
    
    override func viewDidLoad() {
        let settings = UserDefaults.standard
        
        let sum_veg = settings.object(forKey: "sum_veg")
        gram_yasai.text = ("目安野菜量:\(sum_veg!)g")
        gram_now.text = ("現在野菜量:\(sum_now_gram)g")
        gram_now_kyb.text = ("束数:\(gram_kyb) * 1/4束")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func kyb_minusButton(_ sender: AnyObject) {
        if (gram_kyb > 0){
            gram_kyb -= 1
            sum_now_gram -= 400
            gram_now_kyb.text = ("束数:\(gram_kyb) * 1/4束")
            gram_now.text = ("現在野菜量:\(sum_now_gram)g")
    
        }
    }
        
    @IBAction func kyb_plusButton(_ sender: AnyObject) {
        gram_kyb += 1
        sum_now_gram += 400
        gram_now_kyb.text = ("束数:\(gram_kyb) * 1/4束")
        gram_now.text = ("現在野菜量:\(sum_now_gram)g")
    }
    

}

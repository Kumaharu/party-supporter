//
//  YasaiController.swift
//  party_supporter
//
//  Created by 一木貴裕 on 2018/02/13.
//  Copyright © 2018年 Univ-ryukyu. All rights reserved.
//

import UIKit

class ResultController: UIViewController {
    let settingKey = "party_value"
    @IBOutlet weak var sake_gram: UILabel!
    @IBOutlet weak var niku_gram: UILabel!
    @IBOutlet weak var yasai_gram: UILabel!
    
    override func viewDidLoad() {
        let settings = UserDefaults.standard
        
        let sum = settings.object(forKey: "sum")
        let sum_veg = settings.object(forKey: "sum_veg")
        let sake = settings.object(forKey: "sake_sum")
        niku_gram.text = ("肉の目安量:\(sum!)g")
        yasai_gram.text = ("野菜目安量:\(sum_veg!)g")
        sake_gram.text = ("酒の目安量:\(sake!)g")


    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
}


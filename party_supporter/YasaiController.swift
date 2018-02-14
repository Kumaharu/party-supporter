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
    @IBOutlet weak var gram_now_ninzi: UILabel!
    @IBOutlet weak var gram_now_piman: UILabel!
    @IBOutlet weak var gram_now_tama: UILabel!
    @IBOutlet weak var gram_now_kabo: UILabel!

    var gram_kyb : Int = 0;
    var sum_now_gram : Int = 0;
    var gram_ninzi : Int = 0;
    var gram_piman : Int = 0;
    var gram_tama : Int = 0;
    var gram_kabo : Int = 0;


    override func viewDidLoad() {
        let settings = UserDefaults.standard
        
        let sum_veg = settings.object(forKey: "sum_veg")
        gram_yasai.text = ("目安:\(sum_veg!)g")
        gram_now.text = ("現在野菜量:\(sum_now_gram)g")
        gram_now_kyb.text = ("束数:\(gram_kyb) * 1/4束")
        gram_now_ninzi.text = ("個数:\(gram_ninzi)")
        gram_now_piman.text = ("個数:\(gram_piman)")
        gram_now_tama.text = ("個数:\(gram_tama)")
        gram_now_kabo.text = ("個数:\(gram_kabo)")
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
    
    
    @IBAction func ninzi_minusButton(_ sender: AnyObject) {
        if (gram_ninzi > 0){
            gram_ninzi -= 1
            sum_now_gram -= 150
            gram_now_ninzi.text = ("個数:\(gram_ninzi)")
            gram_now.text = ("現在野菜量:\(sum_now_gram)g")
            
        }
    }
    
    @IBAction func ninzi_plusButton(_ sender: AnyObject) {
        gram_ninzi += 1
        sum_now_gram += 150
        gram_now_ninzi.text = ("個数:\(gram_ninzi)")
        gram_now.text = ("現在野菜量:\(sum_now_gram)g")
    }

    @IBAction func piman_minusButton(_ sender: AnyObject) {
        if (gram_piman > 0){
            gram_piman -= 1
            sum_now_gram -= 50
            gram_now_piman.text = ("個数:\(gram_piman)")
            gram_now.text = ("現在野菜量:\(sum_now_gram)g")
            
        }
    }
    
    @IBAction func piman_plusButton(_ sender: AnyObject) {
        gram_piman += 1
        sum_now_gram += 50
        gram_now_piman.text = ("個数:\(gram_piman)")
        gram_now.text = ("現在野菜量:\(sum_now_gram)g")
    }

    @IBAction func tama_minusButton(_ sender: AnyObject) {
        if (gram_tama > 0){
            gram_tama -= 1
            sum_now_gram -= 200
            gram_now_tama.text = ("個数:\(gram_tama)")
            gram_now.text = ("現在野菜量:\(sum_now_gram)g")
            
        }
    }
    
    @IBAction func tama_plusButton(_ sender: AnyObject) {
        gram_tama += 1
        sum_now_gram += 200
        gram_now_tama.text = ("個数:\(gram_tama)")
        gram_now.text = ("現在野菜量:\(sum_now_gram)g")
    }
    
    @IBAction func kabo_minusButton(_ sender: AnyObject) {
        if (gram_kabo > 0){
            gram_kabo -= 1
            sum_now_gram -= 200
            gram_now_kabo.text = ("束数:\(gram_kabo) * 1/4個")
            gram_now.text = ("現在野菜量:\(sum_now_gram)g")
            
        }
    }
    
    @IBAction func kabo_plusButton(_ sender: AnyObject) {
        gram_kabo += 1
        sum_now_gram += 200
        gram_now_kabo.text = ("束数:\(gram_kabo) * 1/4個")
        gram_now.text = ("現在野菜量:\(sum_now_gram)g")
    }
    
}

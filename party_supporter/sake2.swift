//
//  ViewController2.swift
//  osake
//
//  Created by tomohisa Oseko on 2018/01/17.
//  Copyright © 2018年 tomohisa Oseko. All rights reserved.
//

import UIKit

class sake2: UIViewController {
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label1_2: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label2_2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label3_2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let settings = UserDefaults.standard
        let wine = settings.object(forKey: "wine")
        let cocktail = settings.object(forKey: "cocktail")
        let sake = settings.object(forKey: "sake")
        
        label1.text = "目安のワインの本数は\(wine!)本です。"
        label1_2.text = "(一人当たりの杯数 男:3.6杯 女:2.4杯)"
        label2.text = "目安のの本数は\(cocktail!)本です。"
        label2_2.text = "(一人当たりウイスキーの杯数 男:3杯 女:2杯)"
        label3.text = "目安の日本酒の本数は\(sake!)本です。"
        label3_2.text = "(一人当たりの杯数 男:3合 女:2合)"
        
        
        // Do any additional setup after loading the view.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

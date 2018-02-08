//
//  File.swift
//  Test.swift
//
//  Created by 付铭昊 on 2017/11/25.
//  Copyright © 2017年 福田　光希. All rights reserved.
//

import UIKit

class OsusumeViewController: UIViewController ,
UITableViewDataSource, UITableViewDelegate{
    @IBOutlet var table:UITableView!
    // section毎の画像配列
    let imgArray: NSArray = [
        "img0","img1",
        "img2","img3",
        "img4","img5",
        "img6","img7"]
    
    let label2Array: NSArray = [
        "2013/8/23/16:04","2013/8/23/16:15",
        "2013/8/23/16:47","2013/8/23/17:10",
        "2013/8/23/1715:","2013/8/23/17:21",
        "2013/8/23/17:33","2013/8/23/17:41"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //Table Viewのセルの数を指定
    func tableView(_ table: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return imgArray.count
    }
    
    //各セルの要素を設定する
    func tableView(_ table: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // tableCell の ID で UITableViewCell のインスタンスを生成
        let cell = table.dequeueReusableCell(withIdentifier: "osusumeCell",
                                             for: indexPath)
        
        let img = UIImage(named: imgArray[indexPath.row]　 as! String)
        
        // Tag番号 1 で UIImageView インスタンスの生成
        let imageView = cell.viewWithTag(1) as! UIImageView
        imageView.image = img
        
        // Tag番号 ２ で UILabel インスタンスの生成
        let label1 = cell.viewWithTag(2) as! UILabel
        label1.text = "No." + String(indexPath.row + 1)
        
        // Tag番号 ３ で UILabel インスタンスの生成
        let label2 = cell.viewWithTag(3) as! UILabel
        label2.text = String(describing: label2Array[indexPath.row])
        
        return cell
    }
    // Cell の高さを１２０にする
    func tableView(_ table: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 240.0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

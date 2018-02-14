//
//  OsusumeViewController.swift
//  party_supporter
//
//  Created by 付铭昊 on 2018/2/14.
//  Copyright © 2018年 Univ-ryukyu. All rights reserved.
//

import Foundation
import UIKit
class OsusumeViewController: UIViewController ,
UITableViewDataSource, UITableViewDelegate{
    
    //outlet
    @IBOutlet weak var OsusumeOutlet: UIStackView!
    
    @IBOutlet var OsusumeItemsOutlets: [UIButton]!
    
    
    
    //Action
    @IBAction func OsusumeActions(_ sender: UIButton) {
        OsusumeItemsOutlets.forEach { (button) in
            button.isHidden = !button.isHidden
        }
    }
    
    @IBAction func OsusumeitemsActions(_ sender: UIButton) {
    }
    
    
    
    @IBOutlet var table:UITableView!
    // section毎の画像配列
    let imgArray: NSArray = [
        "img0","img1",
        "img2","img3",
        "img4","img5",
        "img6","img7",
        "img8","img9"]
    
    let label2Array: NSArray = [
        "牛ロース\n胡椒を豪快に振りかけてペッパーステーキにするのがおすすめです","豚トロ\nマグロのトロのように脂身が多くて美味しい豚トロ",
        "牛カルビ\nバーベキューの食材としても人気の高い牛カルビ","鶏もも肉\n鶏もも肉には脂肪が多く、コクがあっておいしいですよね",
        "ソーセージ\n食べやすくて、美味しいソーセージ","牛ハラミ\nカルビやロースに比べて安いうえに、上質でヘルシーな味わいが楽しめます",
        "豚ロース\nこちらも牛ロースと同様、ステーキにしていただきましょう！","ハンバーグ\n焼くのには鉄板が必要ですが、大人から子供まで美味しくいただけます。",
        "豚バラ\n焼きそばの具材にするのがおすすめです！","サイコロステーキ\n一口サイズで食べやすいサイコロステーキ。切らずにそのまま串にさせるのがいいですね！"]
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
        
        let img = UIImage(named: imgArray[indexPath.row] as! String)
        
        // Tag番号 1 で UIImageView インスタンスの生成
        let imageView = cell.viewWithTag(1) as! UIImageView
        imageView.image = img
        
        // Tag番号 ２ で UILabel インスタンスの生成
        let label1 = cell.viewWithTag(2) as! UILabel
        label1.text = "No." + String(indexPath.row + 1)
        
        // Tag番号 ３ で UILabel インスタンスの生成
        let label2 = cell.viewWithTag(3) as! UILabel
        label2.numberOfLines = 5;
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

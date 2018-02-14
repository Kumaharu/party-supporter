//
//  YaOsusumeViewController.swift
//  party_supporter
//
//  Created by 付铭昊 on 2018/2/14.
//  Copyright © 2018年 Univ-ryukyu. All rights reserved.
//

import Foundation
import UIKit

class YaOsusumeViewController: UIViewController,UITableViewDataSource, UITableViewDelegate{
    @IBOutlet var table:UITableView!
    // section毎の画像配列
    let imgArray: NSArray = [
        "img10","img11",
        "img12","img13",
        "img14","img15",
        "img16","img17",
        "img18","img19"]
    
    let label2Array: NSArray = [
        "玉ねぎ\n輪っかの形に切って、串に刺すと、まさにバーベキューといった感じです！\n焼くと甘みがまして、美味しくなります","ピーマン\n切って、串にさすのもいいですが、丸焼きもおすすめです。表面が焦げてしまっても、膨らむまで焼きましょう！",
        "とうもろこし\n前もって茹でたり、電子レンジでチンしておくなどしておくと、時間が短縮できます。\nまた、半円形に切った方が焼くときに転がらないので、便利です。","ニンジン\n焼くと甘みが出て、食べやすくなります。\nお好みの形に切っていただきましょう！",
        "もやし\nもやし炒めやホイル焼きにしたり、焼きそばに混ぜたりと万能なのがもやしです","ナス\nカットするもよし、まるごと焼いて食べるのもよしです。火を通しすぎると、美味しくなくなるので焼きすぎにはご注意を！",
        "えのき\nバターと醤油といっしょにホイル焼きにすると絶品です。","カボチャ\nカボチャには程よい甘みがあって美味しいですよね！",
        "長ネギ\n輪切りにして、肉といっしょに串に刺していただきましょう！","エリンギ\nえのき同様に、ホイル焼きがおすすめです"]
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
        let cell = table.dequeueReusableCell(withIdentifier: "yasaiosusumeCell",
                                             for: indexPath)
        
        let img = UIImage(named: imgArray[indexPath.row]
            as! String)
        
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

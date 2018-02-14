////
//  ViewController.swift
//  Test.swift
//
//  Created by 福田　光希 on 2017/11/21.
//  Copyright © 2017年 福田　光希. All rights reserved.
//

import UIKit

class sake1: UIViewController {
    //設定値を扱うキーを設定(熊)
    let settingKey = "party_value"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //UserDefaultsのインスタンスを生成（by 熊)
        let settings = UserDefaults.standard
        //UserDefaultsに初期値を登録（熊）
        settings.register(defaults: [settingKey:1])
        
        Criterion.text = (" ")
        Criterion2.text = (" ")
        Caution.text = (" ")
        Caution2.text = (" ")
        
        button.isEnabled = false // ボタン無効
        button.setTitle(" ", for: .normal) // ボタンのタイトル
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
    }
    
    /*以下の@がついた，４つの変数と，メソッドは画面のLabelとbuttonを関連付けしたもの．（熊）*/
    @IBOutlet weak var numPeople: UILabel!
    @IBOutlet weak var numGirls: UILabel!
    @IBOutlet weak var numMore: UILabel!
    @IBOutlet weak var numLittle: UILabel!
    @IBOutlet weak var sumGram: UILabel!
    @IBOutlet weak var Criterion: UILabel!
    @IBOutlet weak var Criterion2: UILabel!
    @IBOutlet weak var Caution: UILabel!
    @IBOutlet weak var Caution2: UILabel!
    
    @IBOutlet weak var button: UIButton!
    
    let settings = UserDefaults.standard
    /*女性の人数の変数Girls_numberを作成 :担当　大迫*/
    var Girls_number : Int = 0;
    var More : Int = 0;
    var Little : Int = 0;
    var sum :Int = 0;
    var can :Float = 0;
    var Man_number : Int = 0;
    var wine : Float = 0;
    var cocktail : Float = 0;
    var sake : Float = 0;
    
    
    
    @IBAction func plusButton1(_ sender: AnyObject) {
        /*+ボタンが押された時Girls_numberに+1をしてラベルnumGirlsに人数を表示する　:　担当　大迫*/
        
        //記憶されている値を代入
        let partyValue = settings.integer(forKey: settingKey)
        //girlsnumberが合計人数を超えないように設定
        if(Girls_number < partyValue){
            
            Girls_number += 1;
            
        }
        
        numGirls.text = String(Girls_number)+"人"
    }
    
    @IBAction func plusButton2(_ sender: AnyObject) {
        let partyValue = settings.integer(forKey: settingKey)
        if(More < partyValue){
            More += 1
        }
        numMore.text = ("\(More)人")
    }
    
    @IBAction func plusButton3(_ sender: AnyObject) {
        //＋に関するコード（fu）
        let partyValue = settings.integer(forKey: settingKey)
        if(Little < partyValue){
            Little += 1
        }
        numLittle.text  = "\(Little)人"
    }
    
    @IBAction func minusButton1(_ sender: AnyObject) {
        /*-ボタンが押された時Girls_numberに-1をしてラベルnumGirlsに人数を表示する　:担当　大迫*/
        Girls_number -= 1;
        /*0以下にはならないようにGirls_numberが0以下になる時はGirls_numberを0にするようにif文を使用している*/
        if(Girls_number >= 0){
            numGirls.text = String(Girls_number)+"人"
        }
        else{
            Girls_number = 0;
            numGirls.text = String(Girls_number)+"人"
        }
        
    }
    
    @IBAction func minusButton2(_ sender: AnyObject) {
        if More != 0{
            More -= 1
        }
        numMore.text = ("\(More)人")
    }
    
    @IBAction func minusButton3(_ sender: AnyObject) {
        //- に関するコード（fu）
        Little -= 1
        if(Little < 0){
            Little = 0
        }
        numLittle.text = "\(Little)人"
    }
    
    
    @IBAction func decision1(_ sender: AnyObject) {
        //UserDefaultsを生成（熊）
        let settings = UserDefaults.standard
        //記憶されている値を代入
        let partyValue = settings.integer(forKey: settingKey)
        sum = (partyValue * 60)-(Little * 20)+(More * 20)-(Girls_number * 20)
        settings.set(sum, forKey: "todos")
        settings.synchronize()
        can = Float(sum) / 20
        
        wine = (Float(sum)*9)/750
        //一本750ml
        settings.set(wine, forKey: "wine")
        settings.synchronize()
        
        cocktail = (Float(sum)*3)/750
        settings.set(cocktail, forKey: "cocktail")
        settings.synchronize()
        
        sake = (Float(sum)*9)/1800
        settings.set(sake, forKey: "sake")
        settings.synchronize()
        
        settings.set(sum, forKey: "sake_sum")
        settings.synchronize()

        
        Man_number = partyValue - Girls_number
        //can = (Man_number * 3)+(Girls_number * 2)
        sumGram.text = ("目安のアルコール量は\(sum)g")
        Criterion.text = ("目安の缶ビールの本数は\(can)缶です。")
        Criterion2.text = ("(一人当たりの本数 男:3缶 女:2缶)")
        Caution.text = ("※あくまで目安の分量です。")
        Caution2.text = ("過度のアルコール摂取は危険なので本人に適した分量の摂取を心がけてください。")
        button.isEnabled = true // ボタン有効
        button.setTitle("詳細", for: .normal) // ボタンのタイトル
    }
    
    
    /**
     「クリア」ボタン
     押すと、全ての値が初期化される。
     担当：松本  */
    @IBAction func clearMeat(_ sender: Any) {
        Girls_number = 0
        More = 0
        Little = 0
        sum = 0
        numGirls.text = "\(Girls_number)人"
        numMore.text = "\(More)人"
        numLittle.text = "\(Little)人"
        sumGram.text = "\(sum)g"
        Criterion.text = ("")
        Criterion2.text = ("")
        Caution.text = ("")
        Caution2.text = ("")
        button.setTitle(" ", for: .normal) // ボタンのタイトル
        
        /* // 合計人数はどうする？
         let settings = UserDefaults.standard
         settings.setValue(0, forKey:settingKey)
         settings.synchronize()
         numPeople.text = "合計人数　0人"
         */
    }
    /*
     //合計人数設定画面に遷移（熊）
     @IBAction func sumofpeopleButtonAction(_ sender: AnyObject) {
     performSegue(withIdentifier:"goSumofpeople", sender: nil)
     }
     
     override func viewDidAppear(_ animated:Bool){
     //UserDefaultsを生成（熊）
     //記憶されている値を代入
     let partyValue = settings.integer(forKey: settingKey)
     numPeople.text = "合計人数 \(partyValue)人"
     }*/
    override func viewDidAppear(_ animated:Bool){
        //UserDefaultsを生成（熊）
        //記憶されている値を代入
        let partyValue = settings.integer(forKey: settingKey)
        numPeople.text = "合計人数 \(partyValue)人"
        settings.set(sake, forKey: "sake")
        settings.synchronize()
    }
}

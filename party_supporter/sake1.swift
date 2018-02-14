////
//  ViewController.swift
//  Test.swift
//
//  Created by 福田　光希 on 2017/11/21.
//  Copyright © 2017年 福田　光希. All rights reserved.
//

import UIKit

class sake1: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate,UITextFieldDelegate  {
    //設定値を扱うキーを設定(熊)
    let settingKey = "party_value"
  
  //picker
  let pickerView = UIPickerView()
  var editingTextField: UITextField!
  
  var pickOption : [Int] = [1,2,3,4,5,6,7,8,9,10]
  
  var pickOption2 : [Int] = [1,2,3,4,5,6,7,8,9,10]
  
  var pickOption3 : [Int] = [1,2,3,4,5,6,7,8,9,10]
  
  //picker
  @IBOutlet weak var pickerTextField4: UITextField!
  
  @IBOutlet weak var pickerTextField5: UITextField!
  
  @IBOutlet weak var PickerTextField6: UITextField!
  
  
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
        
      
      
      
      //pickerの始まり
      pickerView.delegate = self
      
      let toolBar = UIToolbar()
      toolBar.barStyle = UIBarStyle.default
      toolBar.isTranslucent = true
      toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
      toolBar.sizeToFit()
      
      let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.done, target: self, action: #selector(ViewController.donePressed))
      let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
      let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.plain, target: self, action: #selector(ViewController.canclePressed))
      
      toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
      toolBar.isUserInteractionEnabled = true
      
      
      pickerTextField4.delegate = self
      pickerTextField4.inputView = pickerView
      pickerTextField4.inputAccessoryView = toolBar
      
      pickerTextField5.delegate = self
      pickerTextField5.inputView = pickerView
      pickerTextField5.inputAccessoryView = toolBar
      
      PickerTextField6.delegate = self
      PickerTextField6.inputView = pickerView
      PickerTextField6.inputAccessoryView = toolBar
      
      
      pickerTextField4.text = "女性　０人"
      pickerTextField5.text = "がっつり　０人"
      PickerTextField6.text = "控えめ　０人"
      //pickerのここまで
      
      
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
  
  
  
  //いしたつ
  func textFieldDidBeginEditing(_ textField: UITextField) {
    editingTextField = textField
    pickerView.reloadAllComponents()
  }
  
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    if editingTextField == pickerTextField4 {
      return pickOption.count
    } else if editingTextField == pickerTextField5 {
      return pickOption2.count
    }else if editingTextField == PickerTextField6{
      return pickOption3.count
    }
    else {
      return 0
    }
  }
  
  //pickerviewの中身を表示する
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    if editingTextField == pickerTextField4{
      return "\(pickOption[row])人"
    }else if editingTextField == pickerTextField5 {
      return "\(pickOption2[row])人"
    }else if editingTextField == PickerTextField6{
      return "\(pickOption3[row])人"
    }
    else{
      return nil
    }
  }
  

  
  
  //中の値を入れる
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    if editingTextField == pickerTextField4 {
      Girls_number = pickOption[row]
      return pickerTextField4.text = String(pickOption[row])+"人"
    } else if editingTextField == pickerTextField5 {
      More = pickOption2[row]
      return pickerTextField5.text = String(pickOption2[row])+"人"
    } else if editingTextField == PickerTextField6{
      Little = pickOption3[row]
      return PickerTextField6.text = String(pickOption3[row])+"人"
    }
  }
  
  
  
  
  
  @objc func donePressed(sender: UIBarButtonItem) {
    self.view.endEditing(true)
  }
  
  @objc func canclePressed(sender: UIBarButtonItem) {
    if editingTextField == pickerTextField4 {
      pickerTextField4.text = ""
    } else if editingTextField == pickerTextField5 {
      pickerTextField5.text = ""
    }
    self.view.endEditing(true)
  }
  
  func textFieldShouldReturn(_ Text: UITextField) -> Bool {
    Text.resignFirstResponder()
    return true
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.view.endEditing(true)
  }
}


////
//  ViewController.swift
//  Test.swift
//
//  Created by 福田　光希 on 2017/11/21.
//  Copyright © 2017年 福田　光希. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UIPickerViewDataSource,UIPickerViewDelegate,UITextFieldDelegate {

    //いしたつのを参考にしたプログラム picker

  let pickerView = UIPickerView()
  var editingTextField: UITextField!

  var pickOption : [Int] = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]

  var pickOption2 : [Int] = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]

  var pickOption3 : [Int] = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]

  @IBOutlet weak var pickerTextField: UITextField!
  @IBOutlet weak var pickerTextField2: UITextField!
  @IBOutlet weak var pickerTextField3: UITextField!

  //設定値を扱うキーを設定(熊)
    let settingKey = "party_value"
    override func viewDidLoad() {
        super.viewDidLoad()
      //UserDefaultsのインスタンスを生成（by 熊)
      let settings = UserDefaults.standard
      //UserDefaultsに初期値を登録（熊）
      settings.register(defaults: [settingKey:1])
      
      



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


      pickerTextField.delegate = self
      pickerTextField.inputView = pickerView
      pickerTextField.inputAccessoryView = toolBar

      pickerTextField2.delegate = self
      pickerTextField2.inputView = pickerView
      pickerTextField2.inputAccessoryView = toolBar

      pickerTextField3.delegate = self
      pickerTextField3.inputView = pickerView
      pickerTextField3.inputAccessoryView = toolBar





      pickerTextField.text = "女性　０人"
      pickerTextField2.text = "がっつり　０人"
      pickerTextField3.text = "控えめ　０人"
      //pickerのここまで





    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
      
    }


    /*以下の@がついた，４つの変数と，メソッドは画面のLabelとbuttonを関連付けしたもの．（熊）*/


    @IBOutlet weak var numPeople: UILabel!
    
    @IBOutlet weak var numGirls: UILabel!
    
    @IBOutlet weak var numHungry: UILabel!
    
    @IBOutlet weak var numNotHungry: UILabel!

    @IBOutlet weak var sumGram: UILabel!

    @IBOutlet weak var sumVeg: UILabel!

    let settings = UserDefaults.standard
    /*女性の人数の変数Girls_numberを作成 :担当　大迫*/
    var Girls_number : Int = 0;
    var Hungry : Int = 0;
    /*控えめの変数*/
    var hikaeme = 0
    var sum :Int = 0
    var sum_veg :Int = 0







    @IBAction func decision1(_ sender: AnyObject) {
        //UserDefaultsを生成（熊）
        let settings = UserDefaults.standard
        //記憶されている値を代入
        let partyValue = settings.integer(forKey: settingKey)
        sum = (partyValue * 300)-(hikaeme * 50)+(Hungry * 100)-(Girls_number * 100)
        sum_veg = sum / 2
        settings.set(sum_veg, forKey: "sum_veg")
        settings.set(sum, forKey: "sum")
        settings.synchronize()
        sumGram.text = ("\(sum)g")
        sumVeg.text = ("野菜の量:\(sum_veg)g")
    }

    
    /**
     「クリア」ボタン
        押すと、全ての値が初期化される。
                        担当：松本  */
    @IBAction func clearMeat(_ sender: Any) {
        Girls_number = 0
        Hungry = 0
        hikaeme = 0
        sum = 0
      pickerTextField.text = "女性　\(Girls_number)人"
      pickerTextField2.text = "がっつり　\(Hungry)人"
      pickerTextField3.text = "控えめ　\(hikaeme)人"
        sumGram.text = "\(sum)g"
        
       /* // 合計人数はどうする？
        let settings = UserDefaults.standard
        settings.setValue(0, forKey:settingKey)
        settings.synchronize()
        numPeople.text = "合計人数　0人"
*/
    }
    
    //合計人数設定画面に遷移（熊）
    @IBAction func sumofpeopleButtonAction(_ sender: AnyObject) {
        performSegue(withIdentifier:"goSumofpeople", sender: nil)
    }

    override func viewDidAppear(_ animated:Bool){
        //UserDefaultsを生成（熊）
        //記憶されている値を代入
        let partyValue = settings.integer(forKey: settingKey)
        numPeople.text = "合計人数 \(partyValue)人"
        settings.set(sum_veg, forKey: "sum_veg")
        settings.set(sum, forKey: "sum")
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
    if editingTextField == pickerTextField {
      return pickOption.count
    } else if editingTextField == pickerTextField2 {
      return pickOption2.count
    }else if editingTextField == pickerTextField3{
      return pickOption3.count
    }
    else {
      return 0
    }
  }

  //pickerviewの中身を表示する
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    if editingTextField == pickerTextField{
      return "\(pickOption[row])人"
    }else if editingTextField == pickerTextField2 {
      return "\(pickOption2[row])人"
    }else if editingTextField == pickerTextField3{
      return "\(pickOption3[row])人"
    }
    else{
      return nil
    }
  }
  /*
  private func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> Int? {
    if editingTextField == pickerTextField {
      return pickOption[row]
    } else if editingTextField == pickerTextField2 {
      return pickOption2[row]
    }else{
      return nil
    }
  }

  */


  //中の値を入れる
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    if editingTextField == pickerTextField {
      Girls_number = pickOption[row]
      return pickerTextField.text = "女性 "+String(pickOption[row])+"人"
    } else if editingTextField == pickerTextField2 {
      Hungry = pickOption2[row]
      return pickerTextField2.text = "がっつり "+String(pickOption2[row])+"人"
    } else if editingTextField == pickerTextField3{
      hikaeme = pickOption3[row]
      return pickerTextField3.text = "控えめ " + String(pickOption3[row]) + "人"
    }
  }





  @objc func donePressed(sender: UIBarButtonItem) {
    self.view.endEditing(true)
  }

  @objc func canclePressed(sender: UIBarButtonItem) {
    if editingTextField == pickerTextField {
      pickerTextField.text = ""
    } else if editingTextField == pickerTextField2 {
      pickerTextField2.text = ""
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

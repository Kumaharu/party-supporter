
//
//  sumofpeopleViewController.swift
//  party_supporter
//
//  Created by 熊埜御堂元晴 on 2017/11/30.
//  Copyright © 2017年 Univ-ryukyu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{
  //UIPickerViewに表示するデータをArrayで作成（熊）
  let sumofpeopleArray : [Int] = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
  //設定値を覚えるキーを設定（熊）
  let settingKey = "party_value"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    //timerSettingPickerのデリゲートデータソースの通知先を指定（熊）
    partyPicker.delegate = self
    partyPicker.dataSource = self
    
    //UserDefaultsの取得（熊）
    let settings = UserDefaults.standard
    let partyValue = settings.integer(forKey: settingKey)
    
    //Pickerの選択を合わせる（初期状態）（熊）
    for row in 0..<sumofpeopleArray.count{
      if sumofpeopleArray[row] == partyValue{
        partyPicker.selectRow(row, inComponent: 0, animated: true)
      }
    }
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  //数字表示パーツ（pickerView）（熊）
  
  @IBOutlet weak var partyPicker: UIPickerView!
  //決定ボタンが押されると前の画面に戻る（熊）
  @IBAction func decisionButtonAction(_ sender: AnyObject) {
    _ = navigationController?.popViewController(animated: true)
  }
  
  
  //UIPickerViewの列数を選択（熊）
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }
  //UIPickerViewの行数を選択（熊）
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return sumofpeopleArray.count
  }
  
  //UIPickerViewの表示をする内容を設定（熊）
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return String(sumofpeopleArray[row])
  }
  //picker選択時に実行（熊）
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    let settings = UserDefaults.standard
    settings.setValue(sumofpeopleArray[row], forKey:settingKey)
    settings.synchronize()
  }
  
  
}


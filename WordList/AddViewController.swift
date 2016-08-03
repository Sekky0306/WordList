//
//  AddViewController.swift
//  WordList
//
//  Created by 関戸優紀 on 2016/08/02.
//  Copyright (c) 2016年 関戸優紀. All rights reserved.
//

import UIKit

class AddViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var englishTextField: UITextField!
    @IBOutlet var japaneseTextField: UITextField!
    
    var wordArray = [Dictionary<String,String>]()
    let SaveData = NSUserDefaults.standardUserDefaults()

    override func viewDidLoad() {
        super.viewDidLoad()

        englishTextField.delegate = self
        japaneseTextField.delegate = self
        
        
        // Do any additional setup after loading the view.
        if SaveData.objectForKey("WORD") != nil {
            wordArray = SaveData.objectForKey("WORD") as! Array
        }
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool{
        // キーボードを閉じる
        textField.resignFirstResponder()
        
        return true
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    @IBAction func saveWord(){
        let wordDictionary =
        ["english": englishTextField.text!,"japanese":japaneseTextField.text!]
        
        wordArray.append(wordDictionary)
        SaveData.setObject(wordArray, forKey: "WORD")
        
        let alert = UIAlertController(
            title: "保存完了",
            message: "単語の登録が完了しました",
            preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(
            UIAlertAction(
                title: "OK",
                style: UIAlertActionStyle.Default,
                handler: nil
            )
        )
        self.presentViewController(alert, animated: true, completion: nil)
        englishTextField.text = ""
        japaneseTextField.text = ""
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  QuestionViewController.swift
//  WordList
//
//  Created by 関戸優紀 on 2016/08/02.
//  Copyright (c) 2016年 関戸優紀. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet var nextButton: UIButton!
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var answerLabel: UILabel!
    
    var isAnswered: Bool = false
    
    var wordArray: [AnyObject] = []
    
    var shuffledWordArray: [AnyObject] = []
    
    var nowNumber: Int = 0
    
    let saveData = NSUserDefaults.standardUserDefaults()

    override func viewDidLoad() {
        super.viewDidLoad()
        answerLabel.text = ""

        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(animated: Bool) {
        wordArray = saveData.arrayForKey("WORD")!
        shuffle()
        questionLabel.text = shuffledWordArray[nowNumber]["english"] as? String
//        answerLabel.text = shuffledWordArray[nowNumber]["japanese"] as? String
//        func shuffle() {
//            while wordArray.count > 0 {
//                let index = Int(rand()) %  wordArray.count
//                shuffledWordArray.append(wordArray[index])
//            }
//        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func shuffle() {
        while wordArray.count > 0 {
            let index = Int(rand()) %  wordArray.count
            shuffledWordArray.append(wordArray[index])
            wordArray.removeAtIndex(index)
        }
    }
    @IBAction func nextButtonPushed() {
        if isAnswered == false{
            nowNumber++
            answerLabel.text = ""
            if nowNumber < shuffledWordArray.count {
                questionLabel.text = shuffledWordArray[nowNumber]["english"] as? String
                answerLabel.text = shuffledWordArray[nowNumber]["japanese"] as? String
                
                isAnswered = false
                nextButton.setTitle("答えを表示", forState: UIControlState.Normal)
            }else{
                self.performSegueWithIdentifier("toFinishView", sender: nil)
            }
                
            }else{
                answerLabel.text = shuffledWordArray[nowNumber]["japanese"] as? String
                
                isAnswered = true
                
                nextButton.setTitle("次へ", forState: UIControlState.Normal)
            }
            
        
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
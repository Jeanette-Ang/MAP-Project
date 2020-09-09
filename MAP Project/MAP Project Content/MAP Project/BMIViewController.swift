//
//  BMIViewController.swift
//  MAP Project
//
//  Created by JeanetteAng on 28/7/20.
//  Copyright © 2020 ITE. All rights reserved.
//
//www.youtube.com/watch?v=jHJsj86Ac8w* (Reference)


import UIKit

class BMIViewController: UIViewController {

    @IBOutlet var Weightlbl: UILabel!
    @IBOutlet var txtWeight: UITextField!
    @IBOutlet var Heightlbl: UILabel!
    @IBOutlet var txtHeight: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    var bmiMsg = ""
    
    @IBOutlet var Resultlbl: UILabel!
    @IBAction func btnCalculateBMI(_ sender: UIButton) {
    let Height = (txtHeight.text! as NSString).floatValue
    let Weight = (txtWeight.text! as NSString).floatValue
        
    let Height2 = Height * Height
    let finalanswer = Weight/Height2
    
    if finalanswer < 18.5{
        bmiMsg = "You are in the Under Weight range. Advice: Eat more frequently"
    }else if finalanswer >= 18.5 && finalanswer < 25{
        bmiMsg = "You are in the Healthy Weight range. Advice: Don't skip breakfast"
    }else if finalanswer >= 25 && finalanswer < 30{
        bmiMsg = "You are in the Over Weight range. Advice: To maintain a healthy weight, you have to eat the right foods throughout the day. Fruits, vegetables, grains and other healthy items will help keep your body balanced and prevent unwanted weight gain"
    }else if finalanswer >= 30 && finalanswer < 35{
        bmiMsg = "You are in the Obese Weight range. Advice: Consider adding physical activity into your daily life"
    }else if finalanswer >= 35 && finalanswer < 40{
        bmiMsg = "You are in the Severely Obese Weight range. Advice: Cut down on Sugar-sweetened beverages"
    }else if finalanswer >= 40{
        bmiMsg = "You are in the Morbidly Obese Weight range. Advice: Change your diet"
    }
        Resultlbl.text = """
        BMI:\(round(finalanswer * 10) / 10)
        \(bmiMsg)
        """

        
        
        
    
        

    }

  
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

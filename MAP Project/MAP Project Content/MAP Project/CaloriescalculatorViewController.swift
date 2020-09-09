//
//  CaloriescalculatorViewController.swift
//  MAP Project
//
//  Created by JeanetteAng on 6/8/20.
//  Copyright © 2020 ITE. All rights reserved.
//
// Reference//
//codewithchris.com/uipickerview-example//

import UIKit

enum WomenScoreEnum: Float {
    case Sedentary = 1.0
    case LowActive = 1.14
    case Active = 1.27
    case VeryActive = 1.45
}

enum MenScoreEnum: Float {
    case Sedentary = 1.0
    case LowActive = 1.12
    case Active = 1.27
    case VeryActive = 1.54
}


class CaloriescalculatorViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet var txtHeight: UITextField!
    @IBOutlet var txtWeight: UITextField!
    @IBOutlet var txtAge: UITextField!
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet var Resultlbl: UILabel!

    var activelevel: [String] = [String]()
    var selectedactive: Int?
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Connect data:
        picker.delegate = self
        picker.dataSource = self
        
        // Input the data into the array
        activelevel = ["Sedentary","Low Active","Active","Very Active"]

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnCalories(_ sender: Any) {
        let Height = (txtHeight.text! as NSString).floatValue
        let Weight = (txtWeight.text! as NSString).floatValue
        let Age = (txtAge.text! as NSString).floatValue
        var activeScore: Float = 1.0
        var result: Float = 0.0
        
        selectedactive = picker.selectedRow(inComponent: 0)
        
        if defaults.string(forKey: "userGender") == "Male" {
            switch selectedactive! {
                case 0: activeScore = MenScoreEnum.Sedentary.rawValue
                case 1: activeScore = MenScoreEnum.LowActive.rawValue
                case 2: activeScore = MenScoreEnum.Active.rawValue
                case 3: activeScore = MenScoreEnum.VeryActive.rawValue
                default: return
            }
            result = 864 - 9.72 * Age + activeScore * (14.2 * Weight + 503  * Height)
        
        } else if defaults.string(forKey: "userGender") == "Female" {
            switch selectedactive! {
                case 0: activeScore = WomenScoreEnum.Sedentary.rawValue
                case 1: activeScore = WomenScoreEnum.LowActive.rawValue
                case 2: activeScore = WomenScoreEnum.Active.rawValue
                case 3: activeScore = WomenScoreEnum.VeryActive.rawValue
                default: return
            }
            result = 387 - 7.31 * Age + activeScore * (10.9 * Weight + 660.7 * Height)
        
        } else  {
            print("Invalid input")
        }
        
        Resultlbl.text = String(round(result));
    }


   // Number of columns of data
   func numberOfComponents(in pickerView: UIPickerView) -> Int {
       return 1
   }
   
   // The number of rows of data
   func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       return activelevel.count
   }
   
   // The data to return fopr the row and component (column) that's being passed in
   func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
       return activelevel[row]
   }

    func activeScoreW(activeLevel: String) -> Float {
        
        // use enum to retrieve score
        return 0.0
    }
    
    func activeScoreM (activeLevel: String) -> Float {
        // use enum to retrieve score
        return 0.0
    }
        

}

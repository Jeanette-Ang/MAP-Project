//
//  RegisterUserViewController.swift
//  MAP Project
//
//  Created by JeanetteAng on 28/7/20.
//  Copyright © 2020 ITE. All rights reserved.
//

// Reference
////stackoverflow.com/questions/14557925/httpshow-can-i-restrict-special-characters-in-uitextfield-except-dot-and-underscores//
////www.ioscreator.com/tutorials/display-date-date-picker-ios-tutorial//

import UIKit


 

class RegisterUserViewController: UIViewController {

    @IBOutlet var txtUsername: UITextField!

    @IBOutlet var txtPassword: UITextField!

    @IBOutlet var txtRePassword: UITextField!

    @IBOutlet weak var dateofbirthLabel: UILabel!

    @IBOutlet weak var datepicker: UIDatePicker!

    @IBOutlet var segGenderOutlet: UISegmentedControl!

    var gender = "Male"

    @IBAction func segGenderAction(_ sender: Any) {

        switch(segGenderOutlet.selectedSegmentIndex) {

            case 0:gender = "Male"

            case 1: gender = "Female"

            default: print("Error")

        }

    }


 

    @IBAction func btnRegisterAccount(_ sender: Any) {

        if  txtUsername.text == "" || txtPassword.text == "" {

            let errorAlert = UIAlertController(title:"Error", message: "Fill in the blanks", preferredStyle: .alert)

            let okAction = UIAlertAction(title:"OK", style: .default, handler: nil)

            errorAlert.addAction(okAction)

            present(errorAlert, animated: true, completion: nil)

        

        } else if txtRePassword.text != txtRePassword.text || txtRePassword.text!.count < 8 {

            let errorAlert = UIAlertController(title:"Error", message: "Password minimum 8 length.", preferredStyle: .alert)

            let okAction = UIAlertAction(title:"OK", style: .default, handler: nil)

            errorAlert.addAction(okAction)

            present(errorAlert, animated: true, completion: nil)

        } else if !isValidInput(Input: txtUsername.text!) {

            let errorAlert = UIAlertController(title:"Error", message: "Username must have only numbers [A-Z] and letters [0-9].", preferredStyle: .alert)

            let okAction = UIAlertAction(title:"OK", style: .default, handler: nil)

            errorAlert.addAction(okAction)

            present(errorAlert, animated: true, completion: nil)
            
        } else if !isValidInputPassword(Input: txtPassword.text!) {

        let errorAlert = UIAlertController(title:"Error", message: "password must have numbers [0-9], letters [A-Z] and special letters ($@$#!%*?&).", preferredStyle: .alert)

        let okAction = UIAlertAction(title:"OK", style: .default, handler: nil)

        errorAlert.addAction(okAction)

        present(errorAlert, animated: true, completion: nil)


        } else {
            let defaults = UserDefaults.standard
            defaults.set(txtUsername.text, forKey: "userNameDefault")
            defaults.set(txtPassword.text, forKey: "passwordDefault")
            defaults.set(gender, forKey: "userGender")
            
            print(defaults.string(forKey: "userNameDefault"))
            print(defaults.string(forKey: "passwordDefault"))
            print(defaults.string(forKey: "userGender"))
            
            performSegue(withIdentifier: "segueRegister", sender: nil)


            // store details: username, password, dob, gender

        }


 

        let dateFormatter = DateFormatter()

        dateFormatter.dateStyle = DateFormatter.Style.short

        dateFormatter.dateFormat = "dd.MM.yyyy"
        

        let strDate = dateFormatter.string(from: datepicker.date)

        dateofbirthLabel.text = strDate

        

    }


 

    func isValidInputPassword(Input:String) -> Bool {
        let String = NSPredicate(format: "SELF MATCHES %@ ", "^(?=.*[a-z])(?=.*[$@$#!%*?&]).{6,}$")

        return String.evaluate(with: Input)

        //return Input.range(of: "\\A\\w{7,18}\\z", options: .regularExpression) != nil

    }
    
    func isValidInput(Input:String) -> Bool {

        return Input.range(of: "\\A\\w{7,18}\\z", options: .regularExpression) != nil

    }

 

    override func viewDidLoad() {

        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        

    }

}

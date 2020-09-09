//
//  LoginViewController.swift
//  MAP Project
//
//  Created by JeanetteAng on 4/8/20.
//  Copyright © 2020 ITE. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var txtUsername: UITextField!
    @IBOutlet var txtPassword: UITextField!
    @IBAction func btnLogin(_ sender: Any) {
        let username: String = txtUsername.text!
        let password: String = txtPassword.text!
        
       
        
        
        // Retrive defult password from device
        let defaults = UserDefaults.standard
        let usernameDefault = defaults.string(forKey: "userNameDefault")
        let passwordDefault = defaults.string(forKey: "passwordDefault")
        //check username, password
        if (username == usernameDefault) && (password == passwordDefault) {
            //Successful
            print("Login Successful")
            
            performSegue(withIdentifier: "segueLogin", sender: nil)
        }
        else{
            //Unsuccessful
            print("Error Login")
            
            let errorAlert = UIAlertController(title: "Error", message: "Incorrect Username or Password", preferredStyle: .alert)
                   let okAction = UIAlertAction(title: "ok", style: .default, handler: nil)
                   errorAlert.addAction(okAction)
                   present(errorAlert, animated: true, completion: nil)
        }
            
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        let defaults = UserDefaults.standard
//        defaults.set("Admin", forKey: "userNameDefault")
//        defaults.set("12345678", forKey: "passwordDefault")
//        defaults.set("male", forKey: "userGender")
        
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
     
          // Start Editing The Text Field
          func textFieldDidBeginEditing(_ textField: UITextField) {
              moveTextField(textField, moveDistance: -250, up: true)
          }
          
          // Finish Editing The Text Field
          func textFieldDidEndEditing(_ textField: UITextField) {
              moveTextField(textField, moveDistance: -250, up: false)
          }
          
          // Hide the keyboard when the return key pressed
          func textFieldShouldReturn(_ textField: UITextField) -> Bool {
              textField.resignFirstResponder()
              return true
          }
          
          // Move the text field in a pretty animation!
          func moveTextField(_ textField: UITextField, moveDistance: Int, up: Bool) {
              let moveDuration = 0.3
              let movement: CGFloat = CGFloat(up ? moveDistance : -moveDistance)
              
              UIView.beginAnimations("animateTextField", context: nil)
              UIView.setAnimationBeginsFromCurrentState(true)
              UIView.setAnimationDuration(moveDuration)
              self.view.frame = self.view.frame.offsetBy(dx: 0, dy: movement)
              UIView.commitAnimations()
          }

        // Do any additional setup after loading the view.
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

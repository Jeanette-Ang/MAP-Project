//
//  ViewController.swift
//  MAP Project
//
//  Created by JeanetteAng on 27/7/20.
//  Copyright © 2020 ITE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBAction func btnLogin(_ sender: Any) {
        if txtUsername.text == "" || //blank userName
            txtPassword.text == "" { //blank password
            
        let errorAlert = UIAlertController(title: "Error", message:"Fill in Username and Password", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            errorAlert.addAction(okAction)
            present(errorAlert, animated: true, completion: nil)
        }
    }
    override func viewDidLoad() {
       super.viewDidLoad()

           // Do any additional setup after loading the view.
       }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

        


    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */



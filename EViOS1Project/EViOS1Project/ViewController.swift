//
//  ViewController.swift
//  EViOS1Project
//
//  Created by Student06 on 07/07/2022.
//

import UIKit

class ViewController: UIViewController
{
    
    @IBOutlet var switchMain: UISwitch!
    @IBOutlet var profilIcon: UIImageView!
    @IBOutlet var eyeButton: UIButton!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var loginTextField: UITextField!
    @IBOutlet var constrainEyevsSafeView: NSLayoutConstraint!
    
    var eyeShow : Bool = false
    var switchStatut : Bool
    var loginString : String = ""
    var passwordString : String = ""
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Flip the switch
        switchMain.transform = CGAffineTransform(scaleX: -1, y: 1)
        
        // Close Keyboard when touch outside the keyboard
        let tapOnView = UITapGestureRecognizer(target: view, action:
        #selector(UIView.endEditing))
        view.addGestureRecognizer(tapOnView)
        
        passwordTextField.delegate = self
        loginTextField.delegate = self
    
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        // Create a circle around the profil image
        profilIcon.layer.cornerRadius = profilIcon.frame.size.width / 2
    }

    @IBAction func touchEye(_ sender: Any)
    {
        
        // Password is show or hidden accordingly to the state of the "eyeShow" variable, when the button is touched
        if eyeShow
        {
            eyeButton.setImage(UIImage(named: "eye_on_icon"), for: .normal)
            passwordTextField.isSecureTextEntry = true
            constrainEyevsSafeView.constant = 25
            
            eyeShow = false
        }
        else
        {
            eyeButton.setImage(UIImage(named: "eye_off_icon"), for: .normal)
            passwordTextField.isSecureTextEntry = false
            constrainEyevsSafeView.constant = 35
            
            
            eyeShow = true
        }
        
    }
    
    // If the login and password conform to the rule, a positive alert is shown, if not an error alert is show instead. Differents alerts are shown depending of if the user is subscribed to the news letter or not.
    @IBAction func loginButton(_ sender: Any)
    {
        
        let alert : UIAlertController
        
        loginString = loginTextField.text ?? ""
        passwordString = passwordTextField.text ?? ""
        
        if loginTextField.text != nil && passwordTextField.text != nil && loginString.contains("@") && passwordString.count >= 4
        {
            switchStatut = switchMain.isOn
            
            if switchMain.isOn
            {
                alert  = UIAlertController(title: "Bienvenue \(loginString) !", message: "Vous vous etes inscris à la news letter", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Merci!", style: .default, handler: { action in print("TOUCH merci with news letter")}))
            }
            else
            {
                alert  = UIAlertController(title: "Bienvenue \(loginString) !", message: "Vous ne vous etes pas inscris à la news letter", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Merci!", style: .default, handler: { action in print("TOUCH merci no news letter")}))
            }
        }
        else
        {
            alert  = UIAlertController(title: "ERROR", message: "Une  des conditions n'est pas respectée", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in print("TOUCH OK")}))
            
            loginString = ""
            passwordString = ""
        }
        
        present(alert, animated: true, completion: nil)
        
    }
    
}

// Close keyboard when "Enter" is pressed
extension ViewController: UITextFieldDelegate {
func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    view.endEditing(true)
    return true
}
}


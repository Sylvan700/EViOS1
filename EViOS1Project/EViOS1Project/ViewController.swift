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
}

// Close keyboard when enter is pressed
extension ViewController: UITextFieldDelegate {
func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    view.endEditing(true)
    return true
}
}


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
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        switchMain.transform = CGAffineTransform(scaleX: -1, y: 1)
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        profilIcon.layer.cornerRadius = profilIcon.frame.size.width / 2
    }

}


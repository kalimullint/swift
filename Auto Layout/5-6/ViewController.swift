//
//  ViewController.swift
//  5-6
//
//  Created by Kallimullin.T on 02/03/2020.
//  Copyright © 2020 Kallimullin.T. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func showMessage(sender: UIButton) {
        let alertController = UIAlertController(title: "Welcome to My First App", message: "Hello World", preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


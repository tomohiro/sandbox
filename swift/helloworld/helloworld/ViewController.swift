//
//  ViewController.swift
//  helloworld
//
//  Created by Tomohiro TAIRA on 10/23/15.
//  Copyright © 2015 Tomohiro TAIRA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var message: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func messageShow(sender: AnyObject) {
        message.hidden = false
    }

    @IBAction func messageHide(sender: AnyObject) {
        message.hidden = true
    }

}


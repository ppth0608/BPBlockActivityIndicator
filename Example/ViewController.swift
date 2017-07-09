//
//  ViewController.swift
//  Example
//
//  Created by Naver on 2017. 7. 9..
//  Copyright © 2017년 BPBlockActivityIndicator. All rights reserved.
//

import UIKit
import BPBlockActivityIndicator

class ViewController: UIViewController {

    @IBOutlet weak var blockIndicator: BPBlockActivityIndicator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func startAnimate(_ sender: Any) {
        blockIndicator.animate()
    }
    
    @IBAction func stopAnimate(_ sender: Any) {
        blockIndicator.stop()
    }
}


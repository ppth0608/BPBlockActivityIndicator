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
    
    var indicator: BPBlockActivityIndicator!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // initialize BPBlockActivityIndicator programmingly
        /*
        indicator = BPBlockActivityIndicator(frame: CGRect(x: 30, y: 30, width: 40, height: 40))
            .movementSpeed(0.2)
            .blockColor(.cyan)
        view.addSubview(indicator)
        indicator.animate()
        */
    }
    
    @IBAction func startAnimate(_ sender: Any) {
        blockIndicator.animate()
    }
    
    @IBAction func stopAnimate(_ sender: Any) {
        blockIndicator.stop()
    }
}


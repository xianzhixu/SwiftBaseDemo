//
//  ViewController.swift
//  swift_1
//
//  Created by huyu_quq on 17/3/27.
//  Copyright © 2017年 HYWLUO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let firstView: UIView  = UIView();
        firstView.backgroundColor = UIColor.orange;
        
        self.view .addSubview(firstView);
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


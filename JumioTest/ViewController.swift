//
//  ViewController.swift
//  JumioTest
//
//  Created by Blake on 2024/6/12.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let button = UIButton(type: .custom)
        button.setTitle("test generate key", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        
        button.frame = CGRect(x: 100, y: 100, width: 150, height: 50)
        button.addTarget(self, action: #selector(generateAction(_:)), for: .touchUpInside)
        
        self.view.addSubview(button)
    }

    @objc func generateAction(_ sender: UIButton) {
        let locals = KeyUtil.generateKeypair()
        
        print(locals)
    }
    
}


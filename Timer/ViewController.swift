//
//  ViewController.swift
//  Timer
//
//  Created by Jamie on 2020/06/14.
//  Copyright © 2020 Jamie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    //    let hard = 12
    //    let mid = 7
    //    let soft = 5
    
    let eggTimer = ["soft" : 10, "mid" : 3, "hard" : 4]
    
    var totalTime = 1
    var progressedTime = 0
    
    var timer = Timer()
//    var text : String = ""
    
    @IBOutlet weak var mainText: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBAction func itemSelect(_ sender: UIButton) {
        
        
        timer.invalidate()
        progressBar.progress = 0.0
        progressedTime = 0
        mainText.text = "How else?"
        
        let name = sender.currentTitle!
        
        totalTime = eggTimer[name]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update), userInfo: nil, repeats: true)
        
    }
    
    @objc func update() {
        
        if(totalTime > progressedTime){
            progressedTime += 1
            
            var percentage: Float = Float(progressedTime) / Float(totalTime)
            progressBar.progress = percentage
    
            
        }
        else {
            timer.invalidate()
            mainText.text = "done"
        }
    }
}










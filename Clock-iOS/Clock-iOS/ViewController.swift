//
//  ViewController.swift
//  Clock-iOS
//
//  Created by Dhaval Nagar on 25/08/15.
//  Copyright (c) 2015 Dhaval. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    
    let clock = Clock()
    var timer: NSTimer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //registerForForegroundNotification()
        
        // Creates 1 second timer which will call updateTime method everytime it triggers
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "updateTime", userInfo: nil, repeats: true)
    }

    // Register Method for Foreground Notification
    func registerForForegroundNotification(){
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "updateTime",
            name: UIApplicationWillEnterForegroundNotification,
            object: nil)
    }
    
    
    // Unregister from Foreground Notification 
    func unregisterFromForegroundNotification(){
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    deinit {
        //unregisterFromForegroundNotification()
        
        // Stop the timer
        if let timer = self.timer {
            timer.invalidate()
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        updateTime()
    }
    
    func updateTime(){
        timeLabel.text = clock.currentTimeInShort()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


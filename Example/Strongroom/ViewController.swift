//
//  ViewController.swift
//  Strongroom
//
//  Created by njangula@myriadmobile.com on 10/10/2018.
//  Copyright (c) 2018 njangula@myriadmobile.com. All rights reserved.
//

import UIKit
import Strongroom

class TestClass { }

class ViewController: UIViewController {

    let count = 1

    override func viewDidLoad() {
        super.viewDidLoad()        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}






private var dispatchTimeCache = [String: DispatchTime]()
private let SECONDS_PER_NANO_SECONDS = 0.000000001

/**
 Starts a timer to measure a duration
 
 :param: tag    A string identifying the timer;  Used to have multiple timers at once
 */
public func tick(_ tag: String = "") {
    dispatchTimeCache[tag] = DispatchTime.now()
}

/**
 Prints out the duration of time since the invocation of tick.
 
 :param: tag    A string identifying the timer;  Used to have multiple timers at once
 */
public func tock(_ tag: String = "") {
    if let time = dispatchTimeCache[tag] {
        let nanoseconds = DispatchTime.now().uptimeNanoseconds - time.uptimeNanoseconds
        let seconds = Double(nanoseconds) * SECONDS_PER_NANO_SECONDS
        
        print("----tock----\n\(seconds)s\n------\(tag)------")
    } else {
        print("tick() was not invoked")
    }
}

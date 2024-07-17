//
//  Manager.swift
//  NotificationCenterSample2
//
//  Created by Supraja on 29/06/24.
//

import UIKit

struct TextModel {
    var colour: String?
}

class Manager {
    
    static let shared = Manager()
    
    let notificationName = NSNotification.Name("TextNotification")
    
    private init() { }
    
    func sendColour(_ color: UIColor) {
        NotificationCenter.default.post(name: notificationName, object: color, userInfo: nil)
    }
}

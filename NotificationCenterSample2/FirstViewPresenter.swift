//
//  FirstViewPresenter.swift
//  NotificationCenterSample2
//
//  Created by Supraja on 01/07/24.
//

import UIKit

protocol FirstViewPresenterDelegate: AnyObject {
    func didReceiveColour(_ colour: UIColor?)
}

class FirstViewPresenter {
    
    let manager = Manager.shared
    
    weak var delegate: FirstViewPresenterDelegate?
    
    init() {
        
    }
    
    func addObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(didReceiveNotification), name: manager.notificationName, object: nil)
    }
    
    func removeObserver() {
        NotificationCenter.default.removeObserver(self, name: manager.notificationName, object: nil)
    }
    
    @objc func didReceiveNotification(_ notification: NSNotification) {
        guard let colour = notification.object as? UIColor else { return }
        delegate?.didReceiveColour(colour)
    }
}

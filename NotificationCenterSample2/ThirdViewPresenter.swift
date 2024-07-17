//
//  ThirdViewPresenter.swift
//  NotificationCenterSample2
//
//  Created by Supraja on 17/07/24.
//

import UIKit

protocol ThirdViewPresenterDelegate: AnyObject {
    func didReceiveColour(_ colour: UIColor?)
}

class ThirdViewPresenter {
    
    let manager = Manager.shared
    
    weak var delegate: ThirdViewPresenterDelegate?
    
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

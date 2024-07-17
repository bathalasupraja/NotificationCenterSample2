//
//  FirstViewController.swift
//  NotificationCenterSample2
//
//  Created by Supraja on 29/06/24.
//

import UIKit

class FirstViewController: UIViewController {
    
    static func create() -> FirstViewController? {
        UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FirstViewController") as? FirstViewController
    }
    
    @IBOutlet weak var titleLabel1: UILabel!
    @IBOutlet weak var titleButton1: UIButton!
    
    var presenter = FirstViewPresenter()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        updateNotificationListenStatus(false)
    }
    
    @IBAction func didTouchAction(_ sender: UIButton) {
        if sender.tag == 100 {
            updateNotificationListenStatus(true)
        } else {
            updateNotificationListenStatus(false)
        }
    }
    
    private func updateNotificationListenStatus(_ shouldListen: Bool) {
        if shouldListen {
            titleButton1.tag = 200
            titleButton1.setTitle(AppConstants.buttonMuteText, for: .normal)
            presenter.addObserver()
            
        } else {
            titleButton1.tag = 100
            titleButton1.setTitle(AppConstants.buttonListenText, for: .normal)
            presenter.removeObserver()
        }
    }
}

extension FirstViewController: FirstViewPresenterDelegate {
    func didReceiveColour(_ colour: UIColor?) {
        self.view.backgroundColor = colour
    }
}

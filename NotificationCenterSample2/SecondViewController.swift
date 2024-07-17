//
//  SecondViewController.swift
//  NotificationCenterSample2
//
//  Created by Supraja on 29/06/24.
//

import UIKit

class SecondViewController: UIViewController {
    
    static func create() -> SecondViewController? {
        UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController
    }
    
    @IBOutlet weak var titleLabel2: UILabel!
    @IBOutlet weak var titleButton2: UIButton!
    
    
    var presenter = SecondViewPresenter()
    
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
            titleButton2.tag = 200
            titleButton2.setTitle(AppConstants.buttonMuteText, for: .normal)
            presenter.addObserver()
        } else {
            titleButton2.tag = 100
            titleButton2.setTitle(AppConstants.buttonListenText, for: .normal)
            presenter.removeObserver()
        }
    }
}

extension SecondViewController: SecondViewPresenterDelegate {
    func didReceiveColour(_ colour: UIColor?) {
        self.view.backgroundColor = colour
    }
}


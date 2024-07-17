//
//  ThirdViewController.swift
//  NotificationCenterSample2
//
//  Created by Supraja on 29/06/24.
//

import UIKit

class ThirdViewController: UIViewController {
    
    static func create() -> ThirdViewController? {
        UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ThirdViewController") as? ThirdViewController
    }
    
    @IBOutlet weak var titleLabel3: UILabel!
    @IBOutlet weak var titleButton3: UIButton!
    
    var presenter = ThirdViewPresenter()

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
            titleButton3.tag = 200
            titleButton3.setTitle(AppConstants.buttonMuteText, for: .normal)
            presenter.addObserver()
        } else {
            titleButton3.tag = 100
            titleButton3.setTitle(AppConstants.buttonListenText, for: .normal)
            presenter.removeObserver()
        }
    }
}

extension ThirdViewController: ThirdViewPresenterDelegate {
    func didReceiveColour(_ colour: UIColor?) {
        self.view.backgroundColor = colour
    }
}


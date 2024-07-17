//
//  FourthViewController.swift
//  NotificationCenterSample2
//
//  Created by Supraja on 29/06/24.
//

import UIKit

class FourthViewController: UIViewController {
    
    static func create() -> FourthViewController? {
        UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FourthViewController") as? FourthViewController
    }
    
    @IBOutlet weak var titleLabel4: UILabel!
    @IBOutlet weak var titleButton4: UIButton!
    
    var presenter = FourthViewPresenter()

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
            titleButton4.tag = 200
            titleButton4.setTitle(AppConstants.buttonMuteText, for: .normal)
            presenter.addObserver()
        } else {
            titleButton4.tag = 100
            titleButton4.setTitle(AppConstants.buttonListenText, for: .normal)
            presenter.removeObserver()
        }
    }
}

extension FourthViewController: FourthViewPresenterDelegate {
    func didReceiveColour(_ colour: UIColor?) {
        self.view.backgroundColor = colour
    }
}


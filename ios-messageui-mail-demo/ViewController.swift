//
//  ViewController.swift
//  ios-messageui-mail-demo
//
//  Created by Eiji Kushida on 2017/04/04.
//  Copyright © 2017年 Eiji Kushida. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let mail = MailHelper()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    @IBAction func didTapSendMail(_ sender: UIButton) {
        mail.sendMail(toRecipients: ["hoge@gmail.com"],
                      subject: "お問い合わせの件",
                      messageBody: "かくかくしかじか")
    }
    
    private func setup() {
        mail.delegate = self
        mail.topOf = self
    }
}

// MARK: - MailHelperDelegate
extension ViewController: MailHelperDelegate {
    
    func complated(status: MailStatus) {
        
        switch status {
        case .sent(let message):
            print(message)
        case .canceled(let message):
            print(message)
        case .saved(let message):
            print(message)
        case .failed(let message):
            print(message)
        }
    }
}


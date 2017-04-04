//
//  MailHelper.swift
//  ios-messageui-mail-demo
//
//  Created by Eiji Kushida on 2017/04/04.
//  Copyright © 2017年 Eiji Kushida. All rights reserved.
//

import MessageUI

enum MailStatus {
    case sent(message: String)
    case canceled(message: String)
    case saved(message: String)
    case failed(message: String)
}

protocol MailHelperDelegate {
    func complated(status: MailStatus)
}

final class MailHelper: NSObject {
    
    var delegate: MailHelperDelegate?
    var topOf: UIViewController?
    
    /// メールを送信する
    ///
    /// - Parameters:
    ///   - toRecipients: 宛先の一覧
    ///   - subject: タイトル
    ///   - messageBody: ・メッセージ
    func sendMail(toRecipients: [String],
                  subject: String,
                  messageBody: String) {
        
        guard MFMailComposeViewController.canSendMail() else{
            delegate?.complated(status: .failed(message: "送信できません"))
            return
        }
        
        let mail = MFMailComposeViewController()
        mail.mailComposeDelegate = self
        mail.setToRecipients(toRecipients)
        mail.setSubject(subject)
        mail.setMessageBody(messageBody, isHTML: false)
        topOf?.present(mail, animated: true, completion: nil)
    }
}


// MARK: - MFMailComposeViewControllerDelegate
extension MailHelper: MFMailComposeViewControllerDelegate {
    
    func mailComposeController(_ controller: MFMailComposeViewController,
                               didFinishWith result: MFMailComposeResult,
                               error: Error?) {
        switch result {
        case .sent:
            delegate?.complated(status: .sent(message: "送信が完了しました。"))
        case .saved:
            delegate?.complated(status: .saved(message: "下書き保存しました。"))
        case .cancelled:
            delegate?.complated(status: .canceled(message: "キャンセルされました。"))
        case .failed:
            delegate?.complated(status: .failed(message: "送信失敗しました。"))
        }
        
        topOf?.dismiss(animated: true, completion: nil)
    }
}

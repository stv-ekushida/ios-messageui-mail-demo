# MFMailComposeViewController

## 概要
MFMailComposeViewControllerは、アプリからメーラーを起動するときに利用します。<br><br>

![screen shot 2017-04-04 at 9 59 07](https://cloud.githubusercontent.com/assets/9479568/24637646/c142e8c6-191d-11e7-9996-e879a56b63d9.png)

## 関連クラス
MFMailComposeViewControllerDelegate、MFMessageComposeViewControllerDelegate

## 主要メソッド

|メソッド名|説明|サンプル|
|---|---|---|
| setToRecipients  |  宛先(TO)の一覧を設定する |  mail.setToRecipients(toRecipients) |
| setCcRecipients  |  宛先(CC)の一覧を設定する |  mail.setCcRecipients(toRecipients) |
| setBccRecipients  |  宛先(BCC)の一覧を設定する |  mail.setBccRecipients(toRecipients) |
| setMessageBody  |  本文を設定する | mail.setMessageBody(messageBody, isHTML: false)  |
| addAttachmentData  | 添付ファイルを設定する |  mail.addAttachmentData(imageData, mimeType: "image/png", fileName: "image")
 |
| canSendMail  |  メールが利用できるか確認する |  MFMailComposeViewController.canSendMail()|

## MFMailComposeViewControllerDelegateのメソッド
|メソッド名|説明|必須|
|---|---|---|
|didFinishWith  | メールに対するアクション完了後に呼ばれる | - |

## フレームワーク
MessageUI.framework

## サポートOSバージョン
iOS3.0以上

## 開発環境
|category | Version| 
|---|---|
| Swift | 3.0.2 |
| XCode | 8.3 |
| iOS | 10.2〜 |

## 参考
https://developer.apple.com/reference/messageui/mfmailcomposeviewcontroller

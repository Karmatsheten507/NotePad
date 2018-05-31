//
//  HomeViewController.swift
//  NotePad
//
//  Created by Nando Septian Husni on 5/30/18.
//  Copyright © 2018 imastudio. All rights reserved.
//

import UIKit


// import for your massage and mail
import MessageUI
import Foundation

class HomeViewController: UIViewController, MFMessageComposeViewControllerDelegate, MFMailComposeViewControllerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    @IBAction func buttonCall(_ sender: UIButton) {
        //your phone number
        let num : NSURL = URL(string: "TEL://+62 85218103503")! as NSURL
        
        // set the action
        
        UIApplication.shared.open(num as URL, options: [:], completionHandler: nil)
        
        
        // send meassage
        
        if MFMessageComposeViewController.canSendText(){
            let send = MFMessageComposeViewController()
            
            // set the boddy of your message
            
            send.body = " Body of message....."
            
            // this one for the destinaton for your message
            
            send.recipients = ["+62 85218103503"]
            
            // the delegate
            send.messageComposeDelegate = self
            
            self.present(send, animated: true, completion: nil)
        
        }else{
        print("Errorrrrrrrr")
        }
    }
    // the action when u have finished
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        
        //dismissing
        self.dismiss(animated: true, completion: nil)
        
        
    }
    
    @IBAction func buttonSMS(_ sender: UIButton) {
    }
    
    @IBAction func buttonMail(_ sender: UIButton) {
        
         let mailComposer = configuretheMail()
        if MFMailComposeViewController.canSendMail(){
            self.present(mailComposer, animated: true, completion: nil)
          //condtion when there is an error
        }else{
            self.showAlertError()
        }
        
        
    }
    
    
    
    func configuretheMail() -> MFMailComposeViewController{
        let mailComposer = MFMailComposeViewController()
        mailComposer.mailComposeDelegate = self
        
    mailComposer.setToRecipients(["kartendruk@gmail.com"])
        mailComposer.setSubject("Subject....")
        mailComposer.setMessageBody("Body...", isHTML: false)
        
        return mailComposer
    }
//function to create for alert dialog to show the error
    
    
    func  showAlertError() {
        
        let showAlert = UIAlertView(title: "Warning", message: "Errorrrr", delegate: self, cancelButtonTitle: "Ok")
        
    showAlert.show()
        
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        controller.dismiss(animated: true, completion: nil)
    }

}
    


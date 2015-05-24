//
//  ViewController.swift
//  UIActivityViewController
//
//  Created by Developer Inspirus on 5/6/15.
//  Copyright (c) 2015 Duc Tran. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate
{
    // MARK: - IBOutlet
    @IBOutlet weak var textField: UITextField!
    
    // MARK: - Properties
    
    var activityViewController: UIActivityViewController!

    // MARK: - Target Action
    
    @IBAction func shareButtonTapped(sender: UIButton)
    {
        if textField.text.isEmpty {
            let message = "Please enter some text to share with the world"
            
            let alertController = UIAlertController(title: "Ooops", message: message, preferredStyle: .Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            
            presentViewController(alertController, animated: true, completion: nil)
        } else {
            // create an instance of UIActivityViewController
            // activityItems : an array of what we want to share
            // applicationAcitivities: your app's sharing services
            // we have to cast textField.text as NSString so that iOS provides us all the services to share this text (weird :p)
            activityViewController = UIActivityViewController(activityItems: [textField.text as NSString], applicationActivities: nil)
            
            // present the activity VC modally
            presentViewController(activityViewController, animated: true, completion: nil)
        }
    }
    
    // MARK - UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        if textField == self.textField {
            textField.resignFirstResponder()
        }
        return true
    }
}























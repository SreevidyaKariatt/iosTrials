//
//  ViewController.swift
//  ApplicationLifeCycle3
//
//  Created by Nagarajan on 8/28/14.
//  Copyright (c) 2014 Nagarajan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate
{
    
    var question: UITextField?
    var answer: UITextField?
    
    override func loadView()
    {
        super.loadView()
        
        self.question = UITextField(frame: CGRect(x: 10, y: 50, width: self.view.bounds.size.width-20, height: 30))
        self.question?.borderStyle = UITextField.BorderStyle.roundedRect
        self.question?.font = UIFont.systemFont(ofSize: 15)
        self.question?.placeholder = "Enter the question"
        self.question?.autocorrectionType = UITextAutocorrectionType.no
        self.question?.keyboardType = UIKeyboardType.default
        self.question?.returnKeyType = UIReturnKeyType.done
        self.question?.clearButtonMode = UITextField.ViewMode.whileEditing
        self.question?.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        self.question?.delegate = self
        if let questionTextField = self.question {
            self.view.addSubview(questionTextField)
        }
       
        self.answer = UITextField(frame: CGRect(x: 10, y: 100, width: self.view.bounds.size.width-20, height: 30))
        self.answer?.borderStyle = UITextField.BorderStyle.roundedRect
        self.answer?.font = UIFont.systemFont(ofSize: 15)
        self.answer?.placeholder = "Enter the answer"
        self.answer?.autocorrectionType = UITextAutocorrectionType.no
        self.answer?.keyboardType = UIKeyboardType.default
        self.answer?.returnKeyType = UIReturnKeyType.done
        self.answer?.clearButtonMode = UITextField.ViewMode.whileEditing
        self.answer?.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        self.answer?.delegate = self
        if let answerTextField = self.answer {
            self.view.addSubview(answerTextField)
        }
       
    }
                            
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true
    }


}


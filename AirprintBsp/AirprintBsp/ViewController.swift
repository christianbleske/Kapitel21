//
//  ViewController.swift
//  AirprintBsp
//
//  Created by Christian Bleske on 16.05.16.
//  Copyright © 2016 Christian Bleske. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var uiTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func button_Pressed(_ sender: AnyObject) {
        let uiPrintInteractionController = UIPrintInteractionController.shared
        
        let uiPrintInfo = UIPrintInfo(dictionary:nil)
        uiPrintInfo.outputType = UIPrintInfoOutputType.general
        uiPrintInfo.jobName = "Ausdruck"
        uiPrintInteractionController.printInfo = uiPrintInfo
        
        let uiMarkupTextPrintFormatter = UIMarkupTextPrintFormatter(markupText: uiTextView.text)
        uiMarkupTextPrintFormatter.contentInsets = UIEdgeInsets(top: 72, left: 72, bottom: 72, right: 72)
        uiPrintInteractionController.printFormatter = uiMarkupTextPrintFormatter
        
        uiPrintInteractionController.present(animated: true, completionHandler: nil)
    }

}


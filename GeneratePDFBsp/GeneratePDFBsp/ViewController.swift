//
//  ViewController.swift
//  GeneratePDFBsp
//
//  Created by Christian Bleske on 31.03.16.
//  Copyright © 2016 Christian Bleske. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var uiWebView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let htmlTitle = "<h1>Excepteur sint occaecat</h1></br>"
        let htmlText = "<b>Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</b>"
        var completeText = htmlTitle
        completeText += htmlText
        
        let uiMarkupTextPrintFormatter = UIMarkupTextPrintFormatter(markupText: completeText)
        
        let uiPrintPageRenderer = UIPrintPageRenderer()
        uiPrintPageRenderer.addPrintFormatter(uiMarkupTextPrintFormatter, startingAtPageAt: 0)
        
        let a4Page = CGRect(x: 0, y: 0, width: 595.2, height: 841.8)
        let rectangle = a4Page.insetBy(dx: 0, dy: 0)
        
        uiPrintPageRenderer.setValue(NSValue(cgRect: a4Page), forKey: "paperRect")
        uiPrintPageRenderer.setValue(NSValue(cgRect: rectangle), forKey: "printableRect")
        
        let data = NSMutableData()
        UIGraphicsBeginPDFContextToData(data, CGRect.zero, nil)
        
        for i in 1...uiPrintPageRenderer.numberOfPages {
            UIGraphicsBeginPDFPage();
            let bounds = UIGraphicsGetPDFContextBounds()
            uiPrintPageRenderer.drawPage(at: i - 1, in: bounds)
        }
        
        UIGraphicsEndPDFContext();
        
        let path = "\(NSTemporaryDirectory())file.pdf"
        data.write(toFile: path, atomically: true)
        print("open \(path)") 

        let url = URL(fileURLWithPath: path)
        let request = URLRequest(url: url)
        uiWebView.loadRequest(request)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}


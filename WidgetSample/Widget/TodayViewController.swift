//
//  TodayViewController.swift
//  Widget
//
//  Created by adcapsule on 2020/04/03.
//  Copyright © 2020 shAhn. All rights reserved.
//

import UIKit
import NotificationCenter

/**
 DEFINE
 */
let GROUPDEFAULT                = UserDefaults.init(suiteName: "group.com.shTest.WidgetSample")

class TodayViewController: UIViewController, NCWidgetProviding {
    
    /**
     IBOultlet
    */
    @IBOutlet var dataLabel: UILabel!
    
    /**
     Origin
     */
    var originSize: CGSize!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Set origin
        self.originSize = self.preferredContentSize
        
        // Set Default
        self.widgetDefaultSetting()
        
        // Load Data
        self.loadData()
    }
        
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        /*
         Perform any setup necessary in order to update the view
         
         In Update Success With completionHandler(NCUpdateResult.newData)
         
         In Update Fail With completionHandler(NCUpdateResult.failed)
         
         In No Update required  With completionHandler(NCUpdateResult.noData)
         */
        
        completionHandler(NCUpdateResult.newData)
    }
    
    private func widgetDefaultSetting() {
        // Avaliable expand
        if #available(iOS 10.0, *) {
            self.extensionContext?.widgetLargestAvailableDisplayMode = .expanded
        }
    }
    
    private func loadData() {
        guard let data = GROUPDEFAULT?.string(forKey: "DATA") else {
            return
        }
        self.dataLabel.text = data
    }
    
    @available(iOS 10.0, *)
    @available(iOSApplicationExtension 10.0, *)
    func widgetActiveDisplayModeDidChange(_ activeDisplayMode: NCWidgetDisplayMode, withMaximumSize maxSize: CGSize) {
        if activeDisplayMode == .expanded {
            // If expended
            self.preferredContentSize = CGSize(width: self.view.frame.size.width, height: originSize.height + 200)
            
        } else {
            // If compact
            self.preferredContentSize = CGSize(width: self.view.frame.size.width, height: originSize.height)
            
        }
    }
    
    
    
    
    
}

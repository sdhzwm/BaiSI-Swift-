//
//  WMLoginController.swift
//  BaiSi
//
//  Created by 王蒙 on 15/7/28.
//  Copyright © 2015年 wm. All rights reserved.
//

import UIKit

class WMLoginController: UIViewController {

    @IBOutlet weak var leftConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
               super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func registerBtn(sender: UIButton) {
        self.view.endEditing(true)
        if leftConstraint.constant == 0 {
            sender.selected = true
            leftConstraint.constant -= self.view.frame.size.width
        }else{
            leftConstraint.constant = 0
            sender.selected = false
        }
        
        UIView.animateWithDuration(0.25, animations: { () -> Void in
            self.view.layoutIfNeeded()
        })
        
    }
    @IBAction func dismissView(sender: AnyObject) {
        self.view.endEditing(true)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
}

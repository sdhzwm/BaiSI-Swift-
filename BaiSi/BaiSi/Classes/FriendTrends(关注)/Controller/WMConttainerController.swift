//
//  WMConttainerController.swift
//  BaiSi
//
//  Created by 王蒙 on 15/7/25.
//  Copyright © 2015年 wm. All rights reserved.
//

import UIKit
import Alamofire
import SVProgressHUD


@objc protocol ConttainerControllerDeletage {
    optional func conttainerController(conttainer:WMConttainerController,didSelectedCategory category:WMCategory)
}
class WMConttainerController: UITableViewController {
    
    var categorys = [WMCategory]()
    
    weak var delegate:ConttainerControllerDeletage!
    
    
    override func viewDidLoad() {
        self.tableView.backgroundColor = UIColor.LobalBg()
        self.automaticallyAdjustsScrollViewInsets = false
        self.tableView.contentInset = UIEdgeInsets(top: 64, left: 0, bottom: 0, right: 0)
        self.setConttaninerControllerData()
    }
    
    func setConttaninerControllerData(){
        SVProgressHUD.showWithMaskType(.Black)
        let parameters = ["a":"category","c":"subscribe"]
        Alamofire.request(.GET, URLString: "http://api.budejie.com/api/api_open.php", parameters: parameters)
            .responseJSON(completionHandler: { (request, response, data, error) -> Void in
                if((data) != nil){
                    if let data = data as? [String: AnyObject] {
                        if let lists = data["list"] {
                            
                            self.categorys = WMCategory.categoryFromResults(lists as! [[String : AnyObject]])
                            self.tableView.reloadData()
                          
                            self.tableView.selectRowAtIndexPath(NSIndexPath(forRow: 0, inSection: 0), animated: false, scrollPosition: .Top)
                            self.delegate?.conttainerController!(self, didSelectedCategory: self.categorys[0])
                            SVProgressHUD.dismiss()
                        }
                    }
                }else{
                    print("获取数据失败: \(error)")
                    
                    dispatch_async(dispatch_get_main_queue()) {
                        SVProgressHUD.showErrorWithStatus("获取数据失败")
                    }

                }
        })
        
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.categorys.count;
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let conttainer = "Conttainer"
        let cell = tableView.dequeueReusableCellWithIdentifier(conttainer) as! WMConttainerCell
        let category = self.categorys[indexPath.row]
        cell.category = category
        return cell
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let category = self.categorys[indexPath.row]
        print(category.name)
        self.delegate.conttainerController?(self, didSelectedCategory: category)
    }
    
   
    
}

//
//  WMWordController.swift
//  BaiSi
//
//  Created by 王蒙 on 15/8/1.
//  Copyright (c) 2015年 wm. All rights reserved.
//

import UIKit
import Alamofire
import SVProgressHUD
class WMWordController: UITableViewController {
    
   private var essceType:EssenceType!
   private var wordToips = [WMWordToip]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //设置tableView的属性
        setUpTable()
        setLoadNewData()
    }
}

 // MARK: - 设置表格的基本设置及刷新
extension WMWordController{
     // MARK: - 表格基本设置
    private func setUpTable(){
        
        let bottom = tabBarController?.tabBar.frame.height;
        let top = titleViewH + textTopViewY + 20
        tableView.contentInset = UIEdgeInsets(top: top, left: 0, bottom: bottom!, right: 0)
        tableView.scrollIndicatorInsets = self.tableView.contentInset
        tableView.separatorStyle = .None
        tableView.backgroundColor = UIColor.whiteColor()
        tableView.rowHeight = 200
        tableView.registerNib(UINib(nibName: "WMWordToipCell", bundle: nil), forCellReuseIdentifier: "WMWordToipCell")
    }
     // MARK: - 刷新控件
}

// MARK: - 用来加载数据的
extension WMWordController{
    
    private func setLoadNewData(){
    
        var parameters = [String:String]()
        
        parameters["a"] = "list"
        parameters["c"] = "data"
        parameters["type"] = "10"
        
        Alamofire.request(.GET, URLString:"http://api.budejie.com/api/api_open.php", parameters: parameters).responseJSON { (request, response,  data, error) -> Void in
            
            if((data) != nil){
              
                if let date = data as? [String: AnyObject] {
                    
                    if let dateArr = date["list"] as? [[String:AnyObject]]{
                        
                        self.wordToips = WMWordToip.worfToipResults(dateArr)
                     
                       
                        self.tableView.reloadData()

                    }
                }
                
            }else{
                dispatch_async(dispatch_get_main_queue()) {
                    SVProgressHUD.showErrorWithStatus("获取数据失败")
                }
            }
            
        }

    }
    
}
 // MARK: - Table view data source
extension WMWordController{
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.wordToips.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("WMWordToipCell") as? WMWordToipCell
        let wordToip = wordToips[indexPath.row]
        
        cell?.wordToip = wordToip
        return cell!
    }

}



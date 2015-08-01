//
//  WMFirendsController.swift
//  BaiSi
//
//  Created by 王蒙 on 15/7/25.
//  Copyright © 2015年 wm. All rights reserved.
//

import UIKit
import Alamofire
import SVProgressHUD
import MJRefresh

class WMFirendsController: UITableViewController {

    var category:WMCategory!
    
    override func viewDidLoad() {
        
        self.tableView.backgroundColor = UIColor.LobalBg()
        self.automaticallyAdjustsScrollViewInsets = false
        self.tableView.rowHeight = 70
        
        self.tableView.header = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: "loadNewData")
        self.tableView.footer = MJRefreshAutoNormalFooter(refreshingTarget: self, refreshingAction: "loadMoreFriends")
        self.tableView.footer.hidden = true

    }
    func loadNewData(){
        category.currentPage = 1
        let parameters = ["a":"list","c":"subscribe","category_id":category.id,"page":category.currentPage]
        Alamofire.request(.GET, URLString: "http://api.budejie.com/api/api_open.php", parameters: (parameters as! [String : AnyObject]))
            .responseJSON(completionHandler: { (request, response, data, error) -> Void in
                if((data) != nil){
                    if let data = data as? [String: AnyObject] {
                        if let friendList = data["list"] {
                          
                           self.category.friends = WMFriend.friendsFromResults(friendList as! [[String : AnyObject]])
                            print(friendList)
                            self.tableView.reloadData()
                            self.tableView.header.endRefreshing()
                            if let tool = data["total"]{
                               self.category.total = Int(tool as! NSNumber)
                                print(self.category.total)
                            }
                            
                            self.checkFooterState()
                        }
                    }
                }else{
                    dispatch_async(dispatch_get_main_queue()) {
                        SVProgressHUD.showErrorWithStatus("获取数据失败")
                    }
                    
                }
            })
    }
    
    func loadMoreFriends(){
     
        let parameters = ["a":"list","c":"subscribe","category_id":category.id,"page":++category.currentPage]
        Alamofire.request(.GET, URLString: "http://api.budejie.com/api/api_open.php", parameters: (parameters as! [String : AnyObject]))
            .responseJSON(completionHandler: { (request, response, data, error) -> Void in
                if((data) != nil){
                    if let data = data as? [String: AnyObject] {
                        if let friendList = data["list"] {
                             self.category.friends += WMFriend.friendsFromResults(friendList as! [[String : AnyObject]])
                            
                            self.tableView.reloadData()
                            
                            self.checkFooterState()
                        }
                    }
                }else{
                    
                    dispatch_async(dispatch_get_main_queue()) {
                        SVProgressHUD.showErrorWithStatus("获取数据失败")
                        --self.category.currentPage
                    }
                    
                }
            })
    }

    func checkFooterState() {
      
        if let zcategory = self.category {
           
            tableView.footer.hidden = zcategory.friends.isEmpty
           
            if zcategory.total == zcategory.friends.count {
                tableView.footer.noticeNoMoreData()
            } else {
                tableView.footer.endRefreshing()
            }
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        checkFooterState()
        if let categorys = self.category {
            return categorys.friends.count
        } else {
            return 0
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let firendId = "firendCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(firendId) as! WMFriendCell
        let firend =  self.category.friends[indexPath.row]
        
        cell.friend = firend
        return cell
    }
}

extension WMFirendsController :ConttainerControllerDeletage{
    func conttainerController(conttainer: WMConttainerController, didSelectedCategory category: WMCategory) {
        self.category = category
        
        tableView.header.endRefreshing()
        tableView.footer.endRefreshing()
        tableView.reloadData()
        
        if self.category.friends.isEmpty {
            tableView.header.beginRefreshing()
        }

    }
}


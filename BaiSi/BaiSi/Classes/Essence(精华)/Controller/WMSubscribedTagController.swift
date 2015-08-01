//
//  WMSubscribedTagController.swift
//  BaiSi
//
//  Created by 王蒙 on 15/7/25.
//  Copyright © 2015年 wm. All rights reserved.
//

import UIKit
import Alamofire
import SVProgressHUD

class WMSubscribedTagController: UITableViewController {
    var refSubTag = [WMSubscribedTag]()
    var defSubTag = [WMSubscribedTag]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.LobalBg()
        self.title = "推荐标签"
        self.setUpSubScribedData()
        self.tableView.rowHeight = 70
        
        let btn = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: Selector("pushTagUser"))
        btn.tintColor = UIColor.RGBColor(131, g: 131, b:131)

        self.navigationItem.rightBarButtonItem = btn;

    }

    func setUpSubScribedData(){
        
        SVProgressHUD.showWithMaskType(.Black)
        
        let parameter = ["a":"tags_list","c":"subscribe"]
        
        Alamofire.request(.GET, URLString:"http://api.budejie.com/api/api_open.php", parameters: parameter).responseJSON { (request, response,  data, error) -> Void in
            
            if((data) != nil){
                SVProgressHUD.dismiss()
                
                print(data)
                 if let data = data as? [String: AnyObject] {
                    
                    if let refArr = data["rec_tags"] {
                       self.refSubTag = WMSubscribedTag.SubscribedTagResults(refArr as! [[String : AnyObject]])
                    
                    }
                    if let defArr = data["def_tags"]{
                        self.defSubTag = WMSubscribedTag.SubscribedTagResults(defArr as! [[String : AnyObject]])
                    }
                    self.tableView.reloadData()
                    
                }
                
            }else{
                dispatch_async(dispatch_get_main_queue()) {
                    SVProgressHUD.showErrorWithStatus("获取数据失败")
                }
            }
            
        }
    }
   
    
    func pushTagUser(){
        
        performSegueWithIdentifier("refUserSb", sender: nil)
       
    }
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = section==0 ? self.refSubTag.count : self.defSubTag.count
        return count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let subTag = indexPath.section == 0 ?self.refSubTag[indexPath.row] :self.defSubTag[indexPath.row]
        
       let state = (indexPath.section == 0) ? "ref" : "def"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(state) as! WMSubscribedCell
        cell.subscribed =  subTag;
        
        return cell
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, 30))
        view.backgroundColor = UIColor.clearColor()
  
        let btn = SubscribedBtn(frame: CGRectMake(10, 0, UIScreen.mainScreen().bounds.width-20, 30))
        btn.setTitle("推荐标签", forState: UIControlState.Normal)
        btn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btn.titleLabel?.font = UIFont.systemFontOfSize(13)
        btn.backgroundColor = UIColor.whiteColor()
        btn.setImage(UIImage(named: "accessory"), forState: UIControlState.Normal)
       
        btn.addTarget(self, action: Selector("pushTagUser"), forControlEvents: .TouchUpInside)

        let label = UILabel(frame: CGRectMake(10, 0, UIScreen.mainScreen().bounds.width-20, 30))
        label.backgroundColor = UIColor.whiteColor()
        label.text = "已订阅标签--根据标签推荐你喜欢的内容"
        label.font = UIFont.systemFontOfSize(13)
        section == 0 ? view.addSubview(btn) :view.addSubview(label)
        
        return view
    }
    
   
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

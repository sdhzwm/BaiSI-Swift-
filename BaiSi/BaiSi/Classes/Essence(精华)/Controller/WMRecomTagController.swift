//
//  WMRecomTagController.swift
//  BaiSi
//
//  Created by 王蒙 on 15/7/25.
//  Copyright © 2015年 wm. All rights reserved.
//

import UIKit
import Alamofire
import SVProgressHUD
class WMRecomTagController: UITableViewController {
    
     var refSubTag = [WMSubscribedTag]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.LobalBg()
        self.title = "推荐标签"
        self.setUpSubScribedData()
        self.tableView.rowHeight = 70

    }
    func setUpSubScribedData(){
        
        SVProgressHUD.showWithMaskType(.Black)
        

        let parameter = ["a":"tag_recommend","action":"sub","c":"topic"]
        
        Alamofire.request(.GET, URLString:"http://api.budejie.com/api/api_open.php", parameters: parameter).responseJSON { (request, response,  data, error) -> Void in
             
                if((data) != nil){
                SVProgressHUD.dismiss()
                    print(data)

               if let date = data as? [[String: AnyObject]] {
                
                    self.refSubTag = WMSubscribedTag.SubscribedTagResults(date)
                    
                    self.tableView.reloadData()
                    
                }
                
            }else{
                dispatch_async(dispatch_get_main_queue()) {
                    SVProgressHUD.showErrorWithStatus("获取数据失败")
                }
            }
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source



    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.refSubTag.count
    }

   
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let subTag = self.refSubTag[indexPath.row]
        
        let state = "refUser"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(state) as! WMSubscribedCell
        cell.subscribed =  subTag;
        
        return cell
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

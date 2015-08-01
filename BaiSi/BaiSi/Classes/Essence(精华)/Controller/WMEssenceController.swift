//
//  WMEssenceController.swift
//  BaiSi
//
//  Created by 王蒙 on 15/7/22.
//  Copyright © 2015年 wm. All rights reserved.
//

import UIKit


class WMEssenceController: UIViewController {
    var titleView = UIView()
    var indicateView = UIView()
    var selledBtn = UIButton()
    var conterView = UIScrollView()
    override func viewDidLoad() {
        super.viewDidLoad()
        //设置导航条
        self.setNav()
        //设置子控件
        self.setUpChildViewController()
        //设置标签条、
        self.setTitleView()
        //设置ScrollView
        self.setUpScrollView()

    }
  @objc private func onClick(){
       performSegueWithIdentifier("subScribed", sender: nil)
    }
   
}

//用来添加子控制器及ScrollView
extension WMEssenceController{
   
    //设置导航条
    private func setNav(){
        
        self.navigationItem.titleView = UIImageView(image: UIImage(named: "MainTitle" ))
        
        let item = UIBarButtonItem.itemWith(self, action: "onClick", nimage: UIImage(named: "MainTagSubIcon"), himage: UIImage(named: "MainTagSubIconClick"))
        self.navigationItem.leftBarButtonItem = item
        
    }
    //添加子控制器
   private func setUpChildViewController(){
        
        let item1 = WMWordController()
        item1.title = "段子"
        let item2 = WMWordController()
        item2.title = "全部"
        let item3 = WMWordController()
        item3.title = "视频"
        let item4 = WMWordController()
        item4.title = "声音"
        let item5 = WMWordController()
        item5.title = "图片"
        
        self.addChildViewController(item1)
        self.addChildViewController(item2)
        self.addChildViewController(item3)
        self.addChildViewController(item4)
        self.addChildViewController(item5)
        
    }
    //添加ScrollView
   private func setUpScrollView(){
        self.automaticallyAdjustsScrollViewInsets = false
        let scrollView = UIScrollView()
        scrollView.frame = self.view.bounds
        scrollView.delegate = self
        scrollView.pagingEnabled = true
        scrollView.contentSize = CGSizeMake(scrollView.frame.width*CGFloat(self.childViewControllers.count), 0)
        self.conterView = scrollView
        self.view.insertSubview(scrollView, atIndex: 0)
        scrollView.backgroundColor = UIColor.RandomColor()
        self.scrollViewDidEndScrollingAnimation(scrollView)
    }
    
}
//ScrollView的代理方法
extension WMEssenceController:UIScrollViewDelegate{
    //动画结束的时候执行
    func scrollViewDidEndScrollingAnimation(scrollView: UIScrollView) {
        let atIndex = scrollView.contentOffset.x / CGFloat(scrollView.frame.size.width)
        
        let vc = self.childViewControllers[Int(atIndex)]
        vc.view.frame.origin.x = scrollView.contentOffset.x
        vc.view.frame.origin.y = 0
        vc.view.frame.size.height = scrollView.frame.height
        scrollView.addSubview(vc.view)
        
    }
    //动画结束的那一刻执行的方法
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        self.scrollViewDidEndScrollingAnimation(scrollView)
        //得出是哪一个下标下的ScrollView
        let atIndex = scrollView.contentOffset.x / CGFloat(scrollView.frame.size.width)
        self.onClickTitle(self.titleView.subviews[Int(atIndex)] as! UIButton)
    }
    
}


//用来加载标签条，及标签条子控件
extension WMEssenceController{
   
     //设置标签条、
  private  func setTitleView(){
        let titleView = UIView()
     
        var frame  = titleView.frame
        frame.size.width = self.view.frame.width
        frame.size.height = titleViewH
        frame.origin.y = navH
        titleView.frame = frame
        titleView.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.85)
        self.view.addSubview(titleView)
        self.titleView = titleView
        self.setIndicateView()
        //设置里面的按钮
        self.setTitleViewSubBtn()
        self.titleView.addSubview(self.indicateView)
    }
     //设置标签条、
    private func setTitleViewSubBtn(){
       
        let btnW = self.titleView.frame.width / CGFloat(self.childViewControllers.count)
        let btnH = self.titleView.frame.height
        for(var i = 0; i < self.childViewControllers.count; i++){
            
            let btn = UIButton(type: .Custom)
            var frame = btn.frame
            frame.size.height = btnH
            frame.size.width = btnW
            frame.origin.x = CGFloat(i) * btnW
            btn.frame = frame
            
            btn.tag = i
            let vc:UIViewController = self.childViewControllers[i]
            btn.setTitle("\(vc.title!)", forState: .Normal)
            btn.setTitle("\(vc.title!)", forState: .Selected)
            btn.setTitleColor(UIColor.grayColor(), forState: .Normal)
            btn.setTitleColor(UIColor.redColor(), forState: .Disabled)
            btn.titleLabel?.font = UIFont.systemFontOfSize(14)
            btn.addTarget(self, action: "onClickTitle:", forControlEvents: UIControlEvents.TouchUpInside)
            
            if i==0 {
                self.selledBtn = btn
                btn.enabled = false
                btn.titleLabel?.sizeToFit()
                
                self.indicateView.frame.size.width = (btn.titleLabel?.frame.size.width)!
                self.indicateView.center.x = btn.center.x
               
            }
            
            self.titleView.addSubview(btn)
        }
    }
    
    //设置按钮下面的指示图层
     private func setIndicateView(){
        let indicateView = UIView()
        indicateView.backgroundColor = UIColor.redColor()
        indicateView.frame.size.height = 2
        indicateView.frame.origin.y = self.titleView.frame.size.height - indicateView.frame.size.height
        self.indicateView = indicateView
    }
    //按钮的点击事件
    @objc private  func onClickTitle(btn:UIButton){
        
        self.selledBtn.enabled = true
        btn.enabled = false
        self.selledBtn = btn
        UIView.animateWithDuration(0.25) { () -> Void in
            self.indicateView.center.x = btn.center.x
      
        self.conterView.contentOffset.x = CGFloat(btn.tag) * self.conterView.frame.width
        self.scrollViewDidEndScrollingAnimation(self.conterView)
         }  
    }

}



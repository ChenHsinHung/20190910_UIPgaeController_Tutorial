//
//  ViewController.swift
//  20190910_UIPgaeController_Tutorial
//
//  Created by chen hsin hung on 2019/9/10.
//  Copyright © 2019 chen hsin hung. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var scrw_scrollView: UIScrollView!
    
    var images : [String]  = ["a1","a2","a3","a4"]
//    var frame = CGRect(x: 0, y: 0, width: 0, height: 0)

    var frame = CGRect.zero
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        pageController.numberOfPages = images.count
        
        for idx  in  0..<images.count {
            frame.origin.x = scrw_scrollView.frame.width * CGFloat(idx)  //  取得每一頁的 X點
            frame.size = scrw_scrollView.frame.size     //設定大小
            
            let imgView = UIImageView(frame:  frame)   // 產生指定大小的框
            
            imgView.image = UIImage(named: images[idx])
            
            self.scrw_scrollView.addSubview(imgView)
        }
        
        scrw_scrollView.contentSize = CGSize(width: scrw_scrollView.frame.width * CGFloat(images.count), height: scrw_scrollView.frame.height)
        
        scrw_scrollView.delegate = self
       
        pageController.addTarget(self, action: #selector(pageChanged(_:)), for: UIControl.Event.valueChanged)
        
    }
    
    //点击页控件时事件处理
    @objc func pageChanged(_ sender:UIPageControl) {
        //根据点击的页数，计算scrollView需要显示的偏移量
        var frame = scrw_scrollView.frame      //取得 scrollview Frame
        frame.origin.x = frame.size.width * CGFloat(sender.currentPage)  //計算最近新的 X 軸
        frame.origin.y = 0
       
        scrw_scrollView.scrollRectToVisible(frame, animated:true) //展现当前页面内容
        
    }
    
    

    // scroll view Method
    //=================================
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = scrollView.contentOffset.x / scrollView.frame.size.width
        pageController.currentPage = Int(pageNumber)
       
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {

    }

}


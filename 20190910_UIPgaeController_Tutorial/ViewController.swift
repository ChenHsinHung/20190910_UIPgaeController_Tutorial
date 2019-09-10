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
    @IBOutlet weak var scrollerView: UIScrollView!
    
    var images : [String]  = ["a1","a2","a3","a4"]
    var frame = CGRect(x: 0, y: 0, width: 0, height: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        pageController.numberOfPages = images.count
        
        for idx  in  0..<images.count {
            frame.origin.x = scrollerView.frame.width * CGFloat(idx)
            frame.size = scrollerView.frame.size
            
            let imgView = UIImageView(frame: frame)
            imgView.image = UIImage(named: images[idx])
            
            self.scrollerView.addSubview(imgView)
        }
        
        scrollerView.contentSize = CGSize(width: scrollerView.frame.width * CGFloat(images.count), height: scrollerView.frame.height)
        
        scrollerView.delegate = self
       
        pageController.addTarget(self, action: #selector(pageChanged(_:)), for: UIControl.Event.valueChanged)
        
    }
    
    //点击页控件时事件处理
    @objc func pageChanged(_ sender:UIPageControl) {
        //根据点击的页数，计算scrollView需要显示的偏移量
        var frame = scrollerView.frame
        frame.origin.x = frame.size.width * CGFloat(sender.currentPage)
        frame.origin.y = 0
        //展现当前页面内容
        scrollerView.scrollRectToVisible(frame, animated:true)
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


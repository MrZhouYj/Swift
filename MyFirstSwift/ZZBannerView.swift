//
//  ZZBannerView.swift
//  MyFirstSwift
//
//  Created by 周永建 on 16/7/28.
//  Copyright © 2016年 xinde. All rights reserved.
//

import UIKit

//let RandColor = UIColor.init(red:CGFloat(arc4random()%255/255), green: CGFloat(arc4random()%255/255), blue: CGFloat(arc4random()%255/255), alpha: 0.99)

class ZZBannerView: UIView,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIScrollViewDelegate{
    
    enum ZZBannerViewScrollDirection {
        case GGBannerViewScrollDirectionVertical
        case GGBannerViewScrollDirectionHorizontal
    }
    
     var imagesArray:NSArray?
    
     var oldOffsetLength:CGFloat=0
    
     var timer:NSTimer?
    
    var interval:NSTimeInterval{
        
        set{
            
            
            
            addTimer()
            
        }
        
        get{
            
            return self.interval
        }
    }
    
    private func addTimer(){
        
        if self.interval==0 {
            
            return
        }
        
        self.timer = NSTimer.scheduledTimerWithTimeInterval(self.interval, target: self, selector: #selector(changePage), userInfo: nil, repeats: true)
        
        NSRunLoop.currentRunLoop().addTimer(self.timer!, forMode: NSRunLoopCommonModes)
    }
    
    func changePage(){
        
        let offset:CGFloat = collectionView.contentOffset.x
        
        var newOffset:CGFloat = offset+MainScreenWidth
        
        if newOffset == offset-MainScreenWidth {
            
            newOffset+=1
        }
        
        collectionView.setContentOffset(CGPointMake(newOffset, 0), animated: false)
        
    }
    
     lazy var pageController:UIPageControl = {
       
        let page = UIPageControl.init()
        
        page.currentPage=0
        
        page.translatesAutoresizingMaskIntoConstraints=false
        
        page.currentPageIndicatorTintColor=UIColor.redColor()
        
        page.pageIndicatorTintColor=UIColor.greenColor()
       
        
        return page
        
    }()
    
   
    
    lazy var flowLayout:UICollectionViewFlowLayout = {
    
        let layout = UICollectionViewFlowLayout.init()
        
        layout.scrollDirection=UICollectionViewScrollDirection.Horizontal
        
        layout.minimumLineSpacing = 0
        
        layout.minimumInteritemSpacing = 0
        
        layout.itemSize=CGSizeMake(MainScreenWidth, MainScreenWidth*0.52)
        
        return layout
        
    }()
    
    
    lazy var collectionView:UICollectionView = {
        
       let coll = UICollectionView.init(frame: self.bounds, collectionViewLayout: self.flowLayout)
        
          coll.delegate=self
          coll.dataSource=self
          coll.pagingEnabled=true
          coll.backgroundColor = UIColor.whiteColor()
          coll.translatesAutoresizingMaskIntoConstraints=false
          coll.showsVerticalScrollIndicator=false
          coll.showsHorizontalScrollIndicator=false
          coll.registerClass(ZZBannerCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        return coll
        
    }()
    
    
    

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initSubViews()
    }
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
       initSubViews()
    }
    
    
    
    func initSubViews() {
        
        self.imagesArray=NSArray()
    
        self.addSubview(self.collectionView)
        
        self.addSubview(self.pageController)
        
        
        
        
        self.addConstraint(NSLayoutConstraint.init(item: collectionView, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Left, multiplier: 1.0, constant: 0))
         self.addConstraint(NSLayoutConstraint.init(item: collectionView, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: 0))
         self.addConstraint(NSLayoutConstraint.init(item: collectionView, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 0))
         self.addConstraint(NSLayoutConstraint.init(item: collectionView, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant: 0))
        
        self.addConstraint(NSLayoutConstraint.init(item: pageController, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant: 0))
        self.addConstraint(NSLayoutConstraint.init(item: pageController, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: -10))
        self.addConstraint(NSLayoutConstraint.init(item: pageController, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Width, multiplier: 1.0, constant: 0))

        
     
        self.interval=1
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return (self.imagesArray?.count)!+1
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell:ZZBannerCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! ZZBannerCollectionViewCell
        
        
   
        cell.setImageWithUrl(getImageUrlWith(indexPath))
        
        
        return cell
    }
    
    func getImageUrlWith(indexPath:NSIndexPath) -> String{
        
        if self.imagesArray?.count==0 {
            
            return ""
        }
        
        if self.imagesArray?.count==indexPath.row {
            
            return self.imagesArray?.firstObject as! String
        }else{
            
            return self.imagesArray![indexPath.row] as! String
        }
    }
    
    func configBanner(imageArr:NSArray) {
        
        self.imagesArray=imageArr
        
        pageController.numberOfPages = self.imagesArray!.count
        
        self.collectionView.reloadData()
    }
    
    
    
   
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
  
        let offset:CGFloat = collectionView.contentOffset.x
        
        let collect:UICollectionView = scrollView as! UICollectionView
        
        
        if self.oldOffsetLength>offset {

            if offset<0 {
                
                collectionView.scrollToItemAtIndexPath(NSIndexPath.init(forRow: imagesArray!.count, inSection: 0), atScrollPosition: UICollectionViewScrollPosition.None, animated: false)
            }
           
        }else{
            
            if offset>MainScreenWidth*CGFloat((imagesArray?.count)!) {

                collect.scrollToItemAtIndexPath(NSIndexPath.init(forRow: 0, inSection: 0), atScrollPosition: UICollectionViewScrollPosition.None, animated: false)
            }
        }

        pageController.currentPage = Int(offset/MainScreenWidth)

        self.oldOffsetLength = offset
        
    }
    
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        
        self.timer?.invalidate()
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        
        pageController.currentPage = Int(collectionView.contentOffset.x/MainScreenWidth)
  
        addTimer()
    }
    
}

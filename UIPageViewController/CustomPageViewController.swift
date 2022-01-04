//
//  CustomPageViewController.swift
//  UIPageViewController
//
//  Created by Htet Moe Phyu on 04/01/2022.
//

import UIKit

protocol CustomPageViewControllerDeligate : AnyObject{
    func numberOfPages(numberOfPage : Int)
    func pageChangeTo(index : Int)
}

class CustomPageViewController: UIPageViewController {

    var individualPageVCList = [UIViewController]()
    var customDeligate : CustomPageViewControllerDeligate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.delegate   = self
        self.dataSource = self
        
        individualPageVCList = [
            PageDetailViewController.getInstance(index: 0),
            PageDetailViewController.getInstance(index: 1),
            PageDetailViewController.getInstance(index: 2)]
        customDeligate?.numberOfPages(numberOfPage : individualPageVCList.count)
        
        setViewControllers([individualPageVCList[0]], direction: .forward, animated: true, completion: nil)
    }
}

extension CustomPageViewController : UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
       
        let indexOfCurrentPageVC = individualPageVCList.firstIndex(of: viewController)!
        if indexOfCurrentPageVC == 0{
            return nil
        }
        else{
            return individualPageVCList[indexOfCurrentPageVC - 1]
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        let currentIndexOfPageVCList = individualPageVCList.firstIndex(of: viewController)!
        if currentIndexOfPageVCList == individualPageVCList.count - 1 {
            return nil
        }
        else{
            return individualPageVCList[currentIndexOfPageVCList + 1]
        }
    }
    
    
}

extension CustomPageViewController : UIPageViewControllerDelegate {
//    func presentationCount(for pageViewController: UIPageViewController) -> Int {
//        return 3
//    }
//
//    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
//        return 0
//    }
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if let currentIndexPageVC = pageViewController.viewControllers?.first as? PageDetailViewController {
            
            let index = individualPageVCList.firstIndex(of: currentIndexPageVC)!
            customDeligate?.pageChangeTo(index: index)
        }
    }
}

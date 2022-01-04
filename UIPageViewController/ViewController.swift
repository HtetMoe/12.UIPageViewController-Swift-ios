//
//  ViewController.swift
//  UIPageViewController
//  https://www.youtube.com/watch?v=OwfhvUSIzuU
//  Created by Htet Moe Phyu on 04/01/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pageControl: UIPageControl!
    var customPageVC : CustomPageViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? CustomPageViewController {
            customPageVC                = destinationVC
            customPageVC.customDeligate = self
        }
    }
}

extension ViewController : CustomPageViewControllerDeligate {
    func numberOfPages(numberOfPage: Int) {
        pageControl.numberOfPages = numberOfPage
    }
    
    func pageChangeTo(index : Int) {
        pageControl.currentPage = index
    }
    
    
}


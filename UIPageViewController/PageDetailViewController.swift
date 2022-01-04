//
//  PageDetailViewController.swift
//  UIPageViewController
//
//  Created by Htet Moe Phyu on 04/01/2022.
//

import UIKit

class PageDetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    var index : Int = 0
    var titleList = ["Page 1","Page 2","Page 3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        titleLabel.text = titleList[index]
    }
    
    static func getInstance(index : Int) -> PageDetailViewController{
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PageDetailViewController") as! PageDetailViewController
        
        vc.index = index
        return vc
    }
}

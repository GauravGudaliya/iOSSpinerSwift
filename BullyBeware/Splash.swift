//
//  ViewController.swift
//  BullyBeware
//
//  Created by Gaurav on 7/18/16.
//  Copyright © 2016 Gaurav. All rights reserved.
//

import UIKit

class Splash: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let vc=self.storyboard?.instantiateViewControllerWithIdentifier("Login") as? Login;
        self.navigationController?.pushViewController(vc!, animated: true);
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidAppear(animated: Bool)
    {
        
//        if(NSUserDefaults.standardUserDefaults().objectForKey("isFirst") as? String == "1")
//        {
//            let vc=self.storyboard?.instantiateViewControllerWithIdentifier("SWRevealViewController") as? SWRevealViewController;
//            self.navigationController?.pushViewController(vc!, animated: false);
//        }
//        else
//        {
//            let vc=self.storyboard?.instantiateViewControllerWithIdentifier("Login") as? Login;
//            self.navigationController?.pushViewController(vc!, animated: true);
//        }
    }
}


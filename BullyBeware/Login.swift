//
//  Login.swift
//  BullyBeware
//
//  Created by Gaurav on 7/18/16.
//  Copyright © 2016 Gaurav. All rights reserved.
//

import UIKit

class Login: UIViewController,UIGestureRecognizerDelegate {

    @IBOutlet var txtPassword: UITextField!
    @IBOutlet var txtEmail: UITextField!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        txtEmail.attributedPlaceholder = NSAttributedString(string:"Username",attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        txtPassword.attributedPlaceholder = NSAttributedString(string:"Password",attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(animated: Bool) {
        self.navigationController?.interactivePopGestureRecognizer?.enabled = false
        self.navigationController?.interactivePopGestureRecognizer!.delegate = self
    }
    override func viewWillAppear(animated: Bool) {
       

    }
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func btnSignInAction(sender: UIButton)
    {
        
    }
    @IBAction func btnSignFacebook(sender: UIButton)
    {
        
    }
    @IBAction func btnSignGoogle(sender: UIButton)
    {
        
    }
    @IBAction func btnSignUpAction(sender: UIButton)
    {
        let vc = self.storyboard?.instantiateViewControllerWithIdentifier("Register")as! Register
        self.navigationController?.pushViewController(vc , animated: true)
    }
}

//
//  Register.swift
//  BullyBeware
//
//  Created by Gaurav on 7/19/16.
//  Copyright © 2016 Gaurav. All rights reserved.
//

import UIKit

class Register: UIViewController,UITableViewDelegate,UITableViewDataSource,UIGestureRecognizerDelegate
{
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var txtFristName: UITextField!
    @IBOutlet weak var txtLastNAme: UITextField!
    @IBOutlet weak var txtEmailAddress: UITextField!
    @IBOutlet weak var txtSchool: UITextField!
    @IBOutlet weak var txtSchoolEmail: UITextField!
    @IBOutlet weak var txtSchoolEmailConfom: UITextField!

    @IBOutlet weak var btnState: UIButton!
    @IBOutlet weak var btnCity: UIButton!
    @IBOutlet weak var btnEmrgancy: UIButton!
    @IBOutlet weak var btnSecurityQus: UIButton!
    @IBOutlet weak var btnSubmit: UIButton!
    
    var table: UITableView  =   UITableView()
    var viewBack:UIView = UIView()
    var arrState:NSArray = NSArray()
    var arrCity:NSArray = NSArray()
    var arrEmergContact:NSArray = NSArray()
    var arrSecuriQus:NSArray = NSArray()
    var arrSecuriAns:NSArray = NSArray()
    
    
    var arrDrower:NSArray = NSArray()
    var btnDefult:UIButton = UIButton()
    override func viewDidLoad()
    {
        super.viewDidLoad()

        self.navigationController?.interactivePopGestureRecognizer?.enabled = true
        self.navigationController?.interactivePopGestureRecognizer!.delegate = self
        
        txtFristName.attributedPlaceholder = NSAttributedString(string:"Student First Name",attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        txtLastNAme.attributedPlaceholder = NSAttributedString(string:"Student Last Name",attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        txtEmailAddress.attributedPlaceholder = NSAttributedString(string:"Email Address",attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        txtSchool.attributedPlaceholder = NSAttributedString(string:"School",attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        txtSchoolEmail.attributedPlaceholder = NSAttributedString(string:"School Officials Email Address",attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        txtSchoolEmailConfom.attributedPlaceholder = NSAttributedString(string:"Confirm School Officials Email Address",attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        
        scrollView.contentSize = CGSizeMake(scrollView.frame.width, btnSubmit.frame.origin.y + btnSubmit.frame.height+20 )
        arrState = ["Gujarat","Karnataka","Maharashtra","Andhra Pradesh","West Bengal","Punjab","Haryana","Jharkhand","Chandigarh"]
        arrCity = ["Ahmedabad","Mumbai","Hyderabad","Kolkata","Lucknow","Delhi","Pune","Kanpur","Bhopal"]
        arrEmergContact = ["9898986565","1234567890","0321654987","0147852369","3698521470","3698521470","1236547890","9876543210","3214569870"]
        arrSecuriQus = ["What is your pet’s name?","In what year was your father born?","What is your favorite _____?","What time of the day were you born? (hh:mm)","What is your favorite movie?","What is your favorite team?","What was your favorite food as a child?","In what town was your first job?","Who is your childhood sports hero?"]
        arrSecuriAns = ["Blue","The third one","I work at home","Seriously","12/08/2016","Movie","iOS Developer","Saktiman","Apple"]

        // Do any additional setup after loading the view.
    }
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    @IBAction func btnStateAction(sender: UIButton)
    {
        btnDefult = sender
        arrDrower = arrState
        table.reloadData()
        setupSpiner(scrollView,btnClick: sender)
    }
    @IBAction func btnCityAction(sender: UIButton)
    {
         btnDefult = sender
        arrDrower = arrCity
        table.reloadData()
        setupSpiner(scrollView,btnClick: sender)
    }
    @IBAction func btnEmargancyAction(sender: UIButton)
    {
         btnDefult = sender
        arrDrower = arrEmergContact
        table.reloadData()
        setupSpiner(scrollView,btnClick: sender)
    }
    @IBAction func btnSecurityAction(sender: UIButton)
    {
         btnDefult = sender
        arrDrower = arrSecuriQus
        table.reloadData()
        setupSpiner(scrollView,btnClick: sender)
    }
    @IBAction func btnSecuriAnsAction(sender: UIButton)
    {
        btnDefult = sender
        arrDrower = arrSecuriAns
        table.reloadData()
        setupSpiner(scrollView,btnClick: sender)
    }
    @IBAction func btnBackAction(sender: UIButton)
    {
        self.navigationController?.popViewControllerAnimated(true)
    }
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    func setupSpiner(view:UIScrollView,btnClick:UIButton)
    {
        viewBack.frame = view.frame
        viewBack.alpha = 0.5
        let frame:CGRect = btnClick.convertRect(btnClick.frame, toView: scrollView)
        self.table.frame  =   CGRectMake(frame.origin.x - btnClick.frame.origin.x ,frame.origin.y+frame.height,frame.width,0);
        UIView.animateWithDuration(0.1) {
            if(frame.origin.y > self.view.frame.height - self.view.frame.height/2.5)
            {
                if((view.frame.height - (frame.origin.y+frame.height)) < (frame.height * CGFloat( self.arrDrower.count)))
                {
                    self.table.frame  =   CGRectMake(frame.origin.x - btnClick.frame.origin.x,(frame.origin.y+frame.height) - (frame.height * CGFloat( self.arrDrower.count)), frame.width,(frame.height * CGFloat( self.arrDrower.count)));
                }
                else
                {
                    self.table.frame  =   CGRectMake(frame.origin.x - btnClick.frame.origin.x,(frame.origin.y+frame.height)-(frame.height * CGFloat( self.arrDrower.count)), frame.width,(frame.height * CGFloat( self.arrDrower.count)));
                }

            }
            else
            {
                if((view.frame.height - (frame.origin.y+frame.height)) < (frame.height * CGFloat( self.arrDrower.count)))
                {
                    self.table.frame  =   CGRectMake(frame.origin.x - btnClick.frame.origin.x,frame.origin.y+frame.height, frame.width,view.frame.height-(frame.origin.y+frame.height));
                }
                else
                {
                    self.table.frame  =   CGRectMake(frame.origin.x - btnClick.frame.origin.x,frame.origin.y+frame.height, frame.width,(frame.height * CGFloat( self.arrDrower.count)));
                }
            }
        }
        
        table.bounces=false
        table.showsVerticalScrollIndicator=false
        table.showsHorizontalScrollIndicator=false
        table.backgroundColor=UIColor.clearColor()
        table.separatorStyle = .None
        table.layer.cornerRadius=10
        table.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.table.delegate      =   self
        self.table.dataSource    =   self
       view.addSubview(viewBack)
       // view.insertSubview(viewBack, belowSubview: table)
        view.addSubview(table)
        btnClick.addTarget(self, action: #selector(Register.btnOpenSpiner), forControlEvents: UIControlEvents.TouchUpInside);
    }
    func btnOpenSpiner()
    {
        if(table.hidden==true)
        {
            table.hidden=false
            viewBack.hidden = false
            scrollView.scrollEnabled = false
        }
        else
        {
            table.hidden=true
            viewBack.hidden = true
            scrollView.scrollEnabled = false
        }
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.arrDrower.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        cell.backgroundColor=UIColor.whiteColor()
        cell.textLabel?.font = btnDefult.titleLabel?.font
        cell.textLabel?.text = arrDrower.objectAtIndex(indexPath.row) as? String
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        return btnDefult.frame.height
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        btnDefult.setTitle("\(arrDrower.objectAtIndex(indexPath.row))", forState: UIControlState.Normal)
        table.hidden=true
        viewBack.hidden = true
         scrollView.scrollEnabled = true
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?)
    {
        table.hidden=true
        viewBack.hidden = true
         scrollView.scrollEnabled = true
    }
}

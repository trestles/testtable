//
//  ViewController.swift
//  testtable
//
//  Created by jonathan twaddell on 7/4/15.
//  Copyright (c) 2015 Trestles. All rights reserved.
//

import UIKit

/*
class Item{
  var header:String!
  var detail:String!
  var price:String!
}
*/

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

  @IBOutlet var mainTV: UITableView!
  var dataItems = [EKMenuItem]()
  var selectedMenuItem:EKMenuItem!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.mainTV.dataSource=self
    self.mainTV.delegate=self
    self.mainTV.rowHeight = UITableViewAutomaticDimension
    self.mainTV.estimatedRowHeight = 84.0
    //self.mainTV.registerClass(MyTableViewCell.self, forCellReuseIdentifier: "MyCustomCell")
    
    
    var tmps = [String]()

    tmps.append("ABC But here is an artist. He desires to paint you the dreamiest, shadiest, quietest, most enchanting bit of romantic landscape in all the valley of the Saco. What is the chief element he employs?")
    tmps.append("DEF But here is an artist.")
    tmps.append("GHI But here is an artist. He desires to paint you the dreamiest, shadiest, quietest, most enchanting bit")
    
    for var i=0; i<10; i++
    {
      var menuItem=EKMenuItem()
      let randomIndex1 = Int(arc4random_uniform(UInt32(tmps.count)))
      menuItem.header = "\(i) \(tmps[randomIndex1])"

      let randomIndex2 = Int(arc4random_uniform(UInt32(tmps.count)))
      menuItem.detail = "\(i) \(tmps[randomIndex2])"
      let randomIndex3 = Int(arc4random_uniform(UInt32(tmps.count)))
      menuItem.price = "\(i) \(tmps[randomIndex3])"
      //tmpItem.price = "my price"
      dataItems.append(menuItem)
    }

    self.view.backgroundColor = UIColor.greenColor()
    
    self.mainTV.reloadData()
    // Do any additional setup after loading the view, typically from a nib.
  }

  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    println("here is count: \(dataItems.count)")
    return dataItems.count
  }
  
  /*
  func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    return 120
  }
  */
  
//  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCellWithIdentifier("MyCustomCell") as! MyTableViewCell
      //cell.headerLabel.text=dataItems[indexPath.row].header
    cell.setHeader(dataItems[indexPath.row].header)
    cell.setDetail(dataItems[indexPath.row].detail)
    cell.setPrice(dataItems[indexPath.row].price)
    return cell
  }
  
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    println("you clicked this!!! with \(dataItems[indexPath.row].header)")
    self.selectedMenuItem = dataItems[indexPath.row]
    self.performSegueWithIdentifier("MenuItemDetail", sender: self)
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if (segue.identifier == "MenuItemDetail") {
      var svc = segue.destinationViewController as! MenuItemDetailViewController
      println("in prepareForSegue")
      svc.menuItem = self.selectedMenuItem
    }
  }

  override func viewDidLayoutSubviews() {
     super.viewDidLayoutSubviews()
     println("this was called")
  }
  
/*
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
*/

}


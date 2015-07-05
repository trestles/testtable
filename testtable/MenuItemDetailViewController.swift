//
//  MenuItemDetailViewController.swift
//  testtable
//
//  Created by jonathan twaddell on 7/4/15.
//  Copyright (c) 2015 Trestles. All rights reserved.
//

import UIKit



class MenuItemDetailViewController: UIViewController {
  @IBOutlet weak var tastingNoteBGConstraint: NSLayoutConstraint!

  @IBOutlet weak var tastingNoteBG: UIView!
  @IBOutlet weak var arrowBtn: UIButton!

  var menuItem:EKMenuItem!
  
  var tastingNoteExpanded = false
  let upImage=UIImage(named:"arrow-up")
  let downImage=UIImage(named:"arrow-down")
  
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
      println("here is the header: \(self.menuItem.header)")
      
      self.tastingNoteBG.alpha = 0.3
      self.arrowBtn.setImage(upImage, forState: .Normal)
      
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  @IBAction func toggleTastingNotes() {
    println("here i am")
    
    var newConstantValue = 0.0
    
    if tastingNoteExpanded {
      newConstantValue = 380.0
    }else{
      newConstantValue = 100.0
    }
    
    UIView.animateWithDuration(0.50, animations: {
      self.tastingNoteBGConstraint.constant = CGFloat(newConstantValue)
      self.tastingNoteExpanded = !self.tastingNoteExpanded


      
      if(self.tastingNoteExpanded){
        self.arrowBtn.setImage(self.downImage, forState: .Normal)
      }else{
        self.arrowBtn.setImage(self.upImage, forState: .Normal)
      }
      self.view.layoutIfNeeded()
    });
  }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

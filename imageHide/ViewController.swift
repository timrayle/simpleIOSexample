//
//  ViewController.swift
//  imageHide
//
//  Created by Tim Rayle on 7/6/15.
//  Copyright (c) 2015 CodeVana. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    // This is a connection to the UIImage created in the storyboard
    @IBOutlet weak var displayedImage: UIImageView!
    
    // This is the button that shows or hides the photo
    @IBOutlet weak var showHideButton: UIButton!
    
    // This is the text field for entering the URL of a new image
    @IBOutlet weak var newImageField: UITextField!
    
    // This method is called when the user is done entering the URL of an image
    @IBAction func addNewPicture(sender: AnyObject, forEvent event: UIEvent) {
        if let url = NSURL(string: newImageField.text) {
            if let data = NSData(contentsOfURL: url){
                let newImage = UIImage(data: data)
                displayedImage.image = newImage
            }
        }    }
    
    // This is called when the button is clicked and makes the kayak image appear and disappear
    @IBAction func toggleImageVisibility(sender: AnyObject) {
        // toggle whether or not the image is hidden
        displayedImage.hidden = !displayedImage.hidden
        
        // change the text of the button
        if displayedImage.hidden {
            showHideButton.setTitle("Show photo", forState: .Normal)
        }
        else {
            showHideButton.setTitle("Hide photo", forState: .Normal)
        }
    }
    
    // this just makes the keyboard go away when the user hits enter
    // after inputting a URL
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


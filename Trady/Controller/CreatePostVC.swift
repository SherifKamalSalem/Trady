//
//  CreatePostVC.swift
//  Trady
//
//  Created by Sherif Kamal on 11/1/18.
//  Copyright © 2018 Sherif Kamal. All rights reserved.
//

import UIKit
import Firebase

class CreatePostVC: UIViewController {
    
    @IBOutlet weak var profileImg: CircularImage!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var postTxtView: UITextView!
    @IBOutlet weak var sendBtn: RoundedButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postTxtView.delegate = self
    }
    
    @IBAction func sendBtnPressed(_ sender: Any) {
        if postTxtView.text != nil && postTxtView.text != "Say something here..." {
            sendBtn.isEnabled = false
            DataService.instance.uploadPost(withMessage: postTxtView.text, forUID: (Auth.auth().currentUser?.uid)!, withGroupKey: nil) { (isComplete) in
                if isComplete {
                    self.sendBtn.isEnabled = true
                    self.dismiss(animated: true, completion: nil)
                } else {
                    self.sendBtn.isEnabled = true
                    print("There was an error!")
                }
            }
        }
    }
    
    @IBAction func closeBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension CreatePostVC: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        postTxtView.text = ""
    }
}

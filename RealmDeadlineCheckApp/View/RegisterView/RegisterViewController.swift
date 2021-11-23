//
//  RegisterViewController.swift
//  RealmDeadlineCheckApp
//
//  Created by UrataHiroki on 2021/10/29.
//

import UIKit

class RegisterViewController: UIViewController {

    
    @IBOutlet weak var registerProductNameTextField: UITextField!
    @IBOutlet weak var janTextField: UITextField!
    @IBOutlet weak var deadlineDayTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    
    private let realmCRUDModel = RealmCRUDModel()
    private let viewDesigns = ViewDesigns()
    
    private var judgeChangeViewPointYBool = true
    
    var hasSetPointOrigin = false
    var pointOrigin: CGPoint?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGestureRecognizerAction))
        view.addGestureRecognizer(panGesture)
        
        NotificationCenter.default.addObserver(self, selector: #selector(upViewPointY), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(downViewPointY), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        let keyboardHideGesture = UITapGestureRecognizer(target: self, action: #selector(keyboardHidden))
        view.addGestureRecognizer(keyboardHideGesture)
        
        registerProductNameTextField.addTarget(self, action: #selector(showKeyboard), for: .touchUpInside)
        janTextField.addTarget(self, action: #selector(showKeyboard), for: .touchUpInside)
        deadlineDayTextField.addTarget(self, action: #selector(showKeyboard), for: .touchUpInside)
        
        viewDesigns.registerDesign(registerButton: registerButton)
    }

    override func viewDidLayoutSubviews() {
     
        if !hasSetPointOrigin {
         
            hasSetPointOrigin = true
            pointOrigin = self.view.frame.origin
         
        }
    }
   
    @objc func panGestureRecognizerAction(sender: UIPanGestureRecognizer) {
     
        guard sender.translation(in: view).y >= 0 else { return }
        
        view.frame.origin = CGPoint(x: 0, y: self.pointOrigin!.y + sender.translation(in: view).y)
        
        if sender.state == .ended {
         
            if sender.velocity(in: view).y >= 1300 {
             
                self.dismiss(animated: true, completion: nil)
             
            }else{
               
                UIView.animate(withDuration: 0.3) {
                 
                    self.view.frame.origin = self.pointOrigin ?? CGPoint(x: 0, y: 400)
                 
                }
            }
        }
    }
    
    @objc func upViewPointY(sender:NSNotification) {
        
        
        if judgeChangeViewPointYBool == true{
            
            UIView.animate(withDuration: 0.2) {
                
                self.view.frame.origin.y = self.view.frame.origin.y - ((sender.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as Any) as AnyObject).cgRectValue!.height + (self.registerButton.frame.height - 10)
                self.judgeChangeViewPointYBool = false
            }
        }
    }
    
    @objc func downViewPointY(sender:NSNotification) {
        
        if judgeChangeViewPointYBool == false{
            
            UIView.animate(withDuration: 0.2) {
                
                if UIScreen.main.bounds.height < 896{
                    
                    self.view.frame.origin.y = UIScreen.main.bounds.height * 0.4
                    self.judgeChangeViewPointYBool = true
                    
                }else{
                    
                    self.view.frame.origin.y = UIScreen.main.bounds.height * 0.5
                    self.judgeChangeViewPointYBool = true
                }
                
            }
        }
        
    }
    
    @objc func keyboardHidden() {
        
        view.endEditing(true)
    }
    
    @objc func showKeyboard(sender:UITextField){
        
        sender.becomeFirstResponder()
    }
    
    @IBAction func register(_ sender: UIButton) {
        
        if registerProductNameTextField.text?.isEmpty != true && janTextField.text?.isEmpty != true && deadlineDayTextField.text?.isEmpty != true{
            
            realmCRUDModel.createRealmData(createProductName: registerProductNameTextField.text, createJanCode: janTextField.text, createDeadlineDay: deadlineDayTextField.text, alertTarget: self)
            
            registerProductNameTextField.text = ""
            janTextField.text = ""
            deadlineDayTextField.text = ""
        }
        
    }
    
}

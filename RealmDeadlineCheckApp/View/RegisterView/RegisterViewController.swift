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
    
    var hasSetPointOrigin = false
    var pointOrigin: CGPoint?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGestureRecognizerAction))
        view.addGestureRecognizer(panGesture)
        
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
    
    @IBAction func register(_ sender: UIButton) {
        
        if registerProductNameTextField.text?.isEmpty != true && janTextField.text?.isEmpty != true && deadlineDayTextField.text?.isEmpty != true{
            
            realmCRUDModel.createRealmData(createProductName: registerProductNameTextField.text, createJanCode: janTextField.text, createDeadlineDay: deadlineDayTextField.text, alertTarget: self)
            
            registerProductNameTextField.text = ""
            janTextField.text = ""
            deadlineDayTextField.text = ""
        }
        
    }
    
}

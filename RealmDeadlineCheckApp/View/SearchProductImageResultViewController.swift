//
//  SearchProductImageResultViewController.swift
//  RealmDeadlineCheckApp
//
//  Created by UrataHiroki on 2021/11/01.
//

import UIKit

class SearchProductImageResultViewController: UIViewController {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productDetailTextField: UITextView!
    
    var hasSetPointOrigin = false
    var pointOrigin: CGPoint?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGestureRecognizerAction))
        view.addGestureRecognizer(panGesture)
        
        
    }

    override func viewDidLayoutSubviews() {
     
        self.view.frame.origin.y = UIScreen.main.bounds.height * 0.5
        
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

    
}

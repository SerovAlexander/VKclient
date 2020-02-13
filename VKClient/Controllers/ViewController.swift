//
//  ViewController.swift
//  VKClient
//
//  Created by mac on 02/08/2019.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasShown(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWasShown(notification: Notification) {
        let info = notification.userInfo! as NSDictionary
        let size = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let insets = UIEdgeInsets(top: 0, left: 0, bottom: size.height, right: 0)
        
        self.scrollView.contentInset = insets
        self.scrollView.scrollIndicatorInsets = insets
    }
    
    @objc func keyboardWillHidden(notification: Notification) {
        let insets = UIEdgeInsets.zero
        self.scrollView.contentInset = insets
        self.scrollView.scrollIndicatorInsets = insets
        
    }
    @IBAction func logginButtonTap(_ sender: Any){
        let login = self.loginTextField.text ?? ""
        let pass = self.passwordTextField.text ?? ""
        
        if login == "" && pass == "" {
            performSegue(withIdentifier: "SuccessLogin", sender: nil)
            print("Успешно")
        }else{
            print("Ошибка данных")
            let alert = UIAlertController(title: "Ошибка", message: "Введен не вырный логин или пароль", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { _ in
                print("OK TAP")
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
}

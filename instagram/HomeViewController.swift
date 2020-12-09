//
//  HomeViewController.swift
//  instagram
//
//  Created by 岡田宗一郎 on 2020/12/07.
//  Copyright © 2020 soichiro.okada. All rights reserved.
//
import Firebase

import UIKit

class HomeViewController: UIViewController {

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidLoad()
        // currentUserがnilならログインしていない
        if Auth.auth().currentUser == nil {
            // ログインしていないときの処理
            let loginViewController = self.storyboard?.instantiateViewController(withIdentifier: "Login")
            self.present(loginViewController!, animated: true, completion: nil)
        // Do any additional setup after loading the view.
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  CommentViewController.swift
//  instagram
//
//  Created by 岡田宗一郎 on 2020/12/14.
//  Copyright © 2020 soichiro.okada. All rights reserved.
//

import UIKit
import Firebase
import FirebaseUI
import SVProgressHUD

class CommentViewController: UIViewController {
    
    //    変数を宣言しておく postData型で
    var postData: PostData!
    
    @IBOutlet weak var commentImputTextField: UITextField!
    @IBAction func commentSendButton(_ sender: Any) {
        let name = Auth.auth().currentUser?.displayName
        
        //        if let commentid = Auth.auth().currentUser?.uid
        //        {
        var updateComments: FieldValue
        
        if postData.iscommented {
            // すでにいいねをしている場合は、いいね解除のためmyidを取り除く更新データを作成
            updateComments = FieldValue.arrayRemove(["""
                \(commentImputTextField.text!)  \(name!)
                """])
        } else {
            // 今回新たにいいねを押した場合は、myidを追加する更新データを作成
            updateComments = FieldValue.arrayUnion(["""
            \(commentImputTextField.text!)  \(name!)
            """])
        }
        // likesに更新データを書き込む
        
        
        //        var updateValue: FieldValue
        //        updateValue = FieldValue.arrayUnion([commentImputTextField.text!+"\(name!)"])
        // commentsに更新データを書き込む
        let postRef = Firestore.firestore().collection(Const.PostPath).document(postData.id)
        //
        postRef.updateData(["comments": updateComments])
        //        postRef.updateData(["comments": updateValue])
        // 画面を閉じてタブ画面に戻る
        //        }
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
}
//
//
//if let myid = Auth.auth().currentUser?.uid {
//        // 更新データを作成する
//        var updateValue: FieldValue
//        if postData.isLiked {
//            // すでにいいねをしている場合は、いいね解除のためmyidを取り除く更新データを作成
//            updateValue = FieldValue.arrayRemove([myid])
//        } else {
//            // 今回新たにいいねを押した場合は、myidを追加する更新データを作成
//            updateValue = FieldValue.arrayUnion([myid])
//        }
//        // likesに更新データを書き込む
//        let postRef = Firestore.firestore().collection(Const.PostPath).document(postData.id)
//        postRef.updateData(["likes": updateValue])
//    }

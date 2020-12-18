//
//  CommentViewController.swift
//  instagram
//
//  Created by 岡田宗一郎 on 2020/12/14.
//  Copyright © 2020 soichiro.okada. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class CommentViewController: UIViewController {
    
    @IBOutlet weak var commentImputTextField: UITextField!
    @IBAction func commentSendButton(_ sender: Any) {
        if commentImputTextField.text == nil{
            SVProgressHUD.showError(withStatus: "コメントを入力して下さい")
        }
        else{
            
            // HUDで処理中を表示
//            SVProgressHUD.show()
            //usernameを取得してコメントと合わせる
            // 表示名を取得してTextFieldに設定する
  
            
            
            // HUDを消す
            
            
            // 画面を閉じてタブ画面に戻る
            self.dismiss(animated: true, completion: nil)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
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


//    // タップされたセルのインデックスを求める
//    let touch = event.allTouches?.first
//    let point = touch!.location(in: self.tableView)
//    let indexPath = tableView.indexPathForRow(at: point)
//
//    // 配列からタップされたインデックスのデータを取り出す
//    let postData = postArray[indexPath!.row]
//
//    // likesを更新する
//    if let myid = Auth.auth().currentUser?.uid {
//        // 更新データを作成する
//        var updateValue: FieldValue
//        if postData.isLiked {
//            // すでにいいねをしている場合は、いいね解除のためmyidを取り除く更新データを作成
//            updateValue = FieldValue.arrayRemove([myid])
//        } else {
//        // likesに更新データを書き込む
//        let postRef = Firestore.firestore().collection(Const.PostPath).document(postData.id)
//        postRef.updateData(["comments": updateValue])
//    }
//}

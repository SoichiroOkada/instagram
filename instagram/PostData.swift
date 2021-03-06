//
//  PostData.swift
//  instagram
//
//  Created by 岡田宗一郎 on 2020/12/10.
//  Copyright © 2020 soichiro.okada. All rights reserved.
//

import UIKit
import Firebase

class PostData: NSObject {
    var id: String
    var name: String?
    var caption: String?
    var date: Date?
    var likes: [String] = []
    var isLiked: Bool = false
    
//    commentの追加
    var comments: [String] = []
    var iscommented: Bool = false
    
    
    
    init(document: QueryDocumentSnapshot) {
        self.id = document.documentID

        let postDic = document.data()

        self.name = postDic["name"] as? String

        self.caption = postDic["caption"] as? String

        let timestamp = postDic["date"] as? Timestamp
        self.date = timestamp?.dateValue()
        
        if let comments = postDic["comments"] as? [String] {
            self.comments = comments
            if let commentid = Auth.auth().currentUser?.uid {
                // likesの配列の中にmyidが含まれているかチェックすることで、自分がいいねを押しているかを判断
                if self.comments.firstIndex(of: commentid) != nil {
                    // myidがあれば、いいねを押していると認識する。
                    self.iscommented = true
                }
            }
        }
        
        if let likes = postDic["likes"] as? [String] {
            self.likes = likes
        }
        if let myid = Auth.auth().currentUser?.uid {
            // likesの配列の中にmyidが含まれているかチェックすることで、自分がいいねを押しているかを判断
            if self.likes.firstIndex(of: myid) != nil {
                // myidがあれば、いいねを押していると認識する。
                self.isLiked = true
            }
        }
    }
}

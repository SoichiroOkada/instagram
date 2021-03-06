//
//  PostTableViewCell.swift
//  instagram
//
//  Created by 岡田宗一郎 on 2020/12/10.
//  Copyright © 2020 soichiro.okada. All rights reserved.
//

import UIKit
import Firebase
import FirebaseUI

class PostTableViewCell: UITableViewCell {
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    
    //コメント機能実装
    @IBOutlet weak var commentImputButton: UIButton!
    @IBOutlet weak var commentOutputLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
     // PostDataの内容をセルに表示
        func setPostData(_ postData: PostData) {
            // 画像の表示
            postImageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
            let imageRef = Storage.storage().reference().child(Const.ImagePath).child(postData.id + ".jpg")
            postImageView.sd_setImage(with: imageRef)

            // キャプションの表示
            self.captionLabel.text = "\(postData.name!) : \(postData.caption!)"

            // 日時の表示
            self.dateLabel.text = ""
            if let date = postData.date {
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy-MM-dd HH:mm"
                let dateString = formatter.string(from: date)
                self.dateLabel.text = dateString
            }
                //コメントの表示
            //配列をstringに変換
//            let stringRepresentation = postData.comments.description
            let stringRepresentation = postData.comments.joined(separator: "\n")
//            配列を表示する
            self.commentOutputLabel.text = stringRepresentation
//            
            // いいね数の表示
            let likeNumber = postData.likes.count
            likeLabel.text = "\(likeNumber)"

            // いいねボタンの表示
            if postData.isLiked {
                let buttonImage = UIImage(named: "like_exist")
                self.likeButton.setImage(buttonImage, for: .normal)
            } else {
                let buttonImage = UIImage(named: "like_none")
                self.likeButton.setImage(buttonImage, for: .normal)
            }
        }
    }

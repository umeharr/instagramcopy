//
//  PostTableViewCell.swift
//  Instagram
//
//  Created by user on 2020/06/13.
//  Copyright © 2020 chizku.umehara. All rights reserved.
//

import UIKit
import FirebaseUI
class PostTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setPostData(_ postData: PostData) {
        postImageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
        let imageRef = Storage.storage().reference().child(Const.ImagePath).child(postData.id + ".jpg")
        postImageView.sd_setImage(with: imageRef)
        self.captionLabel.text = "\(postData.name!) : \(postData.capition!)"
        self.dateLabel.text = ""
        if let date = postDate.date {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm"
            let dateString = formatter.string(from: date)
            self.dateLabel.text = dateString
        }
        let likeNumber = postData.likes.count
        likeLabel.text = "(\likeNumber)"
        if postData.isLiked {
            let buttonImage = UIImage(named: "like_exist")
            self.likeButton.setImage(buttonImage, for: .normal)
        } else {
            let buttonImage = UIImage(named: "liked_none")
            self.likeButton.setImage(buttonImage, for: .normal)
        }
    }
    
}


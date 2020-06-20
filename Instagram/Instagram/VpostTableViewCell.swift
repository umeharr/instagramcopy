//
//  VPostTableViewCell.swift
//  Instagram
//
//  Created by user on 2020/06/12.
//  Copyright © 2020 chizku.umehara. All rights reserved.
//

import UIKit
import FirebaseUI
class PostTableViewCell: UITableViewCell {
    @IBOutlet weak var postImageView: UIImageView!
    
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    
    
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
        self.commentLabel.text = "\(postData.name!)" : "\(postData.comment!)"
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
        self.commentButton.setImage(buttonImage, for: .normal)
        
    }
    
}

//
//  ArticleViewCell.swift
//  pituku-ios-tes-2
//
//  Created by Ferry Julian on 11/11/23.
//

import UIKit
import SnapKit

class ArticleViewCell: UITableViewCell {
    
    // MARK: - Implementation
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Components
    private lazy var articleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        addSubview(imageView)
        
        return imageView
    }()
    
    private lazy var articleTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Roboto-Bold", size: 14)
        label.numberOfLines = 3
        label.textAlignment = .left
        label.textColor = UIColor.primaryColor
        label.adjustsFontSizeToFitWidth = true
        addSubview(label)
        
        return label
    }()
    
    private lazy var articlePublishDateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Roboto-Regular", size: 12)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = UIColor.gray
        label.adjustsFontSizeToFitWidth = true
        addSubview(label)
        
        return label
    }()
    
    // MARK: - Configuration List Article View
    func configure(article: Data) {
        articleImageView.setImageUrl(urlPath: article.cover)
        articleTitleLabel.text = article.title
        articlePublishDateLabel.text = article.createdAt
    }
    
    // MARK: - UI Setup
    private func setupContraints() {
        
        articleImageView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(10)
            make.leading.equalToSuperview().inset(16)
            make.trailing.equalToSuperview().inset(250)
        }
        
        articleTitleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(articleImageView.snp.centerY).offset(-8)
            make.leading.equalTo(articleImageView.snp.trailing).offset(20)
            make.trailing.equalToSuperview().inset(16)
        }
        
        articlePublishDateLabel.snp.makeConstraints { make in
            make.centerY.equalTo(articleTitleLabel.snp.bottom).offset(10)
            make.leading.equalTo(articleTitleLabel.snp.leading)
            make.trailing.equalToSuperview().inset(16)
        }
        
    }
}

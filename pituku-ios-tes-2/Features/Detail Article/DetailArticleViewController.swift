//
//  DetailArticleViewController.swift
//  pituku-ios-tes-2
//
//  Created by Ferry Julian on 11/11/23.
//

import UIKit
import SnapKit

class DetailArticleViewController: UIViewController {

    // MARK: - Properties
    var detailArticle: Data!
    
    //MARK: - Implementation
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.secondaryColor
        
        self.navigationController?.navigationBar.tintColor = UIColor.primaryColor
        self.navigationItem.title = "Detail Article"

        configureView()
        setupContraints()
        
    }
    
    // MARK: - UI Components
    private lazy var articleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        view.addSubview(imageView)
        
        return imageView
    }()
    
    private lazy var articleTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Roboto-Bold", size: 16)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = UIColor.primaryColor
        label.adjustsFontSizeToFitWidth = true
        view.addSubview(label)
        
        return label
    }()
    
    private lazy var articlePublishDateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Roboto-Regular", size: 10)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = UIColor.gray
        label.adjustsFontSizeToFitWidth = true
        view.addSubview(label)
        
        return label
    }()
    
    private lazy var articleDescLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Roboto-Regular", size: 12)
        label.numberOfLines = 0
        label.textAlignment = .justified
        label.textColor = UIColor.black
        label.adjustsFontSizeToFitWidth = true
        view.addSubview(label)
        
        return label
    }()
    
    // MARK: - Configuration Detail Article View
    private func configureView() {
        articleImageView.setImageUrl(urlPath: detailArticle.cover)
        articleTitleLabel.text = detailArticle.title
        articlePublishDateLabel.text = detailArticle.createdAt
        articleDescLabel.text = detailArticle.description
    }
    
    // MARK: - UI Setup
    private func setupContraints() {
        
        articleImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(520)
        }
        
        articleTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(articleImageView.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        articlePublishDateLabel.snp.makeConstraints { make in
            make.top.equalTo(articleTitleLabel.snp.bottom).offset(5)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        articleDescLabel.snp.makeConstraints { make in
            make.top.equalTo(articlePublishDateLabel.snp.bottom).offset(15)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
    }
}

//
//  ArticleViewController.swift
//  pituku-ios-tes-2
//
//  Created by Ferry Julian on 11/11/23.
//

import UIKit
import SnapKit

class ArticleViewController: UIViewController {
    
    private let dataCell = "ArticleViewCell"
    private var articleList = [Data]()
    
    // MARK: - Implementation
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.primaryColor
        
        setupAPI()
        setupContraints()
        setupTableDelegate()
        
    }

    // MARK: - UI Components
    private lazy var articleDataTable: UITableView = {
        let tabel = UITableView()
        tabel.backgroundColor = UIColor.secondaryColor
        tabel.layer.cornerRadius = 20
        view.addSubview(tabel)
        
        return tabel
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Roboto-Bold", size: 20)
        label.text = "Artikel & Berita"
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = UIColor.secondaryColor
        label.adjustsFontSizeToFitWidth = true
        view.addSubview(label)
        
        return label
    }()
    
    private lazy var descLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Roboto-Regular", size: 14)
        label.text = "Kami menyajikan informasi terbaru terkait pencapaian, kesepakatan bisnis, dan artikel terkait lingkungan dan pengelolaan limbah."
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = UIColor.secondaryColor
        label.adjustsFontSizeToFitWidth = true
        view.addSubview(label)
        
        return label
    }()
    
    // MARK: - UI Setup
    private func setupContraints() {
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        descLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        articleDataTable.snp.makeConstraints{ make in
            make.top.equalTo(descLabel.snp.bottom).offset(25)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
    }
    
    // MARK: - TableView Delegate
    private func setupTableDelegate() {
        articleDataTable.dataSource = self
        articleDataTable.delegate = self
        articleDataTable.register(ArticleViewCell.self, forCellReuseIdentifier: dataCell)
    }
    
    // MARK: - API Setup
    private func setupAPI() {
        APIHandler.shared.fetchAPIData { apiData in
            // MARK: - Data Assign
            self.articleList.append(contentsOf: apiData)
            
            DispatchQueue.main.async {
                self.articleDataTable.reloadData()
            }
        }
    }
}

// MARK: - TableView Functions
extension ArticleViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: dataCell) as! ArticleViewCell
        cell.configure(article: articleList[indexPath.row])

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detailArticleVC = DetailArticleViewController()
        detailArticleVC.detailArticle = self.articleList[indexPath.row]
        navigationController?.pushViewController(detailArticleVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}

//
//  NewsTableViewCell.swift
//  News
//
//  Created by Nikolay Zhukov on 04.08.2023.
//

import UIKit

class NewsTableViewCellViewModel {
    let title: String
    let subtitle : String
    let imageURL: URL?
    var imageData: Data?
    
    init(title: String, subtitle: String, imageURL: URL?, imageData: Data? = nil) {
        self.title = title
        self.subtitle = subtitle
        self.imageURL = imageURL
        self.imageData = imageData
    }
}

class NewsTableViewCell: UITableViewCell {
    static let identifier = "NewsTableViewCell"
    
    private let newsTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 25, weight: .medium)
        return label
    }()
    
    private let subtitleleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .regular)
        return label
    }()
    
    private let newsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemRed
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(newsTitleLabel)
        contentView.addSubview(subtitleleLabel)
        contentView.addSubview(newsImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        newsTitleLabel.frame = CGRect(
            x: 10,
            y: 0,
            width: contentView.frame.size.width - 120,
            height: contentView.frame.size.height / 2
        )
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func configure(with viewModel: NewsTableViewCellViewModel) {
        newsTitleLabel.text = viewModel.title
        subtitleleLabel.text = viewModel.subtitle
        
        // Image
        if let data = viewModel.imageData {
            newsImageView.image = UIImage(data: data)
        }   else {
            //fetch
        }
    }

}

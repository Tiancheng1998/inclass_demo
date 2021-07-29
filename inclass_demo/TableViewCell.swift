//
//  TableViewCell.swift
//  inclass_demo
//
//  Created by Tony Wang on 7/25/21.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    static let identifier = "TableViewCell"
    private let container = UIView()
    private let name = UILabel()
    private let charImg = UIImageView()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(container)
        container.addSubview(name)
        container.addSubview(charImg)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupConstraints() {
        
        container.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(100)
            make.centerY.equalToSuperview()
        }
        
        charImg.snp.makeConstraints { (make) in
            make.width.height.equalTo(50)
            make.leading.equalToSuperview().offset(10)
            make.centerY.equalToSuperview()
        }
        
        name.snp.makeConstraints { (make) in
            make.leading.equalTo(charImg.snp.trailing).offset(10)
            make.centerY.equalToSuperview()
        }
    }
    
    public func setContent(for character: String, with image: UIImage) {
        name.text = character
        charImg.image = image
    }
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

}

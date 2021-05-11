//
//  CellWeb.swift
//  Multimedia-HomeWork-IOS-8 Kharin_ALEXEY
//
//  Created by Alexey Kharin on 10.05.2021.
//

import UIKit
class CellWeb: UITableViewCell {
    
    var names: String? {
        didSet {
            name.text = names
        }
    }
    
    let name: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.numberOfLines = 0
        label.toAutoLayout()
        label.backgroundColor = .white
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setUp() {
        contentView.addSubview(name)
        let constraints = [
            name.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            name.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 16),
            name.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 16),
            name.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}




extension UIView {
    func toAutoLayout() {
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

//
//  EmployeeTableViewCell.swift
//  Test2
//
//  Created by Никита Чечнев on 06.02.2023.
//

import UIKit

class EmployeeTableViewCell: UITableViewCell {
    
    static let identifier = "EmployeeTableViewCell"

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let phoneLabel: UILabel = {
        let label = UILabel()
        label.text = "Phone"
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let skillsLabel: UILabel = {
        let label = UILabel()
        label.text = "Skills"
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews(nameLabel, phoneLabel, skillsLabel)
        addConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            nameLabel.bottomAnchor.constraint(equalTo: phoneLabel.topAnchor, constant: -10),
            
            phoneLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            phoneLabel.bottomAnchor.constraint(equalTo: skillsLabel.topAnchor, constant: -10),
            
            skillsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            skillsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    public func configure(with person: Employee) {
        self.nameLabel.text = person.name
        self.phoneLabel.text = person.phoneNumber
        self.skillsLabel.text = person.skillsString
    }

}

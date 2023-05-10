//
//  PersonCell.swift
//  simulator-spread-infection
//
//  Created by Nikita Marin on 10.05.2023.
//

import UIKit

import UIKit

class PersonCell: UICollectionViewCell {
    
    // MARK: - Properties
    var state: PersonState? {
        didSet {
            guard let state = state else { return }
            switch state {
            case .healthy:
                contentView.backgroundColor = .systemGreen
            case .infected:
                contentView.backgroundColor = .systemRed
            }
        }
    }
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    
    private func configureUI() {
        contentView.backgroundColor = .systemGreen
        contentView.layer.cornerRadius = 8
    }
    
    func configure(with state: PersonState) {
        self.contentView.backgroundColor = state.color
    }
}


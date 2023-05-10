//
//  PersonState.swift
//  simulator-spread-infection
//
//  Created by Nikita Marin on 10.05.2023.
//
import UIKit

enum PersonState {
    case infected
    case healthy
    
    var color: UIColor {
        switch self {
        case .infected:
            return .systemRed
        case .healthy:
            return .systemGreen
        }
    }
}


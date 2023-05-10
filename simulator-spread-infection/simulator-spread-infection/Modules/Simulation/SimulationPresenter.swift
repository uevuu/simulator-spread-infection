//
//  SimulationPresenter.swift
//  simulator-spread-infection
//
//  Created by Nikita Marin on 10.05.2023.
//

import UIKit

protocol SimulationPresenterOutput: AnyObject {
}

final class SimulationPresenter {
    weak var view: SimulationViewInput?
    private let output: SimulationPresenterOutput?
    private let parameters: SimulationParameters
    
    init(output: SimulationPresenterOutput?, parameters: SimulationParameters) {
        self.output = output
        self.parameters = parameters
    }
}

extension SimulationPresenter: SimulationViewOutput {
}


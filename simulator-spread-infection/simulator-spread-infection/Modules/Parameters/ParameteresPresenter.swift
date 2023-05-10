//
//  ParameteresPresenter.swift
//  simulator-spread-infection
//
//  Created by Nikita Marin on 10.05.2023.
//

import UIKit

protocol ParameteresPresenterOutput: AnyObject {
    func showSimulationModule(parameters: SimulationParameters)
}

// MARK: - ParameteresPresenter
final class ParameteresPresenter {
    weak var view: ParametersViewInput?
    private let output: ParameteresPresenterOutput?
    
    init(output: ParameteresPresenterOutput?) {
        self.output = output
    }
}

extension ParameteresPresenter: ParametersViewOutput {
    func startSimulation(parameters: SimulationParameters) {
        output?.showSimulationModule(parameters: parameters)
    }
}

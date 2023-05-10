//
//  SimulationBuilder.swift
//  simulator-spread-infection
//
//  Created by Nikita Marin on 10.05.2023.
//

import UIKit

final class SimulationBuilder {
    private var moduleOutput: SimulationPresenterOutput?
    func build(simulationParameters: SimulationParameters) -> UIViewController {
        let presenter = SimulationPresenter(output: moduleOutput, parameters: simulationParameters)
        let view = SimulationViewController(output: presenter)
        presenter.view = view
        return view
    }
}

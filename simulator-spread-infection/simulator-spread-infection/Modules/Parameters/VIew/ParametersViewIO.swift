//
//  ParametersViewIO.swift
//  simulator-spread-infection
//
//  Created by Nikita Marin on 10.05.2023.
//

import Foundation

protocol ParametersViewInput: AnyObject {
}

protocol ParametersViewOutput: AnyObject {
    func startSimulation(parameters: SimulationParameters)
}

 

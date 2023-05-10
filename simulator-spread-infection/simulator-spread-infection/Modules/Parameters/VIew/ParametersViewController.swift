//
//  ParametersViewController.swift
//  simulator-spread-infection
//
//  Created by Nikita Marin on 09.05.2023.
//

import UIKit

// MARK: - ParametersViewController
class ParametersViewController: UIViewController {
    // MARK: - Dependencies
    private let output: ParametersViewOutput
    
    // MARK: - Properties
    private let groupSizeTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Количество людей (по умолчанию 100)"
        textField.keyboardType = .numberPad
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private let infectionFactorTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Может быть заражено (по умолчанию 3)"
        textField.keyboardType = .numberPad
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private let periodTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Период (по умолчанию 60 секунд)"
        textField.keyboardType = .numberPad
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private lazy var startButton: UIButton = {
        let button = UIButton()
        button.setTitle("Запустить моделирование", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        return button
    }()
    
    
    // MARK: - Init
    init(output: ParametersViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        cleanTextFields()
    }
    
    // MARK: - Actions
    @objc private func startButtonTapped() {
        let parameters = SimulationParameters(
            groupSize: groupSizeTextField.numericValue(defaultValue: 100),
            infectionFactor: infectionFactorTextField.numericValue(defaultValue: 3),
            period: periodTextField.numericValue(defaultValue: 60)
        )
        output.startSimulation(parameters: parameters)
    }
    
    // MARK: - Private function
    private func configureUI() {
        view.backgroundColor = .white
//        title = "Simulation Parameters"
        
        let stackView = UIStackView(arrangedSubviews: [groupSizeTextField, infectionFactorTextField, periodTextField, startButton])
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    private func cleanTextFields() {
        groupSizeTextField.text = ""
        infectionFactorTextField.text = ""
        periodTextField.text = ""
    }
}

extension ParametersViewController: ParametersViewInput {
}


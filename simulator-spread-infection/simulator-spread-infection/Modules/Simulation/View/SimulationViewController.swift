//
//  SimulationViewController.swift
//  simulator-spread-infection
//
//  Created by Nikita Marin on 10.05.2023.
//

import UIKit




//// MARK: - SimulationViewController
//final class SimulationViewController: UIViewController {
//    // MARK: - Dependencies
//    private let output: SimulationViewOutput
//
//    // MARK: - Init
//    init(output: SimulationViewOutput) {
//        self.output = output
//        super.init(nibName: nil, bundle: nil)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    // MARK: - Lifecycle
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
//}

class Person {
    
    var isInfected: Bool
    var frame: CGRect
    
    init(frame: CGRect, isInfected: Bool = false) {
        self.frame = frame
        self.isInfected = isInfected
    }
    
}


class SimulationViewController: UIViewController, UIScrollViewDelegate {
    
    // Constants
    let InfectionFactor = 3 // Максимальный размер подмножества зараженных элементов
    
    // UI Elements
    let scrollView = UIScrollView()
    let contentView = UIView()
    let healthyCountLabel = UILabel()
    let infectedCountLabel = UILabel()
    
    // People Model
    var people: [Person] = [] {
        didSet {
            updateUI()
        }
    }
    
    // Update the UI
    func updateUI() {
        // Remove all subviews from the content view
        contentView.subviews.forEach({ $0.removeFromSuperview() })
        
        // Add people subviews to the content view
        people.forEach({ person in
            let personView = PersonView(frame: person.frame)
            personView.isInfected = person.isInfected
            personView.tapAction = { [weak self] in
                self?.infectPerson(person: person)
            }
            contentView.addSubview(personView)
        })
        
        // Update the healthy and infected count labels
        let healthyCount = people.filter({ !$0.isInfected }).count
        let infectedCount = people.filter({ $0.isInfected }).count
        healthyCountLabel.text = "Healthy: \(healthyCount)"
        infectedCountLabel.text = "Infected: \(infectedCount)"
    }

    func infectPerson(person: Person) {
        person.isInfected = true
    }
    // MARK: - Dependencies
    private let output: SimulationViewOutput
    
    // MARK: - Init
    init(output: SimulationViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up the scroll view
        scrollView.delegate = self
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 3.0
        view.addSubview(scrollView)
        
        // Set up the content view
        scrollView.addSubview(contentView)
        
        // Set up the healthy and infected count labels
        view.addSubview(healthyCountLabel)
        view.addSubview(infectedCountLabel)
        
        // Generate people
        generatePeople()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // Set up the scroll view and content view frames
        scrollView.frame = view.bounds
        contentView.frame = CGRect(x: 0, y: 0, width: scrollView.contentSize.width, height: scrollView.contentSize.height)
        
        // Set up the healthy and infected count label frames
        let labelHeight: CGFloat = 30.0
        let labelY: CGFloat = view.bounds.height - labelHeight
        healthyCountLabel.frame = CGRect(x: 20, y: labelY, width: 100, height: labelHeight)
        infectedCountLabel.frame = CGRect(x: view.bounds.width - 120, y: labelY, width: 100, height: labelHeight)
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return contentView
    }
    
    // Generate people
    func generatePeople() {
        let numPeople = 100 // количество людей в симуляции
        let personSize = CGSize(width: 10, height: 10) // размер персонажа
        let margin: CGFloat = 20.0 // отступ между персонажами
        
        // Calculate the number of rows and columns of people that fit on the screen
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height - 60 // вычитаем высоту счетчиков здоровых и зараженных
        let maxColumns = Int(screenWidth / (personSize.width + margin))
        let maxRows = Int(screenHeight / (personSize.height + margin))
        
        // Generate the people
        var people: [Person] = []
        for row in 0..<maxRows {
            for column in 0..<maxColumns {
                let x = margin + CGFloat(column) * (personSize.width + margin)
                let y = margin + CGFloat(row) * (personSize.height + margin)
                let frame = CGRect(x: x, y: y, width: personSize.width, height: personSize.height)
                let isInfected = row == 0 && column == 0 // первый персонаж заражен
                let person = Person(frame: frame, isInfected: isInfected)
                people.append(person)
            }
        }
        
        // Set the people on the view controller
        self.people = people
    }
}


import UIKit

class PersonView: UIView {
    
    var isInfected: Bool = false {
        didSet {
            backgroundColor = isInfected ? .red : .green
        }
    }
    
    var tapAction: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture(_:)))
        addGestureRecognizer(tapGesture)
        
        layer.cornerRadius = frame.width / 2.0
        backgroundColor = .green
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func handleTapGesture(_ gestureRecognizer: UITapGestureRecognizer) {
        tapAction?()
    }
}


extension SimulationViewController: SimulationViewInput {
    
}



//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Davit Davtyan on 04.05.22.
//

import UIKit

class ViewController: UIViewController {
    
//    var squreView: SquareView!
    
    var mainStackView: UIStackView!
    var resetButton: UIButton!
    var titleLabel: UILabel!
    var isXstate: Bool = true
    var squareViews: [SquareView] = []
    
    var inNewGameState: Bool = false {
        didSet {
            if inNewGameState {
               squareViews.forEach({ $0.removeData()})
            }
        }
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        initStackView()
        initResetButton()
        initTitleLabel()
        constructHierarchy()
        activateConstraints()
        
        
        createSquareGrid(size: 1...3)
    }
    
    func createSquareGrid(size: ClosedRange<Int>) {
        for _ in size {
            let stackView = createHorizontalStackView()
            mainStackView.addArrangedSubview(stackView)
            
            for _ in size {
                let squareView = SquareView()
                
                
                squareView.onButtonSelection = {
                    
                    if squareView.isValueSet {
                        return
                    }
                    
                    if self.isXstate {
                        squareView.set(value: "X")
                    }else {
                       squareView.set(value: "O")
                    }
                    self.isXstate.toggle()
                }
                

                let height = (Int(view.frame.width) - 50 - (size.upperBound - 1)*5)/size.upperBound
                
                NSLayoutConstraint.activate([
                    squareView.heightAnchor.constraint(equalToConstant:  CGFloat(height))
                ])
                
                squareViews.append(squareView)
                stackView.addArrangedSubview(squareView)
            }
        }
    }
    
    func createHorizontalStackView() -> UIStackView {
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.distribution = .fillEqually
        return stackView
        
    }
    
    @objc func newGame() {
        squareViews.forEach({ $0.removeData()})    }
    
}





//  MARK: - Layout
extension ViewController {
    private func initStackView() {
        mainStackView = UIStackView()
        mainStackView.axis = .vertical
        mainStackView.spacing = 5
        mainStackView.backgroundColor = .black
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    private func initResetButton() {
        resetButton = UIButton()
        resetButton.layer.cornerRadius = 12
        resetButton.setTitle("Reset", for: .normal)
        resetButton.addTarget(self, action: #selector(newGame), for: .touchUpInside)
        resetButton.backgroundColor = .red
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    private func initTitleLabel() {
        titleLabel = UILabel()
        titleLabel.layer.cornerRadius = 12
        titleLabel.font = UIFont.systemFont(ofSize: 30)
        titleLabel.textAlignment = .center
        titleLabel.text = "TicTacToe"
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    
    private func constructHierarchy() {
        view.addSubview(mainStackView)
        view.addSubview(resetButton)
        view.addSubview(titleLabel)
        
    }
    private func activateConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 100),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            
            
            resetButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            resetButton.heightAnchor.constraint(equalToConstant: 50),
            resetButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            resetButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            
            
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            titleLabel.heightAnchor.constraint(equalToConstant: 50),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            ])
            

    }

}



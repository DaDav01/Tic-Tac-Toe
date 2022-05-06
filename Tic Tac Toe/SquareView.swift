//
//  SquareView.swift
//  Tic Tac Toe
//
//  Created by Davit Davtyan on 04.05.22.
//

import UIKit

class SquareView: UIView {
    
    var squareLabel: UILabel!
    var squareButton: UIButton!
    var onButtonSelection: (()-> Void)?
    var isValueSet: Bool = false
    
    init() {
        super.init(frame: .zero)
        allView()
    }
    
    required init?(coder: NSCoder){
        super.init(coder: coder)
        allView()
    }
    
    func allView() {
        backgroundColor = .white
        initSquareLabel()
        initSquareButton()
        constructHirrarchy()
        activateConstraints()
    }
    
    @objc func buttonAction() {
        onButtonSelection?()
    }
    
    
    
    func set(value: String) {
        guard isValueSet else {
            squareLabel.text = value
            isValueSet = true
            return
        }
        isValueSet = true
    }
    
    func removeData() {
        squareLabel.text = ""
        isValueSet = false
    }
}


// MARK: -Layout

extension SquareView {
    
    private func initSquareLabel() {
        squareLabel = UILabel()
        squareLabel.textColor = .black
        squareLabel.font = UIFont.systemFont(ofSize: 30)
        squareLabel.textAlignment = .center
        squareLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func initSquareButton(){
        squareButton = UIButton()
//        squareButton.layer.cornerRadius = 12
        squareButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        squareButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func constructHirrarchy() {
        addSubview(squareLabel)
        addSubview(squareButton)
    }
    
    private func activateConstraints(){
        NSLayoutConstraint.activate([
            squareLabel.topAnchor.constraint(equalTo: topAnchor),
            squareLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            squareLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            squareLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            squareButton.topAnchor.constraint(equalTo: topAnchor),
            squareButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            squareButton.trailingAnchor.constraint(equalTo:trailingAnchor),
            squareButton.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
    }
}

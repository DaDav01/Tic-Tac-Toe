//
//  FirstViewController.swift
//  Tic Tac Toe
//
//  Created by Davit Davtyan on 04.05.22.
//


import UIKit

class FirstViewController: UIViewController {
    
    var firstButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    
        
        view.backgroundColor = .red
        
        firstButton = UIButton(type: .system)
        firstButton.backgroundColor = .white
        firstButton.setTitle("PLAY", for: .normal)
        firstButton.layer.cornerRadius = 12
        firstButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        firstButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(firstButton)
        
        NSLayoutConstraint.activate([
            firstButton.widthAnchor.constraint(equalToConstant: 100),
            firstButton.heightAnchor.constraint(equalToConstant: 50),
            firstButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            firstButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
    }
    
    @objc func buttonPressed(){
        self.navigationController?.pushViewController(ViewController(), animated: false)
    }
}

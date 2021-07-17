//
//  ViewController.swift
//  inclass_demo
//
//  Created by Tony Wang on 7/11/21.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UISearchBarDelegate {
    
    let helloWorld: UILabel = {
        let label = UILabel()
        label.textColor = .orange
        label.text = "HELLO WORLD!"
        return label
    }()
    let img = UIImageView(image: UIImage(named: "peaShooter"))
    let searchBar = UISearchBar()
    var buttonStack: UIStackView!
    let button1: UIButton = {
        let b = UIButton()
        b.setTitle("ON", for: .normal)
        b.setTitleColor(.red, for: .normal)
        b.layer.cornerRadius = 8
        b.layer.borderWidth = 1.0
        b.layer.borderColor = UIColor.black.cgColor
        return b
    }()
    let button2: UIButton = {
        let b = UIButton()
        b.setTitle("OFF", for: .normal)
        b.setTitleColor(.red, for: .normal)
        b.layer.cornerRadius = 8
        b.layer.borderWidth = 1.0
        b.layer.borderColor = UIColor.black.cgColor
        return b
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        view.addSubview(helloWorld)
        view.addSubview(img)
        searchBar.prompt = "Enter Something"
        searchBar.delegate = self
        view.addSubview(searchBar)
        
        setupButtonStack()
//        setupConstraints()
    }
    
    private func setupButtonStack() {
        button1.addTarget(self, action: #selector(onButtonTapped), for: .touchUpInside)
        button2.addTarget(self, action: #selector(offButtonTapped), for: .touchUpInside)
        
        buttonStack = UIStackView(arrangedSubviews: [button1,button2])
        buttonStack.axis = .vertical
        buttonStack.distribution = .equalSpacing
        view.addSubview(buttonStack)
    }

//    private func setupConstraints() {
//        helloWorld.snp.makeConstraints { (make) in
//            make.centerX.equalToSuperview()
//            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(20)
//        }
//    }
    
    @objc func onButtonTapped() {
        img.isHidden = false
    }
    
    @objc func offButtonTapped() {
        img.isHidden = true
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        helloWorld.text = searchBar.text
    }

}


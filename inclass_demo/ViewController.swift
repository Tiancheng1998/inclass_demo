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
    let table = UITableView()
    let characterNames = ["pea shooter", "zombie", "squash", "pea shooter", "sunflower", "wallnut", "mushroom", "sunflower", "zombie", "wallnut", "watermelon"]
    let imgData = [UIImage(named: "peaShooter"), UIImage(named: "zombie"), UIImage(named: "squash"), UIImage(named: "peaShooter"), UIImage(named: "sunflower"), UIImage(named: "wallnut"), UIImage(named: "mushroom"), UIImage(named: "sunflower"), UIImage(named: "zombie"), UIImage(named: "wallnut"), nil]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        view.addSubview(helloWorld)
        view.addSubview(img)
        searchBar.prompt = "Enter Something"
        searchBar.delegate = self
        view.addSubview(searchBar)
        setupTableView()
        
        setupButtonStack()
        
        setupConstraints()
    }
    
    private func setupButtonStack() {
        button1.addTarget(self, action: #selector(onButtonTapped), for: .touchUpInside)
        button2.addTarget(self, action: #selector(offButtonTapped), for: .touchUpInside)
        
        buttonStack = UIStackView(arrangedSubviews: [button1,button2])
        buttonStack.axis = .vertical
        buttonStack.distribution = .equalSpacing
        view.addSubview(buttonStack)
    }
    
    private func setupTableView() {
        table.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
        table.rowHeight = 120
        table.dataSource = self
        table.delegate = self
        view.addSubview(table)
    }

    private func setupConstraints() {
        img.snp.makeConstraints { (make) in
            make.height.equalTo(50)
            make.width.equalTo(50)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(20)
            make.centerX.equalToSuperview().offset(80)
        }
        helloWorld.snp.makeConstraints { (make) in
            make.centerY.equalTo(img.snp.centerY)
            make.centerX.equalToSuperview().offset(-80)
        }
        searchBar.snp.makeConstraints { (make) in
            make.top.equalTo(img.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview().inset(50)
            make.height.equalTo(90)
        }
        buttonStack.snp.makeConstraints { (make) in
            make.top.equalTo(searchBar.snp.bottom).offset(30)
            make.width.equalTo(100)
            make.height.equalTo(80)
            make.centerX.equalToSuperview()
        }
        table.snp.makeConstraints { (make) in
            make.bottom.trailing.leading.equalToSuperview().inset(10)
            make.top.equalTo(buttonStack.snp_bottom).offset(10)
        }
    }
    
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

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characterNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as! TableViewCell
        cell.setContent(for: characterNames[indexPath.row], with: imgData[indexPath.row] ?? (UIImage(named: "default")!))
        return cell
        
    }
    
}


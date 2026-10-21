//
//  ViewController.swift
//  ExpiryTracker
//
//  Created by Manaf Akberov on 10.10.26.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    private let store = ProductStore()
    private var products: [Product] = []
    private let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        products = store.load()
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = products[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            products.remove(at: indexPath.row)
            store.save(products)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }


}


//
//  ViewController.swift
//  Sky_TableView
//
//  Created by Kallimullin.T on 12/03/2020.
//  Copyright © 2020 Kallimullin.T. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var restaurantNames = ["Индейка с сыром и овощами", "Каша с баклажанами", "Курица с апельсинами", "Манная каша", "Форель с овощами", "Гамбургер", "Бургеры по-американски", "Сендвичи", "Креветки в соусе терияки", "Бутерброды", "Тефтели в белом соусе", "Форель в собственном соку", "Куриные крылышки с аджикой", "Индейка с медом", "Куриные крылышки по-корейски", "Индейка в винном соусе", "Утка с сельдереем", "Индейка с картофелем", "Котлеты по-киевски", "Индейка с лисичками", "Бефстроганов по-прикольному"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "datacell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
   
        cell.textLabel?.text = restaurantNames[indexPath.row]
        cell.imageView?.image = UIImage(named:restaurantNames[indexPath.row])
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override var prefersStatusBarHidden: Bool {
        return true }
}


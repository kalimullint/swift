//
//  RestaurantTableViewController.swift
//  FoodPin
//
//  Created by Simon Ng on 28/10/2019.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController {

     var restaurantNames = ["Индейка с сыром и овощами", "Каша с баклажанами", "Курица с апельсинами", "Манная каша", "Форель с овощами", "Гамбургер", "Бургеры по-американски", "Сендвичи", "Креветки в соусе терияки", "Бутерброды", "Тефтели в белом соусе", "Форель в собственном соку", "Куриные крылышки с аджикой", "Индейка с медом", "Куриные крылышки по-корейски", "Индейка в винном соусе", "Утка с сельдереем", "Индейка с картофелем", "Котлеты по-киевски", "Индейка с лисичками", "Бефстроганов по-прикольному"]
           var restaurantImages = ["Индейка с сыром и овощами.jpg", "Каша с баклажанами.jpg", "Курица с апельсинами.jpg", "Манная каша.jpg", "Форель с овощами.jpg", "Гамбургер.jpg", "Бургеры по-американски.jpg", "Сендвичи.jpg", "Креветки в соусе терияки.jpg", "Бутерброды.jpg", "Тефтели в белом соусе.jpg", "Форель в собственном соку.jpg", "Куриные крылышки с аджикой.jpg", "Индейка с медом.jpg", "Куриные крылышки по-корейски.jpg", "Индейка в винном соусе.jpg", "Утка с сельдереем.jpg", "Индейка с картофелем.jpg", "Котлеты по-киевски.jpg", "Индейка с лисичками.jpg", "Бефстроганов по-прикольному.jpg"]
           var restaurantLocations = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong",
           "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney", "New York", "New York", "New York", "New York", "New York", "New York", "New York",
           "London", "London", "London", "London"]
           var restaurantTypes = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrian Causual Drink", "French", "Bakery", "Bakery", "Chocolate", "Cafe", "American Seafood", "American", "American", "Breakfast & Brunch", "Coffee & Tea", "Coffee & Tea", "Latin American", "Spanish", "Spanish", "Spanish", "British", "Thai"]
    
    var restaurantIsVisited = Array(repeating: false, count: 21)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.cellLayoutMarginsFollowReadableWidth = true
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantNames.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "datacell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! RestaurantTableViewCell
        
        // Configure the cell...
        cell.nameLabel.text = restaurantNames[indexPath.row]
        cell.locationLabel.text = restaurantLocations[indexPath.row]
        cell.typeLabel.text = restaurantTypes[indexPath.row]
        cell.thumbnailImageView.image = UIImage(named: restaurantImages[indexPath.row])
        
        // Solution to exercise 2
        cell.heartImageView.isHidden = !self.restaurantIsVisited[indexPath.row]
        
        return cell
    }
    

    // MARK: - UITableViewDelegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Create an option menu as an action sheet
        let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .actionSheet)
        
        // For iPad
        if let popoverController = optionMenu.popoverPresentationController {
            if let cell = tableView.cellForRow(at: indexPath) {
                popoverController.sourceView = cell
                popoverController.sourceRect = cell.bounds
            }
        }
        
        // Add actions to the menu
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        optionMenu.addAction(cancelAction)
        
        // Add Call action
        let callActionHandler = { (action:UIAlertAction!) -> Void in
            let alertMessage = UIAlertController(title: "Service Unavailable", message: "Sorry, the call feature is not available yet. Please retry later.", preferredStyle: .alert)
            alertMessage.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alertMessage, animated: true, completion: nil)
        }

        let callAction = UIAlertAction(title: "Call " + "123-000-\(indexPath.row)", style: .default, handler: callActionHandler)
        optionMenu.addAction(callAction)
        
        // Check-in action
        let checkInTitle = self.restaurantIsVisited[indexPath.row] ? "Undo Favorite" : "Favorite"
        let checkInAction = UIAlertAction(title: checkInTitle, style: .default, handler: {
            (action:UIAlertAction!) -> Void in
            
            let cell = tableView.cellForRow(at: indexPath) as? RestaurantTableViewCell
            
            // Solution to exercise 1
//            cell?.accessoryType = self.restaurantIsVisited[indexPath.row] ? .none : .checkmark
            
            // Solution to exercise 2
            // We use the isHidden property to control whether the image view is displayed or not
            cell?.heartImageView.isHidden = self.restaurantIsVisited[indexPath.row]
            
            self.restaurantIsVisited[indexPath.row] = self.restaurantIsVisited[indexPath.row] ? false : true
        })
        optionMenu.addAction(checkInAction)
        
        // Display the menu
        present(optionMenu, animated: true, completion: nil)
        
        // Deselect a row
        tableView.deselectRow(at: indexPath, animated: false)
    }
}

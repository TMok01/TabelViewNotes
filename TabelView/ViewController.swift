//
//  ViewController.swift
//  TabelView
//
//  Created by TYLER MOK on 10/18/23.
//

// making a struct
struct Book {
    var author: String
    var title: String
    var pages: Int
    var chapters: Int
}

import UIKit


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    var numbers = [3,5,7,9,12,15]
    
    // () calling default constrocter
    var books = [Book]()
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    
   
    @IBOutlet weak var barOutlet: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // 2 lines of code are needed
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
        
        books.append(Book(author: "Mok", title: "4L ", pages: 300, chapters: 7))
        
        books.append(Book(author: "Mason", title: "Munch", pages: 976, chapters: 10))
    }
    
    // how many cells you see
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    // this populates each cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewOutlet.dequeueReusableCell(withIdentifier: "myCell") as! CrazyCell
        //cell.textLabel?.text = "\(numbers[indexPath.row])"
        //cell.detailTextLabel?.text = "Hello"
        
        //indexPath.row keeping track of what row your on
        cell.authorOutlet.text = books[indexPath.row].author
        cell.chaptersOutlet.text = "\(books[indexPath.row].chapters)"
        cell.pagesOutlet.text = "\(books[indexPath.row].pages)"
        cell.titleOutlet.text = books[indexPath.row].title
        
        
        
        return cell
    }
    

    @IBAction func barButton(_ sender: Any) {
        var blah = barOutlet.text!
        var num = Int(blah)
        // safe unwrapping
        if let n = num {
            numbers.append(n)
            // reloading the Table View, reloadData calls the 2 tableView functions above
            tableViewOutlet.reloadData()
        }
    }
    
}


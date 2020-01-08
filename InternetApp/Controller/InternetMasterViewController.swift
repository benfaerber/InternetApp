//
//  InternetMasterViewController.swift
//  InternetApp
//
//  Created by Faerber, Benjamin on 1/8/20.
//  Copyright © 2020 Faerber, Benjamin. All rights reserved.
//

import UIKit

class InternetMasterViewController : UITableViewController {
    weak var delegate : InternetDetailDelegate?
    
    private lazy var pdfTopics : [String] = [String]()
    private lazy var internetTopics : [String] = [String]()
    private lazy var addresses : [String] = [String]()
    private lazy var files : [String] = [String]()
    private let rowIdentifer : String = "internetRow"
    
    //MARK:- Helper method for setup
    private func setupDetailContents() -> Void
    {
        internetTopics = [
            "Standard Search Engine",
            "AP CSP",
            "Canyons District",
            "CTEC",
            "Social Media"
        ]
        
        files = [
            "demo",
            "demo",
            "demo"
        ]
        
        // This should have the same as files
        pdfTopics = [
            "Defined internet terms",
            "Essay on the impact of the Internet",
            "Article from techn news"
        ]
        
        // Hint: same number of entries as internetTopics
        addresses = [
            "https://ctec.canyonsdistrict.org/",
            "https://google.com/",
            "https://cnn.com/",
            "https://canyonsdistrict.org/",
            "https://ctec.canyonsdistrict.org/"
        ]
    }
    
    //MARK:- Lifecycle methods
    override func viewDidLoad() -> Void
    {
        super.viewDidLoad()
        setupDetailContents()
        self.clearsSelectionOnViewWillAppear = false
    }
    
    //MARK: - Table view data source methods
    
    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if (section == 0)
        {
            return pdfTopics.count
        }
        else
        {
            return internetTopics.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: rowIdentifer, for: indexPath)
        cell.textLabel?.textAlignment = .center
        
        if (indexPath.section == 0)
        {
            cell.textLabel?.text = pdfTopics[indexPath.row]
        }
        else
        {
            cell.textLabel?.text = internetTopics[indexPath.row]
        }
        
        return cell
    }
    
    //MARK:- Handle interaction with the tableview
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) -> Void
    {
        let currentTopic : String
        let currentAddress: String
        
        if (indexPath.section == 0)
        {
            currentTopic = pdfTopics[indexPath.row]
            currentAddress = files[indexPath.row]
        }
        else
        {
            currentTopic = internetTopics[indexPath.row]
            currentAddress = addresses[indexPath.row]
        }
        
        delegate?.dataUpdate(title: currentTopic, address: currentAddress)
        
        //MARK: Load a view without a segue
        if let detailViewController = delegate as? InternetDetailViewController
        {
            splitViewController?.showDetailViewController(detailViewController, sender: nil)
        }
    }
    
    //MARK: - Handle section headers
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        if (section == 0)
        {
            return "PDF Reports"
        }
        return "Internet Information"
    }
}

protocol InternetDetailDelegate : class
{
    func dataUpdate(title: String, address: String) -> Void
}

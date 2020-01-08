//
//  InternetMasterViewController.swift
//  InternetApp
//
//  Created by Faerber, Benjamin on 1/8/20.
//  Copyright © 2020 Faerber, Benjamin. All rights reserved.
//

import UIKit

class InternetMasterViewController : TableViewController {

}

protocol InternetDetailDelegate : class
{
    func dataUpdate(title: String, address: String) -> Void
}

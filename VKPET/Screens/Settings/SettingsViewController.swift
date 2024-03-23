//
//  SettingsViewController.swift
//  VKPET
//
//  Created by Вячеслав Вовк on 23.03.2024.
//


import UIKit

final class SettingsViewController: UIViewController, ViewHostable {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.navigationItem.setHidesBackButton(true, animated: false)
        self.add(hostableView: SettingsView())
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
        self.navigationItem.setHidesBackButton(true, animated: false)
    }
}


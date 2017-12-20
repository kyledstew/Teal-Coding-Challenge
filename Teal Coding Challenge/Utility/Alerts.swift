//
//  Alerts.swift
//  Teal Coding Challenge
//
//  Created by Kyle Stewart on 12/19/17.
//  Copyright © 2017 Kyle Stewart. All rights reserved.
//

import UIKit

class AlertPresenter {
    
    static func standard(title: String, message: String, presenter: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        presenter.present(alert, animated: true, completion: nil)
    }
    
    static func networkError(error: NetworkError, presenter: UIViewController, completion: (() -> ())? = nil) {
        let alert = UIAlertController(title: "Network Error", message: error.message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        presenter.present(alert, animated: true, completion: completion)
    }
    
    static func gameHandleError(error: GameHandleCheckError, presenter: UIViewController) {
        let alert = UIAlertController(title: "Error", message: error.message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        presenter.present(alert, animated: true, completion: nil)
    }
    
    static func promptForGameHandle(presenter: UIViewController, closure: @escaping (String?) -> ()) {
        let alert = UIAlertController(title: "Game Handle Required", message: "Before starting a round, please enter a unique Game Handle.", preferredStyle: .alert)
        alert.addTextField(configurationHandler: nil)
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
        alert.addAction(UIAlertAction(title: "Go", style: .default, handler: { (_) in
            guard let textField = alert.textFields?.first else { return }
            closure(textField.text)
        }))
        presenter.present(alert, animated: true, completion: nil)
    }
    
}

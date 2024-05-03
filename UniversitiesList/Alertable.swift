//
//  Alertable.swift
//  UniversitiesList
//
//  Created by Ayman Fathy on 03/05/2024.
//

import UIKit
typealias BasicHandler = () -> Void

protocol Alertable where Self: UIViewController {  }

extension Alertable {
    func showAlert(title: String?,
                   message: String? = nil,
                   handler: BasicHandler? = nil,
                   cancelHandler: BasicHandler? = nil) {
        DispatchQueue.main.async {
            let alertController = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
            if handler != nil {
                alertController.addAction(.init(title:"OK", style: .default, handler: { _ in
                    handler?()
                }))
            }
           if cancelHandler != nil {
                alertController.addAction(.init(title: "OK", style: .cancel) { _ in
                    cancelHandler?()
                    })
            }
            self.present(alertController, animated: true)
        }
    }
}

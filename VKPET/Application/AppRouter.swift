//
//  AppRouter.swift
//  VKPET
//
//  Created by Вячеслав Вовк on 23.03.2024.
//

import UIKit

final class AppRouter {
    
    enum Destination {
        case settings
        case game
    }
    
    enum TransitionType {
        case change
        case push(animated: Bool)
        case present(animated: Bool)
    }
    
    // MARK: - Static
    
    static let shared = AppRouter()
    
    // MARK: - Variables
    
    public let navigationController = UINavigationController()
    private var currentControllerName: String?
    
    // MARK: - Init
    
    private init() {
        self.navigationController.navigationBar.isHidden = true
        self.navigationController.isNavigationBarHidden = true
        
        self.move(to: .settings, type: .change)
    }
    
    // MARK: - Methods
    
    
    func back() {
        DispatchQueue.main.async {
            self.navigationController.popViewController(animated: true)
        }
    }
    
    func move(to destination: AppRouter.Destination, type: AppRouter.TransitionType) {
        var viewController: UIViewController? {
            switch destination {
            case .settings:
                return SettingsViewController()
            case .game:
                return GameViewController()
            }
            
        }
        
        
        DispatchQueue.main.async {
            if let viewController {
                switch type {
                case .change:
                    self.navigationController.setViewControllers([viewController], animated: false)
                case .push(let animated):
                    self.navigationController.pushViewController(viewController, animated: animated)
                case .present(let animated):
                    self.navigationController.present(viewController, animated: animated)
                }
            }
        }
        
    }
    public func setCurrentController(_ controller: UIViewController) {
        if let subsequence = String(describing: controller).split(separator: ":").first,
           let result = subsequence.split(separator: "<").last
        {
            self.currentControllerName = String(result)
        }
    }
    
    public func setCurrentController(_ controllerType: UIViewController.Type) {
        self.currentControllerName = "FaceChecker_UPD." + String(describing: controllerType)
    }
    
    private func controllerName(_ controller: UIViewController?) -> String? {
        if let subsequence = String(describing: controller).split(separator: ":").first,
           let result = subsequence.split(separator: "<").last
        {
            return String(result)
        } else {
            return nil
        }
    }
    
    private func controllerName(_ controllerType: UIViewController.Type) -> String? {
        return "FaceChecker_UPD." + String(describing: controllerType)
    }
}

//
//  ViewHost.swift
//  VKPET
//
//  Created by Вячеслав Вовк on 23.03.2024.
//


import SwiftUI

struct ViewHost {
    static func uiView(from view: some View) -> (UIViewController, UIView) {
        let hostingController = UIHostingController(rootView: view)
        let uiView = hostingController.view!
        uiView.translatesAutoresizingMaskIntoConstraints = false
        return (hostingController, uiView)
    }
}

protocol ViewHostable {
    func add(hostableView: some View)
}

extension ViewHostable where Self: UIViewController {
    func add(hostableView: some View) {
        let (hostingController, uiView) = ViewHost.uiView(from: hostableView)
        self.addChild(hostingController)
        self.view.addSubview(uiView)
        
        NSLayoutConstraint.activate([
            uiView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            uiView.topAnchor.constraint(equalTo: self.view.topAnchor),
            uiView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            uiView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
        
        hostingController.didMove(toParent: self)
    }
}


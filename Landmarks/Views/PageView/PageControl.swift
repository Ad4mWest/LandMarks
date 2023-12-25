//  PageControl.swift
//  Landmarks
//  Created by Adam West on 25.12.2023.

import SwiftUI

struct PageControl: UIViewRepresentable {
    // MARK: Public Properties
    var numberOfpages: Int
    @Binding var currentPage: Int
    
    // MARK: Public methods
    func makeCoordinator() -> Coordinator {
           Coordinator(self)
       }
    
    func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = numberOfpages
        control.addTarget(
                    context.coordinator,
                    action: #selector(Coordinator.updateCurrentPage(sender:)),
                    for: .valueChanged)
        return control
    }
    
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage
    }
    
    // MARK: Coordinator
    class Coordinator: NSObject {
        // MARK: Public Properties
        var control: PageControl
        
        // MARK: Initialization
        init(_ control: PageControl) {
            self.control = control
        }
        
        // MARK: Selectors
        @objc
        func updateCurrentPage(sender: UIPageControl) {
            control.currentPage = sender.currentPage
        }
    }
}

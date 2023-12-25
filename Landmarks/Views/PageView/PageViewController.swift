//  PageViewController.swift
//  Landmarks
//  Created by Adam West on 24.12.2023.

import SwiftUI
import UIKit

struct PageViewController<Page: View>: UIViewControllerRepresentable {
    typealias delegateSource = UIPageViewControllerDataSource & UIPageViewControllerDelegate
    
    // MARK: Public Properties
    var pages: [Page]
    @Binding var currentPage: Int

    // MARK: Public methods
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal)
        pageViewController.dataSource = context.coordinator
        return pageViewController
    }

    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        pageViewController.setViewControllers(
            [context.coordinator.controllers[currentPage]], direction: .forward, animated: true)
    }

    // MARK: Coordinator from UIKit
    class Coordinator: NSObject, delegateSource {
        // MARK: Public Properties
        var parent: PageViewController
        var controllers = [UIViewController]()

        // MARK: Initialization
        init(_ pageViewController: PageViewController) {
            parent = pageViewController
            controllers = parent.pages.map { UIHostingController(rootView: $0) }
        }

        // MARK: Public methods
        func pageViewController(
            _ pageViewController: UIPageViewController,
            viewControllerBefore viewController: UIViewController) -> UIViewController?
        {
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index == 0 {
                return controllers.last
            }
            return controllers[index - 1]
        }

        func pageViewController(
            _ pageViewController: UIPageViewController,
            viewControllerAfter viewController: UIViewController) -> UIViewController?
        {
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index + 1 == controllers.count {
                return controllers.first
            }
            return controllers[index + 1]
        }
        
        func pageViewController(
                   _ pageViewController: UIPageViewController,
                   didFinishAnimating finished: Bool,
                   previousViewControllers: [UIViewController],
                   transitionCompleted completed: Bool) {
                   if completed,
                      let visibleViewController = pageViewController.viewControllers?.first,
                      let index = controllers.firstIndex(of: visibleViewController) {
                       parent.currentPage = index
                   }
               }
    }
}

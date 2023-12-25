//  PageView.swift
//  Landmarks
//  Created by Adam West on 25.12.2023.

import SwiftUI

struct PageView<Page: View>: View {
    // MARK: Public Properties
    var pages: [Page]
    
    // MARK: Private properties
    @State private var currentPage = 0
    
    // MARK: Lifecycle
    var body: some View {
        ZStack(alignment: .bottomTrailing ) {
            PageViewController(pages: pages, currentPage: $currentPage)
            PageControl(numberOfpages: pages.count, currentPage: $currentPage)
                .frame(width: CGFloat(pages.count * 18))
                .padding(.trailing)
        }
        .aspectRatio(3/2, contentMode: .fit)
    }
}

#Preview {
    PageView(pages: ModelData().features.map { FeatureCard(landmark: $0) })
}

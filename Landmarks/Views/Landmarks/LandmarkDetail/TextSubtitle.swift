//  TextSubtitle.swift
//  Landmarks
//  Created by Adam West on 22.12.2023.

import SwiftUI

struct TextSubtitle: View {
    // MARK: Public Properties
    var textSubtitleModel: TextSubtitleModel
    
    // MARK: Lifecycle
    var body: some View {
        VStack(alignment: .leading) {
            Text("About " + textSubtitleModel.name)
                .font(.title2)
            HStack {
                Text(textSubtitleModel.description)
                Spacer()
            }
            .font(.subheadline)
            .foregroundStyle(.secondary)
        }.padding()
    }
}

#Preview {
    TextSubtitle(textSubtitleModel: TextSubtitleModel(name: "Adam", description: "Descriptive text goes here."))
}

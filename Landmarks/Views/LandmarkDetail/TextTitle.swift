//  TextTitle.swift
//  Landmarks
//  Created by Adam West on 22.12.2023.

import SwiftUI

struct TextTitle: View {
    var textTitleModel: TextTitleModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(textTitleModel.name)
                .font(.title)
            HStack {
                Text(textTitleModel.place)
                Spacer()
                Text(textTitleModel.state)
            }
            .font(.subheadline)
            .foregroundStyle(.secondary)
        }.padding()
    }
}

#Preview {
    TextTitle(textTitleModel: TextTitleModel(name: "Turtle Rock", place: "Joshua Tree National Park", state: "California"))
}

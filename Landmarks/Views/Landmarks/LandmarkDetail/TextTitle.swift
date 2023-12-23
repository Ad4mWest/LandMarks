//  TextTitle.swift
//  Landmarks
//  Created by Adam West on 22.12.2023.

import SwiftUI

struct TextTitle: View {
    @Environment(ModelData.self) var modelData
    var landmark: Landmark
    
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var textTitleModel: TextTitleModel
    
    var body: some View {
        @Bindable var modelData = modelData
        
        VStack(alignment: .leading) {
            HStack {
                Text(textTitleModel.name)
                    .font(.title)
                FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
            }
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
    let modelData = ModelData()
    
    return TextTitle(landmark: ModelData().landmarks[0], textTitleModel: TextTitleModel(name: "Turtle Rock", place: "Joshua Tree National Park", state: "California"))
        .environment(modelData)
}

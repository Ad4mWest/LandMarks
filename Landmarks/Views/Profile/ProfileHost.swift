//  ProfileHost.swift
//  Landmarks
//  Created by Adam West on 24.12.2023.

import SwiftUI

struct ProfileHost: View {
    // MARK: Public Properties
    @Environment(\.editMode) var editMode
    @Environment(ModelData.self) var modelData
    
    // MARK: Private properties
    @State private var draftProfile = Profile.default
    
    // MARK: Lifecycle
    var body: some View {
        VStack {
            HStack {
                if editMode?.wrappedValue == .active {
                    Button("Cancel", role: .cancel) {
                        draftProfile = modelData.profile
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                Spacer()
                EditButton()
            }
            
            if editMode?.wrappedValue == .inactive {
                ProfileSummary(profile: modelData.profile)
            } else {
                ProfileEditor(profile: $draftProfile)
                    .onAppear {
                        draftProfile = modelData.profile
                    }
                    .onDisappear {
                        modelData.profile = draftProfile
                    }
            }
        }
        .padding()
    }
}


#Preview {
    ProfileHost()
        .environment(ModelData())
}

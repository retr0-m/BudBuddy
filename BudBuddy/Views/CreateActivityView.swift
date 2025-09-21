//
//  CreateActivityView.swift
//  BudBuddy
//
//  Created by Matteo Cola on 06.09.2025.
//

import SwiftUI

struct CreateActivityView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var title: String = ""
    @State private var subtitle: String = ""
    @State private var tags: String = ""
    @State private var isPublic: Bool = true

    var onSave: (Activity) -> Void

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Activity Info")) {
                    TextField("Title", text: $title)
                    TextEditor(text: $subtitle)
                        .frame(height: 80)
                    TextField("Tags (comma separated)", text: $tags)
                    Toggle("Public", isOn: $isPublic)
                }
            }
            .navigationTitle("Create Activity")
            .navigationBarItems(
                leading: Button("Cancel") { presentationMode.wrappedValue.dismiss() },
                trailing: Button("Save") {
                    guard !title.isEmpty else { return }
                    let newActivity = Activity(
                        id: UUID(),
                        title: title,
                        subtitle: subtitle,
                        tags: tags.split(separator: ",").map { $0.trimmingCharacters(in: .whitespaces) },
                        
                        isPublic: isPublic,
                        likes: 0,
                        isFavorite: false,
                        details: []
                    )
                    onSave(newActivity)
                    presentationMode.wrappedValue.dismiss()
                }
            )
        }
    }
}

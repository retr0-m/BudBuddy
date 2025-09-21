import SwiftUI

struct StrainsTestView: View {
    @State private var strains: [Strain] = []
    @State private var isLoading = false

    var body: some View {
        NavigationView {
            VStack {
                if strains.isEmpty && !isLoading {
                    Text("No strains loaded")
                        .foregroundColor(.secondary)
                        .padding()
                }
                List(strains) { strain in
                    VStack(alignment: .leading, spacing: 4) {
                        Text(strain.name)
                            .font(.headline)
                        Text(strain.type.capitalized)
                            .font(.subheadline)
                        Text("Rating: \(strain.rating)")
                            .font(.caption)
                        if !strain.effects.isEmpty {
                            Text("Effects: \(strain.effects.joined(separator: ", "))")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        if !strain.flavors.isEmpty {
                            Text("Flavors: \(strain.flavors.joined(separator: ", "))")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        if !strain.description.isEmpty {
                            VStack(alignment: .leading, spacing: 2) {
                                ForEach(strain.description, id: \.self) { desc in
                                    Text(desc)
                                        .font(.caption2)
                                        .foregroundColor(.gray)
                                }
                            }
                            .padding(.top, 2)
                        }
                    }
                    .padding(.vertical, 4)
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Strains Test")
            .overlay(
                Group {
                    if isLoading {
                        ProgressView("Loading...")
                            .progressViewStyle(CircularProgressViewStyle(tint: .green))
                            .scaleEffect(1.2)
                    }
                }
            )
            .onAppear {
                guard strains.isEmpty else { return }
                isLoading = true
                DispatchQueue.global(qos: .userInitiated).async {
                    let loaded = loadStrainsFromJSONWithDebug()
                    DispatchQueue.main.async {
                        self.strains = loaded
                        self.isLoading = false
                    }
                }
            }
        }
    }
}

struct StrainsTestView_Previews: PreviewProvider {
    static var previews: some View {
        StrainsTestView()
    }
}

// Helper to wrap loading and print debug info
func loadStrainsFromJSONWithDebug() -> [Strain] {
    #if DEBUG
    let path = Bundle.main.path(forResource: "strains", ofType: "json") ?? "<not found>"
    print("DEBUG: Loading strains from JSON path: \(path)")
    #endif
    let loaded = loadStrainsFromJSON()
    #if DEBUG
    print("DEBUG: Loaded \(loaded.count) strains from JSON.")
    #endif
    return loaded
}

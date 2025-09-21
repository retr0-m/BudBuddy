import Foundation

struct Strain: Identifiable, Decodable {
    let id = UUID()
    let name: String
    let type: String
    let rating: Double
    let effects: [String]
    let flavors: [String]
    let description: [String]

    enum CodingKeys: String, CodingKey {
        case name = "Strain"
        case type = "Type"
        case rating = "Rating"
        case effects = "Effects"
        case flavors = "Flavor"
        case description = "Description"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        type = try container.decode(String.self, forKey: .type)
        rating = try container.decode(Double.self, forKey: .rating)

        let effectsString = try container.decode(String.self, forKey: .effects)
        effects = effectsString.split(separator: ",").map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }

        let flavorsString = try container.decodeIfPresent(String.self, forKey: .flavors) ?? ""
        flavors = flavorsString.isEmpty ? [] : flavorsString.split(separator: ",").map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }

        let descriptionString = try container.decodeIfPresent(String.self, forKey: .description) ?? ""
        description = descriptionString.isEmpty ? [] : descriptionString.split(separator: "\n").map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
    }
}

func loadStrainsFromJSON(filename: String = "strains") -> [Strain] {
    guard let url = Bundle.main.url(forResource: filename, withExtension: "json") else {
        print("JSON file not found")
        return []
    }

    do {
        print("found the json file")
        let data = try Data(contentsOf: url)
        print(data)
        let decoder = JSONDecoder()
        let strains = try decoder.decode([Strain].self, from: data)
        print("Successfully loaded \(strains.count) strains")
        return strains
    } catch {
        print("Failed to decode strains: \(error)")
        return []
    }
}

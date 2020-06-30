
import Foundation

struct DataModel: Codable {
    
	let id : String?
	let type : String?
	let date : String?
	let data : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case type = "type"
        case date = "date"
        case data = "data"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        date = try values.decodeIfPresent(String.self, forKey: .date)
        data = try values.decodeIfPresent(String.self, forKey: .data)
    }
}

extension DataModel {
    
    static var getData: Resource<DataModel> = {
        
        guard let url = URL.getData else {
            fatalError("URL is not defined!")
        }
        return Resource<DataModel>(url: url)
    }()
}

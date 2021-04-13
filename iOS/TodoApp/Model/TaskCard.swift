//  Created by 김지선 on 2021/04/09.
import Foundation

struct TaskCard: Codable {
    var id: Int
    var title: String
    var content: String
    var createdTime: String
    var status: Int
    var author: String
}

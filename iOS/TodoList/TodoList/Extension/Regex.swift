import Foundation

extension String {
    func getArrayAfterRegex(regex: String) -> [String] {
        
        do {
            let regex = try NSRegularExpression(pattern: regex)
            let result = regex.matches(in: self,
                                       range: NSRange(self.startIndex..., in: self))
            return result.map {
                String(self[Range($0.range, in: self)!])
            }
        } catch let error {
            print ("invalid regex: \(error.localizedDescription)")
            return []
        }
    }
}

import Foundation

class RegexValidManager {
    private var idList = [String]()
    
    init() {
        NetworkHandler.getData { serverIdList in
            self.idList = serverIdList
        }
    }
    
    // Common Method
    func isEmptyTextField(_ text: String?) -> Bool {
        let textCount = text?.count ?? 0
        return textCount == 0
    }
    
    // ID Method
    func isOverlappedID(_ id: String?) -> Bool {
        guard let userId = id else { return false }
        if !idList.contains(userId) { return true }
        return false
    }
    
    func isValidElementForID(_ id: String?) -> Bool {
        let idElement = id?.getArrayAfterRegex(regex: "[A-Z!@#$%]").count ?? 0
        return idElement == 0
    }
    
    func isValidCountForID(_ id: String?) -> Bool {
        let idCount = id?.getArrayAfterRegex(regex: "[a-z0-9_-]").count ?? 0
        return idCount>=5 && idCount<=20
    }
    
    // Password Method
    func isValidElementForPassword(_ password: String?) -> Bool {
        let element = password?.getArrayAfterRegex(regex: "[!@#$%]").count ?? 0
        return element >= 1
    }
    
    func isValidCountForPassWord(_ password: String?) -> Bool {
        let passCount = password?.getArrayAfterRegex(regex: "[a-zA-Z0-9!@#$%]").count ?? 0
        return passCount >= 8 && passCount <= 16
    }
    
    // PasswordConfirm Method
    func isEqualForPassword(_ firstPassword: String?, _ secondPassword: String?) -> Bool {
        if let password1 = firstPassword, let password2 = secondPassword {
            return password1 == password2
        }
        return false
    }
    
    // Name Method
    func isValidNameCount(_ name: String?) -> Bool {
        let nameTest = name?.getArrayAfterRegex(regex: "[가-힣]").count ?? 0
        return nameTest >= 2
    }
    
    //e-mail Method
    func isValidStateForEmail(_ email: String?) -> Bool {
        guard email != nil else { return false }
        let emailTest = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let pred = NSPredicate(format: "SELF MATCHES %@", emailTest)
        return pred.evaluate(with: email)
    }
    
    //Phone Method
    func isValidStateForPhone(_ phoneNumber: String?) -> Bool {
        guard phoneNumber != nil else { return false }
        let phoneTest = "^010([0-9]{4})([0-9]{4})"
        let pred = NSPredicate(format: "SELF MATCHES %@", phoneTest)
        return pred.evaluate(with: phoneNumber)
    }
}

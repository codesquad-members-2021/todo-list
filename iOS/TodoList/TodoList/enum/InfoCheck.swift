import Foundation

enum IdCheck {
    static let idCount = "5~20자의 영문 소문자, 숫자, 특수문자(_,-)만 사용 가능합니다."
    static let nonSupportedValue = "영문 소문자, 숫자, 특수문자(_,-)만 사용 가능합니다."
    static let doubleCheck = "중복된 아이디입니다."
    static let valid = "사용 가능한 아이디입니다."
}

enum PasswordCheck {
    static let passwordCount = "8~16자의 영문 대/소문자, 숫자, 특수문자(!@#$%)만 사용 가능합니다."
    static let notContainedSpecialCharacters = "반드시 특수문자(!@#$%)가 포함되어야 합니다."
    static let valid = "사용 가능한 비밀번호입니다."
}

enum PasswordConfirmCheck {
    static let notEqul = "비밀번호가 일치하지 않습니다."
    static let valid = "비밀번호가 일치합니다."
}

enum NameCheck{
    static let nameCount = "2자 이상의 한글 이름을 입력해주세요."
    static let valid = "사용 가능한 이름입니다."
}

enum EmailCheck {
    static let inValid = "올바른 형식의 이메일 주소를 입력해주세요."
    static let valid = "사용 가능한 이메일 주소입니다."
}

enum PhoneCheck {
    static let inValid = "올바른 형식의 전화번호를 입력해주세요."
    static let valid = "사용 가능한 전화번호입니다."
}

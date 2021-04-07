import Foundation

enum MainLabelContents {
    static let idLabel = "아이디"
    static let idPlaceholder = " 영문 소문자, 숫자, 특수기호(_,-), 5~20자"
    static let passwordLabel = "비밀번호"
    static let passwordDoubleCheckLabel = "비밀번호 확인"
    static let passwordPlaceHolder = "영문 대/소문자, 숫자, 특수기호(!@#$%), 8~16자"
    static let nameLabel = "이름"
}

enum PrivacyLabelContents {
    static let birthday = "생년월일"
    static let gender = "성별"
    static let genderItems = ["여자", "남자"]
    static let email = "이메일"
    static let cellPhone = "휴대전화"
    static let cellPhonePlaceholder = "- 없이 입력해주세요. 예) 01012345678"
}

enum MainTitleContents {
    static let main = "회원가입"
    static let privacy = "개인정보"
}

enum ButtonTitle {
    static let next = "다음"
    static let back = "이전"
}

import Foundation

let EMAIL_REG_EX = "(?=^.{3,32}$)[A-Za-z]{1}[A-Z0-9a-z.-]@[A-Za-z0-9.-]+\\.{1}[A-Za-z]"
let LOGIN_REG_EX = "(?=^.{3,32}$)[A-Za-z]{1}[A-Z0-9a-z.-]*"

fileprivate func isValidEmail(_ email: String) -> Bool {
    let predicate = NSPredicate(format:"SELF MATCHES %@", EMAIL_REG_EX)
    return predicate.evaluate(with: email)
}

fileprivate func isValidUsername(_ username:String) -> Bool {
    let predicate = NSPredicate(format:"SELF MATCHES %@", LOGIN_REG_EX)
    return predicate.evaluate(with: username)
}

func isValidLogin(_ login:String) -> Bool {
    return isValidUsername(login) || isValidEmail(login)
}


let test = readLine()!

print(isValidLogin(test))

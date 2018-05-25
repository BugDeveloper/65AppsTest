import Foundation

class Task4 {
    
    fileprivate static let EMAIL_REG_EX = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    fileprivate static let LOGIN_REG_EX = "(?=^.{3,32}$)[A-Za-z]{1}[A-Z0-9a-z.-]*"
    
    fileprivate func isValidEmail(_ email: String) -> Bool {
        let predicate = NSPredicate(format:"SELF MATCHES %@", Task4.EMAIL_REG_EX)
        return predicate.evaluate(with: email)
    }
    
    fileprivate func isValidUsername(_ username:String) -> Bool {
        let predicate = NSPredicate(format:"SELF MATCHES %@", Task4.LOGIN_REG_EX)
        return predicate.evaluate(with: username)
    }
    
    func isValidLogin(_ login:String) -> Bool {
        return isValidUsername(login) || isValidEmail(login)
    }
    
}

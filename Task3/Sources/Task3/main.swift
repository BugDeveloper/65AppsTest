import Alamofire
import Foundation

var reposData: [AnyObject]? = nil
var errorMessage: String! = ""

print("Print user name:")
let name = readLine()!

let urlPath = String(format: "https://api.github.com/users/\(name)/repos")

let group = DispatchGroup()
group.enter()

Alamofire.request(urlPath).responseJSON { response in
    
    if response.response?.statusCode != 200 {
        if let result = response.result.value as? [String: String] {
            errorMessage = result["message"]!;
        }
    }
    
    if let json = response.result.value as? [AnyObject] {
        reposData = json
    }

    group.leave()
}

group.notify(queue: DispatchQueue.main) {
    
    guard let _ = reposData else {
        guard errorMessage.isEmpty else {
            print("Github responded with an error: \(errorMessage!)")
            exit(0)
        }
        
        print("Illegal input, budd")
        exit(0)
    }
    
    print("Total repos: \(reposData!.count)")
    
    for (_, element) in (reposData?.enumerated())! {
        let name = element["name"] as! String
        print(name)
    }
    
    exit(0)
}

dispatchMain()

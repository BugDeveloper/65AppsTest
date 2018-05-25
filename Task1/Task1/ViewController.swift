
import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var picturesTableView: UITableView!
    
    static let IMAGES_COUNT = 100
    static let LINK = "http://placehold.it/375x150"
    static let UI_IMAGE_TAG = 1;
    
    //YOUR METHOD
    func downloadImage(withURL url: URL, forCell cell: UITableViewCell) {
        getDataFromUrl(url: url, completion: { data, response, error in
            guard let data = data, error == nil else { return }
            
            DispatchQueue.main.async() {
                let imageView = cell.viewWithTag(ViewController.UI_IMAGE_TAG) as! UIImageView
                imageView.image = UIImage(data: data)
            }
        })
    }
    
    func getDataFromUrl(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        let downloadTask = URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            completion(data, response, error)
        })
        downloadTask.resume()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        picturesTableView.delegate = self
        picturesTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ViewController.IMAGES_COUNT
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = picturesTableView.dequeueReusableCell(withIdentifier: "Cell")
        
        var components = URLComponents(string: ViewController.LINK)
        components?.queryItems = [
            URLQueryItem(name: "text", value: String(indexPath.row + 1))
        ]
        
        downloadImage(withURL: (components?.url)!, forCell: cell!)
        
        return cell!
    }
    
}

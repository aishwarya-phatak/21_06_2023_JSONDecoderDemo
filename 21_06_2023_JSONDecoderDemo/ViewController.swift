//
//  ViewController.swift
//  21_06_2023_JSONDecoderDemo
//
//  Created by Vishal Jagtap on 04/08/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var albumTableView: UITableView!
    private let urlString = "https://jsonplaceholder.typicode.com/albums"
    var url : URL?
    var urlRequest : URLRequest?
    var jsonDecoder : JSONDecoder?
    var albums : [Album] = [Album]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        url = URL(string: urlString)
        urlRequest = URLRequest(url: url!)
        initailization()
        registrationOFXIB()
        jsonParsing()
    }
    
    func initailization(){
        albumTableView.dataSource = self
        albumTableView.delegate = self
    }
    
    func registrationOFXIB(){
       let uiNIB = UINib(nibName: "AlbumTableViewCell", bundle: nil)
        self.albumTableView.register(uiNIB, forCellReuseIdentifier: "AlbumTableViewCell")
    }

    func jsonParsing(){
        URLSession.shared.dataTask(with: urlRequest!) { data, response, error in
            
            if(error == nil){
                do{
                    self.albums = try JSONDecoder().decode([Album].self, from: data!)
                }catch{
                    print("There is an error decoding the data")
                }
            }
            DispatchQueue.main.async {
                self.albumTableView.reloadData()
            }
        }.resume()
    }

}

extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        albums.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let albumTableViewCell = self.albumTableView.dequeueReusableCell(withIdentifier: "AlbumTableViewCell", for: indexPath) as! AlbumTableViewCell
        
        albumTableViewCell.idLabel.text = String(albums[indexPath.row].id)
        albumTableViewCell.userIdLabel.text = String(albums[indexPath.row].userId)
        albumTableViewCell.titleLabel.text = albums[indexPath.row].title
        
        return albumTableViewCell
    }
}

extension ViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        170.0
    }
}

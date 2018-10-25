//
//  ViewController.swift
//  Movie-Finder
//
//  Created by Alumno on 25/10/18.
//  Copyright © 2018 Pablo. All rights reserved.
//

import UIKit
import Alamofire

class SearchRequestViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var movieName : String = ""
    
    @IBOutlet weak var txtSearch: UITextField!
    
    @IBAction func textSearch(_ sender: UITextField) {
        Alamofire.request(urlAPI).responseJSON {
            response in
            if let diccionarioRespuesta = response.result.value as? NSDictionary {
                
            }
        }
            
    }
    
    
    
    
    @IBOutlet weak var tbMovies: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


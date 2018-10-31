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
    
    var urlAPI : String = "http://www.omdbapi.com/?apikey=5aec3ba9&s="
    var movieURL: String = ""
    
    
    @IBOutlet weak var txtSearch: UITextField!
    @IBOutlet weak var aiSearch: UIActivityIndicatorView!
    
    @IBAction func tapBuscar(_ sender: UIButton) {
        
        aiSearch.startAnimating()
        
        movieURL = "\(urlAPI)" + txtSearch.text!
        
        Alamofire.request(movieURL).responseJSON {
            response in
            DatosMovie.moviesSearch.removeAll()
            
            var movie: DatosSearchRequest
            
            if let diccionarioRespuesta = response.result.value as? NSDictionary {
                if let arregloSearch = diccionarioRespuesta.value(forKey: "Search") as? NSArray {
                    
                    for indiceSearch in arregloSearch {
                        if let elementoSearch = indiceSearch as? NSDictionary {
                            let movieNombre = elementoSearch.value(forKey: "Title") as? String
                            
                            let movieAño = elementoSearch.value(forKey: "Year") as? Int
                            
                            let movieIMDBID = elementoSearch.value(forKey: "imdbID") as? String
                            
                            movie = DatosSearchRequest(movieNombre: movieNombre!, movieAño: movieAño!, movieimdbID: movieIMDBID!)
                            
                            DatosMovie.moviesSearch.append(movie)
                            
                            self.aiSearch.stopAnimating()
                            self.tbMovies.reloadData()
                        }
                    }
                    
                }
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    
    @IBOutlet weak var tbMovies: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DatosMovie.moviesSearch.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "cellMovie") as! MovieCelda
        celda.lblNombre.text = DatosMovie.moviesSearch[indexPath.row].movieNombre
        celda.lblAño.text = "\(DatosMovie.moviesSearch[indexPath.row].movieAño)"
        
        return celda
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


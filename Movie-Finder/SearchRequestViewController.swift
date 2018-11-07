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
    
    var urlAPI : String = "https://www.omdbapi.com/?apikey=5aec3ba9&s="
    var movieURL: String = ""
    var busqueda : String = ""
    
    @IBOutlet weak var txtSearch: UITextField!
    @IBOutlet weak var aiSearch: UIActivityIndicatorView!
    
    @IBAction func tapBuscar(_ sender: UIButton) {
        
        aiSearch.startAnimating()
        
        busqueda = txtSearch.text!
        
        busqueda = busqueda.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)!
        
        movieURL = "\(urlAPI)" + "\(busqueda)"
        
        Alamofire.request(movieURL).responseJSON {
            response in
            DatosMovie.moviesSearch.removeAll()
            
            var movie: DatosSearchRequest
            
            if let diccionarioRespuesta = response.result.value as? NSDictionary {
                if let arregloSearch = diccionarioRespuesta.value(forKey: "Search") as? NSArray {
                    
                    for indiceSearch in arregloSearch {
                        if let elementoSearch = indiceSearch as? NSDictionary {
                            let Nombre = elementoSearch.value(forKey: "Title") as? String
                            
                            let Año = elementoSearch.value(forKey: "Year") as? String
                            
                            let IMDBID = elementoSearch.value(forKey: "imdbID") as? String
                            
                            movie = DatosSearchRequest(movieNombre: Nombre!, movieAño: Año!, movieimdbID: IMDBID!)
                            
                            DatosMovie.moviesSearch.append(movie)
                            
                            self.tbMovies.reloadData()
                            self.aiSearch.stopAnimating()
                        }
                    }
                    
                }
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
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

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToDetalle" {
            let destino = segue.destination as? SearchResultsViewController
            
            destino?.movie = DatosMovie.moviesSearch[(tbMovies.indexPathForSelectedRow?.row)!]
        }
    }
    
    
}


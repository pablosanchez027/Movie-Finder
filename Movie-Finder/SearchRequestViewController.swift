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
    
    @IBOutlet weak var txtSearch: UITextField!
    
    @IBAction func textSearch(_ sender: UITextField) {
        Alamofire.request(urlAPI).responseJSON {
            response in
            if let diccionarioRespuesta = response.result.value as? NSDictionary {
                if let arregloSearch = diccionarioRespuesta.value(forKey: "Search") as? NSArray {
                    
                    for indiceSearch in arregloSearch {
                        let elementoSearch = indiceSearch as? NSDictionary {
                            if let movieNombre = elementoSearch?.value(forKey: "Title") as? String {
                                DatosMovies.moviesSearch.append(movieNombre: movieNombre)
                            }
                            if let movieAño = elementoSearch?.value(forKey: "Year") as? Int {
                                DatosMovies.moviesSearch.append(movieAño: movieAño)
                            }
                            if let movieIMDBID = elementoSearch?.value(forKey: "imdbID") as? String {
                                DatosMovies.moviesSearch.append(movieIMDBID: movieIMDBID)
                            }
                        }
                    }
                    
                }
            }
        }
            
    }
    
    
    
    
    @IBOutlet weak var tbMovies: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        DatosMovies.moviesSearch.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "cellMovie") as! MovieCelda
        celda.lblNombre.text = DatosMovies.moviesSearch[indexPath.row].movieNombre
        celda.lblAño.text = "\(DatosMovies.moviesSearch[indexPath.row].movieAño)"
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


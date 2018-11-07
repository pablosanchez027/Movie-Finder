//
//  SearchResultsViewController.swift
//  Movie-Finder
//
//  Created by Alumno on 25/10/18.
//  Copyright © 2018 Pablo. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import AlamofireImage

class SearchResultsViewController: UIViewController {
    
    var urlAPI : String = "https://www.omdbapi.com/?apikey=5aec3ba9&i="
    var movieURL: String = ""
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblAño: UILabel!
    @IBOutlet weak var lblDirector: UILabel!
    @IBOutlet weak var lblDuracion: UILabel!
    @IBOutlet weak var lblRating: UILabel!
    @IBOutlet weak var lblGenero: UILabel!
    @IBOutlet weak var imgPoster: UIImageView!
    
    var movie: DatosSearchRequest?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let movieSeleccionada = movie {
            movieURL = "\(urlAPI)" + movieSeleccionada.movieimdbID
            
            Alamofire.request(movieURL).responseJSON {
                response in
                if let diccionarioRespuesta = response.result.value as? NSDictionary {
                    if let movieTitle = diccionarioRespuesta.value(forKey: "Title") as? String {
                        self.lblTitle.text = movieTitle
                    }
                    if let movieAño = diccionarioRespuesta.value(forKey: "Year") as? String {
                        self.lblAño.text = movieAño
                    }
                    if let movieDirector = diccionarioRespuesta.value(forKey: "Director") as? String {
                        self.lblDirector.text = movieDirector
                    }
                    if let movieDuracion = diccionarioRespuesta.value(forKey: "Runtime") as? String {
                        self.lblDuracion.text = movieDuracion
                    }
                    if let movieRating = diccionarioRespuesta.value(forKey: "Metascore") as? String {
                        self.lblRating.text = movieRating
                    }
                    if let movieGenero = diccionarioRespuesta.value(forKey: "Genre") as? String {
                        self.lblGenero.text = movieGenero
                    }
                    if let moviePosterURL = diccionarioRespuesta.value(forKey: "Poster") as? String {
                        Alamofire.request(moviePosterURL).responseImage {
                            response in
                            self.imgPoster.image = response.result.value
                        }
                    }
                }
            }
        }
    }
    
    
    @IBAction func tapBack(_ sender: Any) {
       self.dismiss(animated: true, completion: nil)
    }
    
    
}

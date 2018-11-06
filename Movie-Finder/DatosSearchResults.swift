//
//  DatosSearchResults.swift
//  Movie-Finder
//
//  Created by Alumno on 25/10/18.
//  Copyright © 2018 Pablo. All rights reserved.
//

import Foundation
import UIKit

class DatosSearchResults {
    var movieNombre: String = ""
    var movieAño: String = ""
    var movieDirector: String = ""
    var movieDuracion: String = ""
    var movieRating: String = ""
    var movieGenero: String = ""
    
    init(movieNombre: String, movieAño: String, movieDirector: String, movieDuracion: String, movieRating: String, movieGenero: String) {
        self.movieNombre = movieNombre
        self.movieAño = movieAño
        self.movieDirector = movieDirector
        self.movieDuracion = movieDuracion
        self.movieRating = movieRating
        self.movieGenero = movieGenero
    }
    
}

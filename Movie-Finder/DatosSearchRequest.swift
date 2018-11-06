//
//  DatosSearchRequestView.swift
//  Movie-Finder
//
//  Created by Alumno on 25/10/18.
//  Copyright © 2018 Pablo. All rights reserved.
//

import Foundation
import UIKit

class DatosSearchRequest {
    var movieNombre: String
    var movieAño: String
    var movieimdbID: String
    
    init() {
        movieNombre = ""
        movieAño = ""
        movieimdbID = ""
    }
    
    init(movieNombre : String, movieAño: String, movieimdbID: String) {
        self.movieNombre = movieNombre
        self.movieAño = movieAño
        self.movieimdbID = movieimdbID
    }
}

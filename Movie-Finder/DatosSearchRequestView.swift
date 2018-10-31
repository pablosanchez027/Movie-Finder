//
//  DatosSearchRequestView.swift
//  Movie-Finder
//
//  Created by Alumno on 25/10/18.
//  Copyright © 2018 Pablo. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class DatosSearchRequestView {
    var movieNombre: String
    var movieAño: Int
    var movieimdbID: String
    
    init() {
        movieNombre = ""
        movieAño = 0
        movieimdbID = ""
    }
    
    init(movieNombre : String, movieAño: Int, movieimdbID: String) {
        self.movieNombre = movieNombre
        self.movieAño = movieAño
        self.movieimdbID = movieimdbID
    }
}

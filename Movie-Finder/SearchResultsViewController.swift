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

class SearchResultsViewController: UIViewController {
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblAño: UILabel!
    @IBOutlet weak var lblDirector: UILabel!
    @IBOutlet weak var lblDuracion: UILabel!
    @IBOutlet weak var lblRating: UILabel!
    @IBOutlet weak var lblGenero: UILabel!
    
    var movie: DatosSearchRequest?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let movieSeleccionada = movie {
            
        }
    }
}

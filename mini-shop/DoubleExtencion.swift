//
//  DoubleExtencion.swift
//  mini-shop
//
//  Created by Carlos Daniel Hernandez Chauteco on 3/15/19.
//  Copyright © 2019 equipo. All rights reserved.
//

import Foundation
extension Double
{
    func truncate(places : Int)-> Double
    {
        return Double(floor(pow(10.0, Double(places)) * self)/pow(10.0, Double(places)))
    }
}

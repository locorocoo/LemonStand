//
//  Factory.swift
//  LemonadeStand
//
//  Created by Yi Chen on 12/26/14.
//  Copyright (c) 2014 YC. All rights reserved.
//

import Foundation
import UIKit

class Factory {
    class func generatRandomWeather() -> Weather {
        var random = Int(arc4random_uniform(UInt32(3)))
        var weather:Weather
        switch random {
        case 0:
            weather = Weather(todaysWeather: "Cold",weatherImage: UIImage(named: "Cold"))
        case 1:
            weather = Weather(todaysWeather: "Mild", weatherImage: UIImage(named: "Mild"))
        case 2:
            weather = Weather(todaysWeather: "Warm", weatherImage: UIImage(named: "Warm"))
        default:
            weather = Weather(todaysWeather: "Warm", weatherImage: UIImage(named: "Warm"))
        }
        return weather
    }
    
    class func generatNumberOfRandomPeople(num: Int, weather: Weather) -> [Person] {
        
        var numberOfPerson:Int = num
        var firstBounds:CGFloat = 0.4
        var secondBounds:CGFloat = 0.6
        
        var personArrays:[Person] = []

        if weather.todaysWeather == "Cold" {
            numberOfPerson -= 3
        } else if weather.todaysWeather == "Warm" {
            numberOfPerson += 4
        }
        
        if numberOfPerson < 0 {
            numberOfPerson = 0
        }
        
        for var i = 0; i < num; i++ {
            var rand:CGFloat = CGFloat(Float(arc4random()) / Float(UINT32_MAX))
            personArrays.append(Person(tastPreference: rand))
        }
        return personArrays
    }
}
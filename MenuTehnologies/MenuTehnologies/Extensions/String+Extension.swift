//
//  String+Extension.swift
//  MenuTehnologies
//
//  Created by aleksandar.aleksic on 6.10.22..
//

import Foundation

extension String{

    func toInt()-> Int{
        if self.contains(":"){
            let hours = self.prefix(2)
            return Int(hours) ?? 0
        }

        return Int(self) ?? 0
    }

    
}

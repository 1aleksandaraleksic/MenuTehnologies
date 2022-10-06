//
//  Date+Extension.swift
//  MenuTehnologies
//
//  Created by aleksandar.aleksic on 6.10.22..
//

import Foundation

extension Date {
    func dayNumberInWeek() -> Int? {
        return (Calendar.current.dateComponents([.weekday], from: self).weekday ?? 0) - 1
    }

}

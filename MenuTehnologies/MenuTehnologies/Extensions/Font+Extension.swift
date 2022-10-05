//
//  Font+Extension.swift
//  MenuTehnologies
//
//  Created by aleksandar.aleksic on 5.10.22..
//

import SwiftUI

extension Font{
    public static func circularStdBold(size: CGFloat = 28) -> Font {
        return Font(UIFont(name: "Circular-Std-bold", size: size) ?? UIFont.systemFont(ofSize: size, weight: UIFont.Weight(rawValue: 700)))
    }

    public static func circularStdSemiBold(size: CGFloat = 17) -> Font {

        return Font(UIFont(name: "Circular-Std-semibold", size: size) ?? UIFont.systemFont(ofSize: size, weight: UIFont.Weight(rawValue: 400)))
    }

    public static func circularStdRegular(size: CGFloat = 14) -> Font {
        return Font(UIFont(name: "Circular-Std-regular", size: size) ?? UIFont.systemFont(ofSize: size, weight: UIFont.Weight(rawValue: 400)))
    }
}

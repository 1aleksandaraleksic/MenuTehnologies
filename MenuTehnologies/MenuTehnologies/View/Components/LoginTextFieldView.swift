//
//  LoginTextFieldView.swift
//  MenuTehnologies
//
//  Created by aleksandar.aleksic on 4.10.22..
//

import SwiftUI

struct LoginTextFieldView: View {
    @State var placeholder: String
    @Binding var text: String

    var body: some View {
        VStack{
            TextField(placeholder, text: $text)

            HSeparatorView()

        }
        .padding([.leading, .trailing], 24)
    }
}

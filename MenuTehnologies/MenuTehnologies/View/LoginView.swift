//
//  LoginView.swift
//  MenuTehnologies
//
//  Created by aleksandar.aleksic on 4.10.22..
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel: LoginViewModel = LoginViewModel()

    @State var email: String = "test@testmenu.app"
    @State var password: String = "test1234"

    var body: some View {
        VStack(spacing: 0) {
            VStack{

                Image("login")
                    .imageScale(.large)

            }
            .frame(maxHeight: .infinity)

            VStack(spacing: 20){
                Text("The easiest way to order")
                    .font(.circularStdBold())
                Text("No lines. No waiting.")
            }

            VStack(spacing:40){
                LoginTextFieldView(placeholder: "Email", text: $email)
                    .padding(.bottom, 20)
                LoginTextFieldView(placeholder: "Password", text: $password)
                    .padding(.bottom, 20)
                Button{
                    viewModel.login(email: email, password: password)
                } label: {
                    Text("Sign in")
                        .frame(height: 56)
                        .frame(maxWidth: .infinity)
                        .font(.circularStdBold(size: 20))
                }
                .padding([.leading, .trailing], 12)
                .background(Color.mainColor)
                .foregroundColor(.white)
                .cornerRadius(8)
            }
            .frame(maxHeight: .infinity)
            .fullScreenCover(isPresented: self.$viewModel.isLoggedIn, content: { 
                VenueListView()
            })
        }
        .frame(
              minWidth: 0,
              maxWidth: .infinity,
              minHeight: 0,
              maxHeight: .infinity,
              alignment: .center
            )
        .padding()
    }
}

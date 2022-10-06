//
//  LoginViewModel.swift
//  MenuTehnologies
//
//  Created by aleksandar.aleksic on 5.10.22..
//

import Foundation

class LoginViewModel: ObservableObject{
    @Published var isLoggedIn: Bool = false

    func login(email: String, password: String){
        guard isValidEmail(email) else { return }

        if let jsonData = try? JSONEncoder().encode(LoginModel(email: email, password: password)){
            guard let urlRequest: URLRequest = Constants.shared.loginURL(jsonData: jsonData) else { return }

            URLSession.shared.dataTask(with: urlRequest) { data, response, error in
                guard let _ = data, error == nil else {
                    return
                }
                
                if let httpResponse = response as? HTTPURLResponse,
                   httpResponse.statusCode == 200{
                    DispatchQueue.main.async {
                        self.isLoggedIn = true
                    }
                }
            }.resume()
        }
    }

    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}

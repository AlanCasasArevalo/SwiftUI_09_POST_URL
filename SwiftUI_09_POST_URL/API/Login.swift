
import Foundation
import SwiftUI
import Combine

class Login: ObservableObject {
    
    var didChange = PassthroughSubject<Login, Never>()
    
    @Published var authentication = 0 {
        didSet {
            didChange.send(self)
        }
    }
    
    func loginRequest(email: String, password: String) {
        guard let url = URL(string: "https://reqres.in/api/login") else { return }
        let bodyParams: [String: String] = [
            "email": email,
            "password": password
        ]
        
        let body = try! JSONSerialization.data(withJSONObject: bodyParams)
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        
        request.httpBody = body
        
        // Headers de la API
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error != nil {
                print(error?.localizedDescription)
            } else {
                if let response = response {
                    print(response)
                }
                do {
                    guard let dataDes = data else { return }
                    let result = try JSONDecoder().decode(LoginResponseEntity.self, from: dataDes)
                    if result.error != nil {
                        print(result.error)
                        self.authentication = -1
                    } else {
                        DispatchQueue.main.async {
                            self.authentication = 1
                            print(result.token)
                        }
                    }
                } catch let error as NSError {
                    print(error.localizedDescription)
                }
            }
        }.resume()
    }
    
}

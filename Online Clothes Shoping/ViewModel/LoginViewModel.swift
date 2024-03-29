//
//  LoginViewModel.swift
//  Online Clothes Shoping
//
//  Created by NIBM on 2024-03-25.
//

import Foundation
import Combine

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var isLoading = false
    @Published var errorMessage = ""
    
    private var cancellables = Set<AnyCancellable>()
    
    func login(completion: @escaping (String?) -> Void) {
        guard !email.isEmpty, !password.isEmpty else {
            errorMessage = "Please enter email and password"
            completion(nil)
            return
        }
        
        isLoading = true
        
        let user = User(email: email, password: password)
        let url = URL(string: "http://your-api-url/users/login")! // Replace with your actual API endpoint
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(user)
        
        URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { data, response -> Data in
                guard let httpResponse = response as? HTTPURLResponse,
                      httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: LoginResponse.self, decoder: JSONDecoder())
            .sink(receiveCompletion: { [weak self] completion in
                self?.isLoading = false
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }, receiveValue: { response in
                completion(response.token)
            })
            .store(in: &cancellables)
    }
}

struct LoginResponse: Decodable {
    let token: String
    let userId: String
}


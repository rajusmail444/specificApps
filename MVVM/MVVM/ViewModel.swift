//
//  ViewModel.swift
//  MVVM
//
//  Created by Rajesh Billakanti on 27/11/21.
//

import Foundation

class UserViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var userName: String = ""
    @Published  var email: String = ""
    
    init() {
        fetchUser()
    }
    
    func fetchUser() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let model = try JSONDecoder().decode([User].self, from: data)
                DispatchQueue.main.async {
                    self.name = model.first?.name ?? "No Name"
                    self.userName = model.first?.username ?? "No userName"
                    self.email = model.first?.email ?? "No email"
                }
            }
            catch {
                print("API failed")
            }
        }
        task.resume()
    }
}

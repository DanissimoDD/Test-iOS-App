//
//  NetworkManager.swift
//  Test_test
//
//  Created by Thanos Cynric on 2/22/24.
//

import Foundation

protocol UserDataNetworkManagerProtocol {
    
    func fetchUserData(
        onSuccess: @escaping (UserData) -> Void,
        onFail: @escaping (String) -> Void
    )
}

struct UserDataNetworkManager {
    
    private let userDataUrlString = "https://randomuser.me/api/"
    private let session = URLSession(configuration: .default)
    
    private func handleError(
        data: Data?,
        response: URLResponse?,
        error: Error?,
        onFail: @escaping (String) -> Void
    ) {
        onFail(error?.localizedDescription ?? "Ошибка")
    }
}

extension UserDataNetworkManager: UserDataNetworkManagerProtocol {

    func fetchUserData(
        onSuccess: @escaping (UserData) -> Void,
        onFail: @escaping (String) -> Void
    ) {
        guard let url = URL(string: userDataUrlString) else {
            onFail("Не удалось создать URL")
            return
        }
        let task = session.dataTask(with: url) { data, response, error in
            guard
                error == nil,
                let httpResponse = response as? HTTPURLResponse,
                (httpResponse.statusCode >= 200 && httpResponse.statusCode < 299)
            else {
                handleError(
                    data: data,
                    response: response,
                    error: error,
                    onFail: { error in
                        DispatchQueue.main.async {
                            onFail(error)
                        }
                    }
                )
                return
            }
            guard let data = data else {
                onFail("Ошибка данных")
                return
            }
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let userDataList: UserDataList? = try? decoder.decode(UserDataList.self, from: data)
            guard let userDataList = userDataList, let userData = userDataList.results.first else {
                onFail("Ошибка данных")
                return
            }
            DispatchQueue.main.async {
                onSuccess(userData)
            }
        }
        task.resume()
    }
    
    
}

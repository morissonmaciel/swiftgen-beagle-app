//
//  BeagleConfig.swift
//  BeagleApp
//
//  Created by Morisson Marcel on 06/12/22.
//

import Beagle
import Foundation

class BeagleConfig: BundleProtocol {
    var bundle = Bundle(for: BeagleConfig.self)
    let remoteURL = URL(string: "http://localhost:8181")
    
    func config() {
        var dependencies = BeagleDependencies()
        dependencies.appBundle = self
        dependencies.imageDownloader = self
        dependencies.urlBuilder = UrlBuilder(baseUrl: self.remoteURL)
        
        // Beagle local components registration
        self.registerWidgtes(dependencies.coder)
        self.registerActions(dependencies.coder)
        
        BeagleConfigurator.setup(dependencies: dependencies)
    }
    
    private func registerWidgtes(_ coder: Beagle.CoderProtocol) {
        // Register beagle custom widgets here
    }
    
    private func registerActions(_ coder: Beagle.CoderProtocol) {
        // Register beagle custom actions here
    }
}

extension BeagleConfig: ImageDownloaderProtocol {
    func fetchImage(url: String, additionalData: Beagle.HttpAdditionalData?, completion: @escaping (Result<Data, Beagle.Request.Error>) -> Void) -> Beagle.RequestToken? {
        guard let imageURL = URL(string: url) else { return nil }
        
        let dataTask = URLSession.shared.dataTask(with: URLRequest(url: imageURL)) { data, _, error in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(.decoding(error)))
                }
                
                guard let data = data else { return }
                completion(.success(data))
            }
        }
        
        dataTask.resume()
        return dataTask
    }
    
    
}

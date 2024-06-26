//
//  PlaceVM.swift
//  PlacesAI
//
//  Created by MacBook Pro on 24/04/24.
//

import Foundation
import GoogleGenerativeAI

class PlaceVM: ObservableObject {
    private var geminiModel: GenerativeModel?
    @Published var place: [Place] = []
    @Published var isReady: Bool = false
    
    init() {
//        self.geminiModel = GenerativeModel(name: "gemini-pro", apiKey: Constant.apiKey)
        configureGenerativeModel()
    }
    
    func configureGenerativeModel() {
        Task{
            do {
                let apiKey: String = try await RemoteConfigService.shared.fetchConfig(forKey: .apiKey)
                self.geminiModel = GenerativeModel(name: "gemini-pro", apiKey: apiKey)
                self.isReady = true
            } catch {
                print("Error configuraing GenerativeModel: \(error)")
            }
        }
    }
    
    func getPlaces() async {
        let prompt = Constant.prompt
        
        guard let geminiModel = self.geminiModel else {
            print("Generativ model is not configured")
            return
        }
        
        do {
            let response = try await geminiModel.generateContent(prompt)
            guard let text = response.text, let data = text.data(using: .utf8) else {
                print("🤪 Unable to extract text or convert to data")
                return
            }
            
            place = try JSONDecoder().decode([Place].self, from: data) // Process of decoding
            
        } catch {
            print("⚠️ ERROR fetching places: \(error.localizedDescription)")
        }
    }
    
}

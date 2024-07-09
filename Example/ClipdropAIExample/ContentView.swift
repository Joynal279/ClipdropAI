//
//  ContentView.swift
//  ClipdropAIExample
//
//  Created by Joynal Abedin on 9/7/24.
//

import SwiftUI
import ClipdropAI

struct ContentView: View {
    
    @State private var apiKey: String = "YOUR_API_KEY_HERE"
    @State private var processedImage: UIImage?
    @State private var originalImage: UIImage?
    @State private var maskImage: UIImage?
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

//MARK: - CLEAN UP IMAGE
extension ContentView {
    private func getCleanUpImage(){
        if let originalImage = originalImage, let maskImage = maskImage {
            ClipDrop.shared.cleanUpImageRequest(
                apiKey: apiKey,
                image: originalImage,
                mask: maskImage)
            { success, message, imageData in
                if success { self.processedImage = imageData }
                else{ print(message as Any) }
            }
        }
    }
}

//MARK: - IN PAINTING IMAGE
extension ContentView {
    private func getInPaintingImage(){
        if let originalImage = originalImage, let maskImage = maskImage {
            ClipDrop.shared.paintImageRequest(
                apiKey: apiKey,
                image: originalImage,
                mask: maskImage,
                text: "A woman with a blue color shari")
            { success, message, imageData in
                if success { self.processedImage = imageData }
                else{ print(message as Any) }
            }
        }
    }
}

//MARK: - RE-IMAGINE IMAGE
extension ContentView {
    private func getReImagineImage(){
        if let originalImage = originalImage {
            ClipDrop.shared.reImagineImage(
                apiKey: apiKey,
                image: originalImage)
            { success, message, imageData in
                if success { self.processedImage = imageData }
                else{ print(message as Any) }
            }
        }
    }
}

//MARK: - REMOVE BACKGROUND IMAGE
extension ContentView {
    
}

//MARK: - REMOVE TEXT IMAGE
extension ContentView {
    
}

//MARK: - REPLACE BACKGROUND IMAGE
extension ContentView {
    
}

//MARK: - SKETCH TO IMAGE
extension ContentView {
    
}

//MARK: - TEXT TO IMAGE
extension ContentView {
    
}

//MARK: - UN-CROP IMAGE
extension ContentView {
    
}

//MARK: - UP-SCALLING IMAGE
extension ContentView {
    
}


//MARK: - PREVIEW
#Preview {
    ContentView()
}

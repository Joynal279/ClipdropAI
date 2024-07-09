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
    private func getRemoveBgImage(){
        if let originalImage = originalImage {
            ClipDrop.shared.removeBGRequest(
                apiKey: apiKey,
                image: originalImage)
            { success, message, imageData in
                if success { self.processedImage = imageData }
                else{ print(message as Any) }
            }
        }
    }
}

//MARK: - REMOVE TEXT IMAGE
extension ContentView {
    private func getRemoveTextImage(){
        if let originalImage = originalImage {
            ClipDrop.shared.removeBGRequest(
                apiKey: apiKey,
                image: originalImage)
            { success, message, imageData in
                if success { self.processedImage = imageData }
                else{ print(message as Any) }
            }
        }
    }
}

//MARK: - REPLACE BACKGROUND IMAGE
extension ContentView {
    private func getReplaceBgImage(){
        if let originalImage = originalImage {
            ClipDrop.shared.replaceBGRequest(
                apiKey: apiKey,
                image: originalImage,
                text: "YOUR_PROMPT_HERE")
            { success, message, imageData in
                if success { self.processedImage = imageData }
                else{ print(message as Any) }
            }
        }
    }
}

//MARK: - SKETCH TO IMAGE
extension ContentView {
    private func getSketchToImage(){
        if let originalImage = originalImage {
            ClipDrop.shared.sketchToImageRequest(
                apiKey: apiKey,
                image: originalImage,
                text: "YOUR_PROMPT_HERE")
            { success, message, imageData in
                if success { self.processedImage = imageData }
                else{ print(message as Any) }
            }
        }
    }
}

//MARK: - TEXT TO IMAGE
extension ContentView {
    private func getTextToImage(){
        ClipDrop.shared.textToImageRequest(
            apiKey: apiKey,
            text: "YOUR_PROMPT_HERE")
        { success, message, imageData in
            if success { self.processedImage = imageData }
            else{ print(message as Any) }
        }
    }
}

//MARK: - UN-CROP IMAGE
extension ContentView {
    private func getUnCropImage(){
        if let originalImage = originalImage {
            ClipDrop.shared.unCropImageRequest(
                apiKey: apiKey,
                image: originalImage)
            { success, message, imageData in
                if success { self.processedImage = imageData }
                else{ print(message as Any) }
            }
        }
    }
}

//MARK: - UP-SCALLING IMAGE
extension ContentView {
    private func getUpScaleImage(){
        if let originalImage = originalImage {
            ClipDrop.shared.upScallingImageRequest(
                apiKey: apiKey,
                image: originalImage,
                width: "50",
                height: 50)
            { success, message, imageData in
                if success { self.processedImage = imageData }
                else{ print(message as Any) }
            }
        }
    }
}


//MARK: - PREVIEW
#Preview {
    ContentView()
}

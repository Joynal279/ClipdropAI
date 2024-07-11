# ClipdropAI

![Toast And Alert](https://github.com/Joynal279/ToastAlertSwiftPackage/assets/44470728/8d49e3db-417a-4775-989e-bc86adfb363a)



## Features

- Cleanup Image
- Image upscaling
- Reimagine
- Remove Background
- Remove Text
- Remove Sketch to image
- Text Inpainting
- Text to Image
- Uncrop

### Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into the `swift` compiler.

Once you have your Swift package set up, adding ToastAlert as a dependency is as easy as adding it to the `dependencies` value of your `Package.swift`.

```swift
Language: SwiftUI
iOS Version: 14.0 or later
dependencies: [
    .package(url: "https://github.com/Joynal279/ClipdropAI.git")
]
```

### Import the framework

First thing is to import the package. See the Installation instructions on how to add the swift package manager to your project.

```swift
import ClipdropAI
```

Once imported ClipdropAI, now you can write code for editing photos

### CLEAN UP IMAGE
```swift
//MARK: - CLEAN UP IMAGE
    ///`1` IMAGE_FILE: - maximum resolution 16 megapixels (JPG OR PNG)
    ///max file size 30 Mb
    ///2. MASK_FILE: - same as originale image_file (PNG)`
    ///mask_file should be BLACK & WHITE  with no gray color. Black color will keep pixels & white will clean up
    ///for get better result mask size will be big.
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
```

### IN PAINTING IMAGE
```swift
//MARK: - IN PAINTING IMAGE
    ///`1` IMAGE_FILE: - maximum resolution 10 megapixels (JPG OR PNG)
    ///max file size 30 Mb
    ///2. MASK_FILE: - same as originale image_file (PNG)`
    ///mask_file should be BLACK & WHITE  with no gray color. Black color will keep pixels & white will clean up
    ///`text_prompt` text field describing what you want to put in the mask image
    ///for get better result mask size will be big.
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
```

### RE-IMAGINE IMAGE
```swift
//MARK: - RE-IMAGINE IMAGE
    ///`1` IMAGE_FILE: - (JPEG , WEBFILE, OR PNG)
    ///with maximum width & height of 1024 pixels
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
```

### REMOVE BACKGROUND IMAGE
```swift
//MARK: - REMOVE BACKGROUND IMAGE
    ///`1` IMAGE_FILE: - maximum resolution 25 megapixels (JPEG , WEBFILE, OR PNG)
    ///Max file size 30 Mb
    ///with maximum width & height of 1024 pixels
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
```

### REMOVE TEXT IMAGE
```swift
//MARK: - REMOVE TEXT IMAGE
    ///`1` IMAGE_FILE: - maximum resolution 16 megapixels (JPG OR PNG)
    ///max file size 30 Mb
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
```

### REPLACE BACKGROUND IMAGE
```swift
//MARK: - REPLACE BACKGROUND IMAGE
    ///`1` IMAGE_FILE: - (JPG , WEBP FILE, OR PNG)
    ///with maximum width & height of 2048 pixels
    ///Max file size 20 Mb
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
```

Here you can show alert message 2 way. There are 2 parameter where you can modify each others:
1. title
2. message

### Show one button alert
```swift
CustomAlert(presentAlert: $presentAlert, alertType: .constant(.oneButton(title: "Do you want to delete?", message: "If you delete this file then you won’t please again check everything"))){
    withAnimation{
        presentAlert.toggle()
    }
    } rightButtonAction: {
        withAnimation{
    presentAlert.toggle()
        }
    }
```

### Show two button alert
```swift
CustomAlert(presentAlert: $presentAlert, alertType: .constant(.twoButton(title: "Do you want to delete?", message: "If you delete this file then you won’t please again check everything"))){
    withAnimation{
        presentAlert.toggle()
    }
    } rightButtonAction: {
        withAnimation{
    presentAlert.toggle()
        }
    }
```

 

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

### SKETCH TO IMAGE
```swift
//MARK: - SKETCH TO IMAGE
    ///`1` IMAGE_FILE: - (JPEG , WEBFILE, OR PNG)
    ///with maximum width & height of 1024 pixels
    ///PROMPT required for content generate
    ///where Max length will be 5000 characteres
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
```

### TEXT TO IMAGE
```swift
//MARK: - TEXT TO IMAGE
    ///PROMPT required for content generate
    ///where Max length will be 1000 characteres
    ///Response image will be 1024*1024 pixels dimensions*
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
```

### UN-CROP IMAGE
```swift
//MARK: - UN-CROP IMAGE
    ///`1` IMAGE_FILE`: - maximum resolution 10 megapixels (JPG OR PNG, Web File)
    ///max file size 30 Mb
    ///_OPTIONAL: `extend_left` maximum 2k, defaults 0`
    ///OPTIONAL: `extend_right` maximum 2k, defaults 0`
    ///OPTIONAL: `extend_up` maximum 2k, defaults 0`
    ///OPTIONAL: `extend_bottom` maximum 2k, defaults 0`
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
```

### UP-SCALLING IMAGE
```swift
//MARK: - UP-SCALLING IMAGE
    ///`1` IMAGE_FILE`: - maximum resolution 16 megapixels (JPG OR PNG, Web File)
    ///max file size 30 Mb`
    ///_`target_width: Integer between 1 & 4096`
    ///`target_height: Integer between 1 & 4096
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
```

 

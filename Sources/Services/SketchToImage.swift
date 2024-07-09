//
//  File.swift
//
//
//  Created by Joynal Abedin on 9/7/24.
//

import SwiftUI
import Alamofire

@available(iOS 14.0, *)
extension ClipDrop {
    ///`1` IMAGE_FILE: - (JPEG , WEBFILE, OR PNG)
    ///with maximum width & height of 1024 pixels
    ///PROMPT required for content generate
    ///where Max length will be 5000 characteres
    public func sketchToImageRequest(apiKey: String, image: UIImage, text: String, completion: @escaping (_ success: Bool, _ message: String?, _ imageData: UIImage?) -> Void) {
        let imageData = image.jpegData(compressionQuality: 0.9)!
        let textData = text.data(using: .utf8)
        
        let headers: HTTPHeaders = [
            "x-api-key": apiKey
        ]
        
        AF.upload(
            multipartFormData: { multipartFormData in
                multipartFormData.append(
                    imageData,
                    withName: "sketch_file",
                    fileName: "owl-sketch.jpg",
                    mimeType: "image/jpeg"
                )
                multipartFormData.append(textData!, withName: "prompt")
            },
            to: "https://clipdrop-api.co/sketch-to-image/v1/sketch-to-image",
            headers: headers
        )
        .validate()
        .responseData(queue: .global()) { response in
            switch response.result {
            case .success: do {
                if let dataSafe = response.data, let imageReceived = UIImage.init(data: dataSafe) {
                    completion(true, String.init(data: dataSafe, encoding: .utf8), imageReceived)
                } else {
                    if let dataSafe = response.data {
                        completion(false, String.init(data: dataSafe, encoding: .utf8), nil)
                    }
                }
            }
            case .failure(_):
                if let dataSafe = response.data {
                    completion(false, String.init(data: dataSafe, encoding: .utf8), nil)
                }
            }
        }
    }
    
}

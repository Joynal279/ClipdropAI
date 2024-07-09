//
//  File.swift
//
//
//  Created by Joynal Abedin on 9/7/24.
//

import SwiftUI
import Alamofire

@available(iOS 14.0, *)
public class ClipDrop {
    
    public static let shared = ClipDrop()
    
    private init() {}
    
    ///`1` IMAGE_FILE: - maximum resolution 10 megapixels (JPG OR PNG)
    ///max file size 30 Mb
    ///2. MASK_FILE: - same as originale image_file (PNG)`
    ///mask_file should be BLACK & WHITE  with no gray color. Black color will keep pixels & white will clean up
    ///`text_prompt` text field describing what you want to put in the mask image
    ///for get better result mask size will be big.
    public func paintImageRequest(apiKey: String, image: UIImage, mask: UIImage, text: String, completion: @escaping (_ success: Bool, _ message: String?, _ imageData: UIImage?) -> Void) {
        let imageData = image.jpegData(compressionQuality: 0.9)!
        let maskData = mask.jpegData(compressionQuality: 0.9)!
        let textData = text.data(using: .utf8)
        
        let headers: HTTPHeaders = [
            "x-api-key": apiKey
        ]
        
        AF.upload(
            multipartFormData: { multipartFormData in
                multipartFormData.append(
                    imageData,
                    withName: "image_file",
                    fileName: "image.jpg",
                    mimeType: "image/jpeg"
                )
                multipartFormData.append(
                    maskData,
                    withName: "mask_file",
                    fileName: "mask.png",
                    mimeType: "image/jpeg"
                )
                multipartFormData.append(textData!, withName: "text_prompt")
            },
            to: "https://clipdrop-api.co/text-inpainting/v1",
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

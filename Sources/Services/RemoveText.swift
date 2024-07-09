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
    ///`1` IMAGE_FILE: - maximum resolution 16 megapixels (JPG OR PNG)
    ///max file size 30 Mb
    func removeTextRequest(apiKey: String, image: UIImage, completion: @escaping (_ success: Bool, _ message: String?, _ imageData: UIImage?) -> Void) {
        
        let imageData = image.jpegData(compressionQuality: 0.9)!
        
        let headers: HTTPHeaders = [
            "x-api-key": apiKey
        ]
        
        AF.upload(
            multipartFormData: { multipartFormData in
                multipartFormData.append(
                    imageData,
                    withName: "image_file",
                    fileName: "object.jpg",
                    mimeType: "image/jpeg"
                )
            },
            to: "https://clipdrop-api.co/remove-text/v1",
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


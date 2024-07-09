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
    
    func unCropImageRequest(apiKey: String, image: UIImage, leftExtend: String = "0", topExtend: String = "0", rightExtend: String = "0", bottomExtend: String = "0", completion: @escaping (_ success: Bool, _ message: String?, _ imageData: UIImage?) -> Void) {
        
        let imageData = image.jpegData(compressionQuality: 0.9)!
        let leftExtend = leftExtend.data(using: .utf8)
        let topExtend = topExtend.data(using: .utf8)
        let rightExtend = rightExtend.data(using: .utf8)
        let bottomExtend = bottomExtend.data(using: .utf8)
        
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
                    leftExtend!,
                    withName: "extend_left"
                )
                multipartFormData.append(
                    rightExtend!,
                    withName: "extend_right"
                )
                multipartFormData.append(
                    topExtend!,
                    withName: "extend_up"
                )
                multipartFormData.append(
                    bottomExtend!,
                    withName: "extend_down"
                )
            },
            to:"https://clipdrop-api.co/uncrop/v1",
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


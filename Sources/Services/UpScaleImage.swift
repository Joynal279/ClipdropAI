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
    ///`1` IMAGE_FILE`: - maximum resolution 16 megapixels (JPG OR PNG, Web File)
    ///max file size 30 Mb`
    ///_`target_width: Integer between 1 & 4096`
    ///`target_height: Integer between 1 & 4096
    func upScallingImageRequest(apiKey: String, image: UIImage, width: String, height: String, completion: @escaping (_ success: Bool, _ message: String?, _ imageData: UIImage?) -> Void) {
        
        let imageData = image.jpegData(compressionQuality: 0.9)!
        let width = width.data(using: .utf8)
        let height = height.data(using: .utf8)
        
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
                    width!,
                    withName: "target_width"
                )
                multipartFormData.append(
                    height!,
                    withName: "target_height"
                )
            },
            to: "https://clipdrop-api.co/image-upscaling/v1/upscale",
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

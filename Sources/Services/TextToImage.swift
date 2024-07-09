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
    ///PROMPT required for content generate
    ///where Max length will be 1000 characteres
    ///Response image will be 1024*1024 pixels dimensions*
    public func sketchToImageRequest(apiKey: String, text: String, completion: @escaping (_ success: Bool, _ message: String?, _ imageData: UIImage?) -> Void) {
        
        let textData = text.data(using: .utf8)
        
        let headers: HTTPHeaders = [
            "x-api-key": apiKey
        ]
        
        AF.upload(
            multipartFormData: { multipartFormData in
                multipartFormData.append(textData!, withName: "prompt")
            },
            to: "https://clipdrop-api.co/text-to-image/v1",
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

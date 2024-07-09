//
//  SwiftUIView.swift
//  
//
//  Created by Joynal Abedin on 9/7/24.
//

import SwiftUI

@available(iOS 13.0, *)
public struct SwiftUIView: View {
    public init() {}
    public var body: some View {
        VStack(alignment: .center) {
            Image(uiImage: UIImage(named: "worldIcon", in: .module, with: nil)!)
                .resizable()
                .frame(width: 24, height: 24)
                .aspectRatio(contentMode: .fit)
            Text("Clip Drop API Package!")
        }
    }
}

//MARK: - PREVIEW
@available(iOS 13.0, *)
#Preview {
    SwiftUIView()
}

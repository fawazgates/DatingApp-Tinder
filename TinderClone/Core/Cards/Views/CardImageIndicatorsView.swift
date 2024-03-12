//
//  CardImageIndicatorsView.swift
//  TinderClone
//
//  Created by User on 12/03/24.
//

import SwiftUI

struct CardImageIndicatorsView: View {
    let currentImageIndex: Int
    let imageCount: Int
    
    var body: some View {
        HStack {
            ForEach(0 ..< imageCount, id: \.self) { index in
                Capsule()
                    .foregroundStyle(currentImageIndex == index ? .white : .gray)
                    .frame(width: imageindicatorWidth, height: 4)
                    .padding(.top, 8)
            }
        }
    }
}

private extension CardImageIndicatorsView {
    var imageindicatorWidth: CGFloat {
        return SizeConstants.cardWidth / CGFloat(imageCount) - 28
    }
}

#Preview {
    CardImageIndicatorsView(currentImageIndex: 1, imageCount: 2)
}

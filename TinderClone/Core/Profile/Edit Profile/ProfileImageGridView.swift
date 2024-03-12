//
//  ProfileImageGridView.swift
//  TinderClone
//
//  Created by User on 13/03/24.
//

import SwiftUI

struct ProfileImageGridView: View {
    
    let user: User
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 14) {
            ForEach(0 ..< 6) { index in
                if index < user.profileImageURLs.count {
                    Image(user.profileImageURLs[index])
                        .resizable()
                        .scaledToFill()
                        .frame(width: imageHeight, height: imageWidht)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                } else {
                    ZStack(alignment: .bottomTrailing) {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(.secondarySystemBackground))
                            .frame(width: imageWidht, height: imageHeight)
                        
                        Image(systemName: "plus.circle")
                            .imageScale(.large)
                            .foregroundStyle(Color(.secondarypink))
                            .offset(x: 4, y: 4)
                    }
                }
            }
        }
    }
}

private extension ProfileImageGridView {
    var columns: [GridItem] {
        [
            .init(.flexible()),
            .init(.flexible()),
            .init(.flexible())
        ]
    }
    var imageWidht: CGFloat {
        return 110
    }
    var imageHeight: CGFloat {
        return 110
    }
}

#Preview {
    ProfileImageGridView(user: MockData.users[1])
}

//
//  ProgressBar.swift
//  TextAloudKit
//
//  Created by Aman Bind on 11/07/24.
//

import SwiftUI

struct ProgressBar: View {
    var value: Int
    var total: Int
    let color: Color

    var progress: CGFloat {
        return CGFloat(value) / CGFloat(total)
    }

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: geometry.size.height)
                    .frame(width: geometry.size.width + 6, height: geometry.size.height + 6)
                    .foregroundStyle(color.opacity(0.3))

                RoundedRectangle(cornerRadius: geometry.size.height)
                    .frame(width: max(CGFloat(progress) * geometry.size.width, geometry.size.height), height: geometry.size.height)
                    .foregroundStyle(color)
                    .offset(x: 3)
            }
        }
        .frame(height: 8)
    }
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 30) {
            
            ProgressBar(value: 12, total: 50, color: .orange)
            
            ProgressBar(value: 25, total: 50, color: .limeChalk)

            ProgressBar(value: 37, total: 50, color: .lightOcean)

            ProgressBar(value: 50, total: 50, color: .deepOcean)
        }
        .padding()
    }
}

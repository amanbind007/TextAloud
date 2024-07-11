//
//  ProgressBar.swift
//  TextAloudKit
//
//  Created by Aman Bind on 11/07/24.
//

import SwiftUI

struct ProgressBar: View {
    var value: CGFloat
    var total: CGFloat
    let color: Color
    
    let xOffset: CGFloat = 3

    var progress: CGFloat {
        value / total
    }

    public init(value: Int, total: Int, color: Color) {
        self.value = CGFloat(value)
        self.total = CGFloat(total)
        self.color = color
    }

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: geometry.size.height)
                    .foregroundStyle(color.opacity(0.3))
                    .frame(
                        width: geometry.size.width + xOffset*2,
                        height: geometry.size.height + xOffset*2
                    )

                RoundedRectangle(cornerRadius: geometry.size.height)
                    .foregroundStyle(color)
                    .frame(
                        width: max(CGFloat(progress) * geometry.size.width, geometry.size.height),
                        height: geometry.size.height
                    )
                    .offset(x: xOffset)
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

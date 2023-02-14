//
//  SpeachTextViewComponent.swift
//  TextAloud
//
//  Created by Богдан Зыков on 13.02.2023.
//

import SwiftUI

struct SpeachTextViewComponent: View {
    @Binding var currentWord: NSRange?
    @ObservedObject var rootVM: RootViewModel
    var body: some View {
        GeometryReader { proxy in
            
            TextView(focused: $rootVM.isFocused, text: $rootVM.text, isEditing: $rootVM.isEditMode, currentWord: $currentWord, selectedRange: $rootVM.selectedRange, selectionMode: $rootVM.currentSelectionMode)
            
                .padding(10)
                .frame(height: proxy.size.height)
                .background(.white)
                .cornerRadius(12)
                .overlay{
                    if rootVM.isFocused{
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.limeChalk, lineWidth: 3)
                    }
                }
        }
    }
}

struct SpeachTextViewComponent_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.deepOcean
            SpeachTextViewComponent(currentWord: .constant(.init(location: 0, length: 5)), rootVM: RootViewModel())
                .frame(height: 400)
                .padding()
        }
    }
}

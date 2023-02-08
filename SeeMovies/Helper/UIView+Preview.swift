//
//  UIView+Preview.swift
//  SeeMovies
//
//  Created by José Vitor Scheffer Boff dos Santos on 08/02/23.
//

#if DEBUG
import UIKit
import SwiftUI

extension UIView {

    private struct Preview: UIViewRepresentable {

        let view: UIView
        
        func makeUIView(context: Context) -> UIView {
            return view
        }
        
        func updateUIView(_ uiView: UIView, context: Context) {}
    }
    
    func showPreview() -> some View {
        Preview(view: self)
    }

}
#endif

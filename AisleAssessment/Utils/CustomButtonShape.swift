//
//  CustomButtonShape.swift
//  AisleAssessment
//
//  Created by Keyur Patel on 14/01/23.
//

import Foundation
import SwiftUI

struct CustomButtonShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.addRect(CGRect(x: 0, y: 0, width: width, height: height))
        return path
    }
}

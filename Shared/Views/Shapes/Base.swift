//
//  Base.swift
//  TimedMetadataDemo
//
//  Created by Matt Dublin on 8/5/22.
//

import SwiftUI

struct Base : Shape {
    
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        return path
    }
    
}


struct Base_Previews: PreviewProvider {
    static var previews: some View {
        Base().stroke(Color.blue,
                      style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .miter))
        .frame(width: 50, height: 50, alignment: .trailing)
    }
}

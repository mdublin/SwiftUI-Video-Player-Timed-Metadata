//
//  Diamond.swift
//  TimedMetadataDemo
//
//  Created by Matt Dublin on 8/5/22.
//

import SwiftUI

struct Diamond : Shape {
    
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        //path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))

        return path
    }
}

struct Diamond_Previews: PreviewProvider {
    static var previews: some View {
        
        ZStack {
            
            
                Diamond().stroke(Color.red,
                                 style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .miter))
                .frame(width: 300, height: 300, alignment: .center)
                
                          

            GeometryReader { geometry in
                
                
                /*
                Base().stroke(Color.blue,
                              style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .miter))
                .frame(width: 50, height: 50).position(x: geometry.size.width / 2.0, y: (3.0 / 3.79) * geometry.size.height)
                
                */
                
                Base().stroke(Color.blue,
                              style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .miter))
                .frame(width: 50, height: 50).position(x: geometry.size.width / 4.8, y: (2.0 / 4.0) * geometry.size.height)
                 
                
                
                Base().stroke(Color.blue,
                              style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .miter))
                .frame(width: 50, height: 50).position(x: geometry.size.width / 2.0, y: (1.78 / 8.5) * geometry.size.height)
                
                
                
                Base().stroke(Color.blue,
                              style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .miter))
                .frame(width: 50, height: 50).position(x: geometry.size.width / 1.26, y: (2.0 / 4.0) * geometry.size.height)
                 
                
            }
            .aspectRatio(1, contentMode: .fit)
                       
            GeometryReader {
                geometry in
                Rectangle()
                    .fill(.red)
                    .frame(width: 50, height: 50).rotationEffect(.degrees(45)).position(x: geometry.size.width / 1.26, y: (2.0 / 4.0) * geometry.size.height)
            }
        }
        
    }
}

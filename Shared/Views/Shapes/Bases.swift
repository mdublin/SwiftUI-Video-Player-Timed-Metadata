//
//  Bases.swift
//  TimedMetadataDemo
//
//  Created by Matt Dublin on 8/7/22.
//

import SwiftUI

struct Bases: View {
    
    @Binding var firstBaseLoaded: Bool
    @Binding var secondBaseLoaded: Bool
    @Binding var thirdBaseLoaded: Bool

    var body: some View {
        ZStack {
            
            
                Diamond().stroke(Color.blue,
                                 style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .miter))
                .frame(width: 300, height: 300, alignment: .center).hidden()
                
                          

            GeometryReader { geometry in
                
                
        
                Base().stroke(Color.blue,
                              style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .miter))
                .frame(width: 50, height: 50).position(x: geometry.size.width / 4.8, y: (2.0 / 4.0) * geometry.size.height)
                
                Rectangle()
                    .fill(.blue)
                    .frame(width: 45, height: 45).rotationEffect(.degrees(45)).position(x: geometry.size.width / 4.8, y: (2.0 / 4.0) * geometry.size.height).opacity(thirdBaseLoaded ? 1 : 0)
                
                
                
                Base().stroke(Color.blue,
                              style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .miter))
                .frame(width: 50, height: 50).position(x: geometry.size.width / 2.0, y: (1.78 / 8.5) * geometry.size.height)
                Rectangle()
                    .fill(.blue)
                    .frame(width: 45, height: 45).rotationEffect(.degrees(45)).position(x: geometry.size.width / 2.0, y: (1.78 / 8.5) * geometry.size.height).opacity(secondBaseLoaded ? 1 : 0)
                
                
                
                Base().stroke(Color.blue,
                              style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .miter))
                .frame(width: 50, height: 50).position(x: geometry.size.width / 1.26, y: (2.0 / 4.0) * geometry.size.height)
                Rectangle()
                    .fill(.blue)
                    .frame(width: 45, height: 45).rotationEffect(.degrees(45)).position(x: geometry.size.width / 1.26, y: (2.0 / 4.0) * geometry.size.height).opacity(firstBaseLoaded ? 1 : 0)
                
                 
                
            }
            .aspectRatio(1, contentMode: .fit)
           
        }
    }
}

/*

struct Bases_Previews: PreviewProvider {
        
    static var previews: some View {
        

        Bases(firstBaseLoaded: .constant(true), secondBaseLoaded: .constant(true), thirdBaseLoaded: .constant(false))
    }
}
*/

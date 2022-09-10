//
//  ScoreBoard.swift
//  TimedMetadataDemo
//
//  Created by Matt Dublin on 8/11/22.
//

import SwiftUI



struct ScoreBoard: View {
    
    @Binding var homeScore: Int
    @Binding var vistorScore: Int

    
    var body: some View {
        
        VStack(alignment: .center) {
            TeamHeaderRow().frame(maxWidth: .infinity, alignment: .center)
            ScoreRow(homeScore: homeScore, visitorScore: vistorScore).frame(maxWidth: .infinity, alignment: .center)
        }
    }
}

struct TeamHeaderRow: View {
  var body: some View {
      HStack(alignment: .center) {
          Text("Home").font(.largeTitle).underline().frame(alignment: .leading).padding(20)
          Text("Visitor").font(.largeTitle).underline().frame(alignment: .trailing).padding(20)
      }
  }
}


struct ScoreRow: View {
    
  let homeScore: Int
  let visitorScore: Int
    
  var body: some View {
      HStack {
              Text(String(homeScore)).font(.largeTitle).frame(alignment: .center).padding(20)
              
              Text(String(visitorScore)).font(.largeTitle).frame(alignment: .center).padding(20)
          }
  }
}


struct ScoreBoard_Previews: PreviewProvider {
    static var previews: some View {
        ScoreBoard(homeScore: .constant(20), vistorScore: .constant(12))
    }
}

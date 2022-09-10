//
//  LeaderboardView.swift
//  TimedMetadataDemo
//
//  Created by Matt Dublin on 8/4/22.
//

import SwiftUI

struct LeaderboardView: View {
    
    @Binding var playerOneScore: Int
    @Binding var playerTwoScore: Int
    @Binding var playerOneMatch: Int
    @Binding var playerTwoMatch: Int


    
  var body: some View {
    ZStack {
      Color("BackgroundColor").edgesIgnoringSafeArea(.all)
      VStack(spacing: 10) {
        HeaderView()
        LabelView()
        //RowView(index: 1, score: playerOneScore, date: Date())
        //RowView(index: 2, score: playerTwoScore, date: Date())
          //RowView(index: 1, score: playerOneScore, date: Date(), playerName: "ZHENDONG")
          //RowView(index: 2, score: playerTwoScore, date: Date(), playerName: "MOREGARD")
          
          RowView(index: 1, match: playerOneMatch, score: playerOneScore, playerColor: .red)
          RowView(index: 2, match: playerTwoMatch, score: playerTwoScore, playerColor: .blue)
      }
    }
  }
}

struct RowView: View {
  let index: Int
  let match: Int
  let score: Int
  //let date: Date
  //let playerName: String
  let playerColor: Color

    
  var body: some View {
    HStack {
        
      RoundedTextView(text: String(index), playerBackgroundColor: playerColor)
      Spacer()
    
        
      //PlayerNameText(name: playerName)
       // .frame(width: Constants.Leaderboard.leaderboardScoreColWidth)
        
        
      MatchText(match: match)
        .frame(width: Constants.Leaderboard.leaderboardScoreColWidth)
        
      Spacer()
        
      //DateText(date: date)
      //  .frame(width: Constants.Leaderboard.leaderboardDateColWidth)
      ScoreText(score: score)
        
        .frame(width: Constants.Leaderboard.leaderboardScoreColWidth)
    }
    .background(
      RoundedRectangle(cornerRadius: .infinity)
        .strokeBorder(Color("LeaderboardRowColor"), lineWidth: Constants.General.strokeWidth)
    )
    .padding(.leading)
    .padding(.trailing)
      
   // .frame(maxWidth: Constants.Leaderboard.leaderboardMaxRowWidth)
  }
}

struct HeaderView: View {
  var body: some View {
      ZStack {
          BigBoldText(text: "Leaderboard")
        
    /*
      HStack {
        Spacer()
        Button(action: {}) {
          RoundedImageViewFilled(systemName: "xmark")
            .padding(.trailing)
        }
      }
    */
        
    }
  }
}

struct LabelView: View {
  var body: some View {
    HStack {
        
      //Spacer()
      //  .frame(width: Constants.General.roundedViewLength)
      //Spacer()
        
      LabelText(text: "")
          .frame(width: Constants.Leaderboard.leaderboardScoreColWidth)
      Spacer()
        
      LabelText(text: "Match")
        .frame(width: Constants.Leaderboard.leaderboardScoreColWidth)
      Spacer()
        
      //LabelText(text: "Score")
      //  .frame(width: Constants.Leaderboard.leaderboardDateColWidth)
        
        LabelText(text: "Score")
          .frame(width: Constants.Leaderboard.leaderboardScoreColWidth)
    }
    .padding(.leading)
    .padding(.trailing)
    
    
    .frame(maxWidth: Constants.Leaderboard.leaderboardMaxRowWidth)
  }
}

struct LeaderboardView_Previews: PreviewProvider {
  static var previews: some View {
      LeaderboardView(playerOneScore: .constant(12), playerTwoScore: .constant(8), playerOneMatch: .constant(0), playerTwoMatch: .constant(0))
      LeaderboardView(playerOneScore: .constant(12), playerTwoScore: .constant(8), playerOneMatch: .constant(0), playerTwoMatch: .constant(0))
      .previewLayout(.fixed(width: 568, height: 320))
      LeaderboardView(playerOneScore: .constant(12), playerTwoScore: .constant(8), playerOneMatch: .constant(0), playerTwoMatch: .constant(0))
      .preferredColorScheme(.dark)
      LeaderboardView(playerOneScore: .constant(12), playerTwoScore: .constant(8), playerOneMatch: .constant(0), playerTwoMatch: .constant(0))
      .preferredColorScheme(.dark)
      .previewLayout(.fixed(width: 568, height: 320))
  }
}

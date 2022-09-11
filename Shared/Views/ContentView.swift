//
//  ContentView.swift
//  Shared
//
//  Created by Matt Dublin on 7/25/22.
//

import AVKit
import SwiftUI
import Combine //https://developer.apple.com/documentation/combine
import AVFoundation
import Foundation


var parsedJSONData = TimedMetadataParser.parse(jsonFileName: "GameTimedMetadata")!
   
var boundaryTimesFromMetadata = TimedMetadataParser.getBoundaryTimes(jsonDataResults: parsedJSONData)


let jsonData = Data(jsonString.utf8)


/*
 
 need some way to check the start end end timecode range
 
 would need to iterate through the json and create a bunch of these to use a check for the current time range
 
 let timeMetadataRamge: Range<Double> = startTime..<endTime
 
 */





class Utility: NSObject {
    
    private static var timeHMSFormatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .positional
        formatter.allowedUnits = [.minute, .second]
        formatter.zeroFormattingBehavior = [.pad]
        return formatter
    }()
    
    static func formatSecondsToHMS(_ seconds: Double) -> String {
        guard !seconds.isNaN,
            let text = timeHMSFormatter.string(from: seconds) else {
                return "00:00"
        }
         
        return text
    }
    
}



class PlayerTimeObserver {
  let publisher = PassthroughSubject<TimeInterval, Never>()
  private var timeObservation: Any?
  
  init(player: AVPlayer) {
    // Periodically observe the player's current time, whilst playing
    timeObservation = player.addPeriodicTimeObserver(forInterval: CMTime(seconds: 0.5, preferredTimescale: CMTimeScale(NSEC_PER_SEC)), queue: nil) { [weak self] time in
      guard let self = self else { return }
      // Publish the new player time
      self.publisher.send(time.seconds)
    }
  }
    
}



//https://developer.apple.com/documentation/avfoundation/avplayer/1388027-addboundarytimeobserver

class PlayerTimeBoundaryObserver {
  let publisher = PassthroughSubject<TimeInterval, Never>()

  var times = [NSValue]()
  private var timeObserverToken: Any?
  
    init(player: AVPlayer, GameTimes: [Double]) {
                
        //let timesConverted = times.map { NSValue(time: CMTime(seconds: $0, preferredTimescale: 1000000)) }
        
        
        for t in GameTimes {
            times.append(NSValue(time: CMTimeMultiplyByFloat64(CMTime(seconds: t, preferredTimescale: 1000000), multiplier: 0.1)))
        }
        
    // Add time observer. Observe boundary time changes on the main queue.
    timeObserverToken = player.addBoundaryTimeObserver(forTimes: times,
                                                             queue: .main) { [weak self] in
        
        
        // making this into miliseconds and shaving off the fractional stuff after decimal point
        //self?.publisher.send(TimeInterval(Int(player.currentTime().seconds * 10)))
        self?.publisher.send(player.currentTime().seconds * 10)
        
          }
      
  }
    
}



    
    
    
struct PlayerTimeView: View {
    
    let timeObserver: PlayerTimeObserver
    // NEW
    let timeBoundaryObserver: PlayerTimeBoundaryObserver
    
    
    @State private var currentTime: TimeInterval = 0
    @State private var currentTimedMetadataText: String = ""
    @State private var scoreOne: Int = 0
    @State private var scoreTwo: Int = 0
    @State private var playerOneMatch: Int = 0
    @State private var playerTwoMatch: Int = 0
    
    
    
    @State var firstBaseLoaded: Bool = false
    @State var secondBaseLoaded: Bool = false
    @State var thirdBaseLoaded: Bool = false
    // for ScoreBoard view
    @State var homeScore: Int = 0
    @State var visitorScore: Int = 0
    
      
    var body: some View {
  
        //within each block is where the current time is used to pull the correct data out of the collection of timed metadata
        
        // each needs to search through parsedJSONData for the start time match, then update the UI
        
        ScoreBoard(homeScore: $homeScore, vistorScore: $visitorScore).onReceive(timeObserver.publisher) { time in
            
           
            for (_, item) in parsedJSONData.enumerated() {
                
                let currentTimeStartRangeCheck = time.rounded(.towardZero) as Double >= item.start.rounded(.towardZero) as Double
                
                let currentTimeEndRangeCheck = time.rounded(.towardZero) < item.end
                
                
                if (currentTimeStartRangeCheck && currentTimeEndRangeCheck) {
                    
                    self.homeScore = item.metadata.scores.home
                    self.visitorScore = item.metadata.scores.visitor
                    break
                }
            }
        }
        
        
        

        Bases(firstBaseLoaded: $firstBaseLoaded, secondBaseLoaded: $secondBaseLoaded, thirdBaseLoaded: $thirdBaseLoaded).onReceive(timeObserver.publisher) { time in
            
            
            for (_, item) in parsedJSONData.enumerated() {
                
                let currentTimeStartRangeCheck = time.rounded(.towardZero) as Double >= item.start.rounded(.towardZero) as Double
                
                let currentTimeEndRangeCheck = time.rounded(.towardZero) < item.end
                
                
                if (currentTimeStartRangeCheck && currentTimeEndRangeCheck) {
                    
                    self.firstBaseLoaded = (item.metadata.bases[0] != 0)
                    self.secondBaseLoaded = (item.metadata.bases[1] != 0)
                    self.thirdBaseLoaded = (item.metadata.bases[2] != 0)
                    break
                }
            }
        }
        
      }
    }





struct ContentView: View {
    
    private let videoPlayer = AVPlayer(url:  //URL(string: "https://stream.mux.com/YSrK2IRqgEJN00iQzKHWGSWjRnZ00nlO4gEcej771xeeo.m3u8")!)
    
        URL(string: "https://stream.mux.com/L4p3hqH4502TchE959q5MXiDCRhCsPVzVlYFFFJCBgYc.m3u8")!)
    
    var body: some View {
        
        VStack(alignment: .leading) {
            GeometryReader { geometry in
                VStack {
                    VideoPlayer(player: videoPlayer).onAppear { videoPlayer.play() }
                    .frame(height: UIScreen.main.bounds.size.height/3, alignment: .top)
                }
            }
            GeometryReader { geometry in
                VStack {
                    
                    Text("Softball Game").font(.largeTitle).padding(0)
                    
                    PlayerTimeView(timeObserver: PlayerTimeObserver(player: videoPlayer), timeBoundaryObserver:PlayerTimeBoundaryObserver(player: videoPlayer, GameTimes: boundaryTimesFromMetadata)).frame(alignment: .bottomTrailing)
                    
                }
              }
            }
        .padding()
        .foregroundColor(.primary)
        .background(Color.primary
                        .colorInvert()
                        .opacity(0.75))
        
        .onAppear {
            // going to call the json parsing utility to get both an array of times to use for the boundary time obersver and also to load up the parsed json for the graphics
                
            print("THIS IS parsedJSONData: ")
            print(parsedJSONData)
            print("THIS IS BOUDNARY TIME: ")
            print(boundaryTimesFromMetadata)

            
        }
    }
    
       
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewInterfaceOrientation(.portrait)
    }
}


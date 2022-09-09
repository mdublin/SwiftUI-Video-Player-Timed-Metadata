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


/*
 
 
 {
   "00:00": {
     "playerOne": {
       "red": 0,
       "blue": 2
     },
     "playerTwo": {
       "red": 0,
       "blue": 1
     }
   },
   "00:06": {
     "playerOne": {
       "red": 0,
       "blue": 3
     },
     "playerTwo": {
       "red": 0,
       "blue": 1
     }
   },
   "00:10": {
     "playerOne": {
       "red": 0,
       "blue": 5
     },
     "playerTwo": {
       "red": 0,
       "blue": 2
     }
   },
   "00:14": {
     "playerOne": {
       "red": 0,
       "blue": 5
     },
     "playerTwo": {
       "red": 0,
       "blue": 3
     }
   },
   "00:17": {
     "playerOne": {
       "red": 0,
       "blue": 7
     },
     "playerTwo": {
       "red": 0,
       "blue": 3
     }
   },
   "00:24": {
     "playerOne": {
       "red": 0,
       "blue": 7
     },
     "playerTwo": {
       "red": 0,
       "blue": 4
     }
   },
   "00:34": {
     "playerOne": {
       "red": 0,
       "blue": 8
     },
     "playerTwo": {
       "red": 0,
       "blue": 4
     }
   },
   "00:42": {
     "playerOne": {
       "red": 0,
       "blue": 8
     },
     "playerTwo": {
       "red": 0,
       "blue": 5
     }
   },
   "00:44": {
     "playerOne": {
       "red": 1,
       "blue": 11
     },
     "playerTwo": {
       "red": 0,
       "blue": 6
     }
   },
   "00:54": {
     "playerOne": {
       "red": 1,
       "blue": 0
     },
     "playerTwo": {
       "red": 0,
       "blue": 1
     }
   },
   "01:01": {
     "playerOne": {
       "red": 1,
       "blue": 0
     },
     "playerTwo": {
       "red": 0,
       "blue": 2
     }
   },
   "01:05": {
     "playerOne": {
       "red": 1,
       "blue": 2
     },
     "playerTwo": {
       "red": 0,
       "blue": 4
     }
   },
   "01:14": {
     "playerOne": {
       "red": 1,
       "blue": 2
     },
     "playerTwo": {
       "red": 0,
       "blue": 5
     }
   },
   "01:18": {
     "playerOne": {
       "red": 1,
       "blue": 4
     },
     "playerTwo": {
       "red": 0,
       "blue": 5
     }
   }
 }
 
 
 */

var someTimedMetadata = ["00:05": 20,
                        "00:10": 44,
                        "00:15": 89,
                        "00:20": 101]



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
    
    
    
struct PlayerTimeView: View {
    let timeObserver: PlayerTimeObserver
    @State private var currentTime: TimeInterval = 0
    @State private var currentTimedMetadataText: String = ""
    
    
    @State private var scoreOne: Int = 0
    @State private var scoreTwo: Int = 0
    
    

      
    var body: some View {
        //Text("\(Utility.formatSecondsToHMS(currentTime))").font(.headline)
        //Text("\(currentTimedMetadataText)").font(.headline)
        
        LeaderboardView(playerOneScore: $scoreOne, playerTwoScore: $scoreTwo)
        .onReceive(timeObserver.publisher) { time in
          self.currentTime = time
          print(time)
          print(Utility.formatSecondsToHMS(time))
          let keyExists = someTimedMetadata[Utility.formatSecondsToHMS(time)] != nil
            if keyExists {
                //self.currentTimedMetadataText = someTimedMetadata[Utility.formatSecondsToHMS(time)]!
                self.scoreOne = someTimedMetadata[Utility.formatSecondsToHMS(time)]!
                
                print("This is self.scoreOne: \(self.scoreOne)")
                
            } else {
                print("time not in dict....")
            }
            
        }
      }
    }



struct ContentView: View {
    
    private let videoPlayer = AVPlayer(url:  URL(string: "https://stream.mux.com/YSrK2IRqgEJN00iQzKHWGSWjRnZ00nlO4gEcej771xeeo.m3u8")!)
    
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
                    PlayerTimeView(timeObserver: PlayerTimeObserver(player: videoPlayer)).frame(alignment: .bottomTrailing)
                }
            }
            
            /*
            GeometryReader { geometry in
                VStack {
                    LeaderboardView(playerOneScore: 20, playerTwoScore: 12)
                }
            }
             */
            
            
            }
        .padding()
        .foregroundColor(.primary)
        .background(Color.primary
                        .colorInvert()
                        .opacity(0.75))
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewInterfaceOrientation(.portrait)
    }
}


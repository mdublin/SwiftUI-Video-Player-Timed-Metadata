//
//  TimeMetadataParser.swift
//  TimedMetadataDemo
//
//  Created by Matt Dublin on 8/10/22.
//

import Foundation



let myJSON = """
{
"results": [
  {
    "start": 0,
    "end": 148.247,
    "metadata": {
      "bases": [0, 0, 0],
      "outs": 0,
      "scores": {
        "home": 0,
        "visitor": 0
      },
      "inning": "Top 1"
    }
  },
  {
    "start": 148.247,
    "end": 207.653,
    "metadata": {
      "bases": [0, 0, 0],
      "outs": 1,
      "scores": {
        "home": 0,
        "visitor": 0
      },
      "inning": "Top 1"
    }
  },
  {
    "start": 207.653,
    "end": 277.043,
    "metadata": {
      "bases": [0, 0, 0],
      "outs": 2,
      "scores": {
        "home": 0,
        "visitor": 0
      },
      "inning": "Top 1"
    }
  },
  {
    "start": 277.043,
    "end": 561.319,
    "metadata": {
      "bases": [0, 0, 0],
      "outs": 0,
      "scores": {
        "home": 0,
        "visitor": 0
      },
      "inning": "Bottom 1"
    }
  },
  {
    "start": 561.319,
    "end": 730.389,
    "metadata": {
      "bases": [0, 0, 0],
      "outs": 1,
      "scores": {
        "home": 0,
        "visitor": 0
      },
      "inning": "Bottom 1"
    }
  },
  {
    "start": 730.389,
    "end": 802.968,
    "metadata": {
      "bases": [0, 1, 0],
      "outs": 1,
      "scores": {
        "home": 0,
        "visitor": 1
      },
      "inning": "Bottom 1"
    }
  },
  {
    "start": 802.968,
    "end": 921.342,
    "metadata": {
      "bases": [0, 0, 1],
      "outs": 1,
      "scores": {
        "home": 0,
        "visitor": 2
      },
      "inning": "Bottom 1"
    }
  },
  {
    "start": 921.342,
    "end": 1065.445,
    "metadata": {
      "bases": [0, 0, 1],
      "outs": 2,
      "scores": {
        "home": 0,
        "visitor": 2
      },
      "inning": "Bottom 1"
    }
  },
  {
    "start": 1065.445,
    "end": 1257.112,
    "metadata": {
      "bases": [0, 0, 1],
      "outs": 2,
      "scores": {
        "home": 0,
        "visitor": 3
      },
      "inning": "Bottom 1"
    }
  },
  {
    "start": 1257.112,
    "end": 1589.176,
    "metadata": {
      "bases": [0, 0, 0],
      "outs": 0,
      "scores": {
        "home": 0,
        "visitor": 3
      },
      "inning": "Top 2"
    }
  },
  {
    "start": 1589.176,
    "end": 1638.126,
    "metadata": {
      "bases": [1, 1, 0],
      "outs": 0,
      "scores": {
        "home": 0,
        "visitor": 3
      },
      "inning": "Top 2"
    }
  },
  {
    "start": 1638.126,
    "end": 1652.946,
    "metadata": {
      "bases": [1, 0, 1],
      "outs": 1,
      "scores": {
        "home": 0,
        "visitor": 3
      },
      "inning": "Top 2"
    }
  },
  {
    "start": 1652.946,
    "end": 1775.417,
    "metadata": {
      "bases": [1, 1, 1],
      "outs": 0,
      "scores": {
        "home": 0,
        "visitor": 3
      },
      "inning": "Top 2"
    }
  },
  {
    "start": 1775.417,
    "end": 1857.753,
    "metadata": {
      "bases": [1, 1, 1],
      "outs": 0,
      "scores": {
        "home": 1,
        "visitor": 3
      },
      "inning": "Top 2"
    }
  },
  {
    "start": 1857.753,
    "end": 1968.696,
    "metadata": {
      "bases": [1, 1, 1],
      "outs": 1,
      "scores": {
        "home": 1,
        "visitor": 3
      },
      "inning": "Top 2"
    }
  },
  {
    "start": 1968.696,
    "end": 2082.618,
    "metadata": {
      "bases": [1, 1, 1],
      "outs": 1,
      "scores": {
        "home": 2,
        "visitor": 3
      },
      "inning": "Top 2"
    }
  },
  {
    "start": 2082.618,
    "end": 2145.868,
    "metadata": {
      "bases": [1, 1, 1],
      "outs": 1,
      "scores": {
        "home": 3,
        "visitor": 3
      },
      "inning": "Top 2"
    }
  },
  {
    "start": 2145.868,
    "end": 2199.816,
    "metadata": {
      "bases": [0, 0, 0],
      "outs": 0,
      "scores": {
        "home": 3,
        "visitor": 3
      },
      "inning": "Bottom 2"
    }
  },
  {
    "start": 2199.816,
    "end": 2371.755,
    "metadata": {
      "bases": [0, 0, 0],
      "outs": 0,
      "scores": {
        "home": 4,
        "visitor": 3
      },
      "inning": "Bottom 2"
    }
  },
  {
    "start": 2371.755,
    "end": 2521.664,
    "metadata": {
      "bases": [1, 0, 0],
      "outs": 0,
      "scores": {
        "home": 4,
        "visitor": 3
      },
      "inning": "Bottom 2"
    }
  },
  {
    "start": 2521.664,
    "end": 2608.579,
    "metadata": {
      "bases": [0, 0, 0],
      "outs": 2,
      "scores": {
        "home": 4,
        "visitor": 3
      },
      "inning": "Bottom 2"
    }
  },
  {
    "start": 2608.579,
    "end": 2831.223,
    "metadata": {
      "bases": [0, 0, 0],
      "outs": 0,
      "scores": {
        "home": 4,
        "visitor": 3
      },
      "inning": "Top 3"
    }
  },
  {
    "start": 2831.223,
    "end": 2933.052,
    "metadata": {
      "bases": [1, 0, 0],
      "outs": 0,
      "scores": {
        "home": 4,
        "visitor": 3
      },
      "inning": "Top 3"
    }
  },
  {
    "start": 2933.052,
    "end": 3028.316,
    "metadata": {
      "bases": [1, 1, 0],
      "outs": 0,
      "scores": {
        "home": 4,
        "visitor": 3
      },
      "inning": "Top 3"
    }
  },
  {
    "start": 3028.316,
    "end": 3056.605,
    "metadata": {
      "bases": [0, 1, 1],
      "outs": 0,
      "scores": {
        "home": 4,
        "visitor": 3
      },
      "inning": "Top 3"
    }
  },
  {
    "start": 3056.605,
    "end": 3242.193,
    "metadata": {
      "bases": [1, 1, 1],
      "outs": 0,
      "scores": {
        "home": 4,
        "visitor": 3
      },
      "inning": "Top 3"
    }
  },
  {
    "start": 3242.193,
    "end": 3356.805,
    "metadata": {
      "bases": [1, 1, 1],
      "outs": 0,
      "scores": {
        "home": 5,
        "visitor": 3
      },
      "inning": "Top 3"
    }
  },
  {
    "start": 3356.805,
    "end": 3501.496,
    "metadata": {
      "bases": [1, 1, 1],
      "outs": 1,
      "scores": {
        "home": 5,
        "visitor": 3
      },
      "inning": "Top 3"
    }
  },
  {
    "start": 3501.496,
    "end": 3675.264,
    "metadata": {
      "bases": [1, 1, 1],
      "outs": 2,
      "scores": {
        "home": 5,
        "visitor": 3
      },
      "inning": "Top 3"
    }
  },
  {
    "start": 3675.264,
    "end": 3891.241,
    "metadata": {
      "bases": [0, 0, 0],
      "outs": 0,
      "scores": {
        "home": 5,
        "visitor": 3
      },
      "inning": "Bottom 3"
    }
  },
  {
    "start": 3891.241,
    "end": 3987.706,
    "metadata": {
      "bases": [0, 0, 0],
      "outs": 1,
      "scores": {
        "home": 5,
        "visitor": 3
      },
      "inning": "Bottom 3"
    }
  },
  {
    "start": 3987.706,
    "end": 4151.341,
    "metadata": {
      "bases": [1, 0, 0],
      "outs": 2,
      "scores": {
        "home": 5,
        "visitor": 3
      },
      "inning": "Bottom 3"
    }
  },
  {
    "start": 4151.341,
    "end": 4194.854,
    "metadata": {
      "bases": [0, 1, 0],
      "outs": 2,
      "scores": {
        "home": 5,
        "visitor": 3
      },
      "inning": "Bottom 3"
    }
  },
  {
    "start": 4194.854,
    "end": 4273.987,
    "metadata": {
      "bases": [0, 1, 1],
      "outs": 2,
      "scores": {
        "home": 5,
        "visitor": 3
      },
      "inning": "Bottom 3"
    }
  },
  {
    "start": 4273.987,
    "end": 4403.528,
    "metadata": {
      "bases": [0, 1, 1],
      "outs": 2,
      "scores": {
        "home": 5,
        "visitor": 4
      },
      "inning": "Bottom 3"
    }
  }
]
}

"""


class TimeMetadataParser {
    
    struct Score: Decodable {
        let home: Int
        let visitor: Int
    }

    struct Metadata: Decodable {
        let bases: [Int]
        let outs: Int
        let scores: Score
        let inning: String
    }

    struct TimedMetadata: Decodable {
         let start: Double
         let end: Double
         let metadata: Metadata
     }


    struct GameMetadata: Decodable {
        var results: [TimedMetadata]
    }


    static var arrayOfTimeRanges = [Double]()
    
    
    
    static func readLocalFile(forName name: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name,
                                                 ofType: "json"),
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error)
        }
        
        return nil
    }
    

    static func parse(jsonFileName: String) {
                
        let decoder = JSONDecoder()
        //let jsonData = myJSON.data(using: .utf8)!
        let jsonData = readLocalFile(forName: jsonFileName)!


        if let jsonMetadata = try? decoder.decode(GameMetadata.self, from: jsonData) {
            //print(jsonMetadata.results)
            //tableView.reloadData()
            print(type(of: jsonMetadata))
            
            for (index, item) in jsonMetadata.results.enumerated() {
                print("index: \(index)")
                print(item)
                print(item.start)
                print(item.end)
                
                if arrayOfTimeRanges.contains(item.start) {
                    print("Current state of arrayOfTimeRanges: ")
                    print(arrayOfTimeRanges)
                } else {
                    arrayOfTimeRanges.append(item.start)
                }
                
                print("Current state of arrayOfTimeRanges: ")
                print(arrayOfTimeRanges)
            }
        }
    }

    
}



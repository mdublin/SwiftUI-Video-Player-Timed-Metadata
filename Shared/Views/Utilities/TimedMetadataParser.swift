//
//  TimedMetadataParser.swift
//  TimedMetadataDemo
//
//  Created by Matt Dublin on 8/10/22.
//

import Foundation


class TimedMetadataParser {
    
    
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


    //static var arrayOfTimeRanges = [Double]()
    static var arrayOfJSONData = [TimedMetadata]()
    
    
    
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
    
    
    
    static func parse(jsonFileName: String) -> [TimedMetadata]? {
        
        do {
            if let bundlePath = Bundle.main.path(forResource: jsonFileName,
                                                 ofType: "json"),
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                
                let decodedData = try JSONDecoder().decode(GameMetadata.self,
                                                                   from: jsonData)
                return decodedData.results
            }
        } catch {
            print(error)
            return nil
        }
        
        
        /*
        if let jsonMetadata = try? decoder.decode(GameMetadata.self, from: jsonData) {
            arrayOfJSONData = jsonMetadata.results
            return arrayOfJSONData
        }
        */
        
        return nil
        
    }
    
    
    
    static func getBoundaryTimes(jsonDataResults: [TimedMetadata]) -> [Double] {
        
        var arrayOfTimeRanges = [Double]()
        
        for (index, item) in jsonDataResults.enumerated() {
            if arrayOfTimeRanges.contains(item.start) {
            } else {
                arrayOfTimeRanges.append(item.start)
            }
        }
        
        return arrayOfTimeRanges
    }

    
}



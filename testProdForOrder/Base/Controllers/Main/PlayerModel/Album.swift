//
//  Album.swift
//  testProdForOrder
//
//  Created by Evhen Lukhtan on 10.02.2023.
//

import Foundation

struct Album {
    var name: String
    var image: String
    var songs: [Song]
}

extension Album {
    static func get() -> [Album] {
         return [
            Album(name: "Meditation", image: "med", songs: [Song(name: "How to meditate and growth..", image: "med", fileName: "meedMus")]),
            Album(name: "Sleep", image: "sleepee", songs: [Song(name: "How to have perfect dream..", image: "sleepee", fileName: "sleepMus")]),
            Album(name: "Calm", image: "calming", songs: [Song(name: "How to be calm and relaxed..", image: "calming", fileName: "careless_whisper")])
         ]
    }
}

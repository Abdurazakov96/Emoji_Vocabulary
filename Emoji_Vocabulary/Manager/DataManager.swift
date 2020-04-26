//
//  DataManager.swift
//  Emoji_Vocabulary
//
//  Created by Магомед Абдуразаков on 12/08/2019.
//  Copyright © 2019 Магомед Абдуразаков. All rights reserved.
//

import Foundation

class DataManager {
    
    // MARK: - Public properties
    
    var archiveURL: URL? {
        guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {return nil}
        return documentDirectory.appendingPathComponent("emojis").appendingPathExtension("plist")
    }
    
    // MARK: - Public method
    
    func loadEmojis() -> [Emoji]? {
        guard let archiveURL = archiveURL else {return nil}
        guard let encodedEmojis = try? Data(contentsOf: archiveURL) else {return nil}
        
        let decoded = PropertyListDecoder ()
        guard let decodedEmoji = try? decoded.decode([Emoji].self, from: encodedEmojis) else {return nil}
        
        return decodedEmoji
    }
    
    func saveEmojis(_ emojis: [Emoji]) {
        let encoded = PropertyListEncoder ()
        guard let encodedEmoji = try? encoded.encode(emojis) else {return}
        guard let archiveURL = archiveURL else {return}
        try? encodedEmoji.write(to: archiveURL, options: .noFileProtection)
        print(archiveURL)
        
    } 
    
}

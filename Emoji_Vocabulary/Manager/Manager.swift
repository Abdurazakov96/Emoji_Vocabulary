//
//  Manager.swift
//  Emoji_Vocabulary
//
//  Created by Магомед Абдуразаков on 09/08/2019.
//  Copyright © 2019 Магомед Абдуразаков. All rights reserved.
//

import UIKit
class CellManager {
    
    // MARK: - Public method
    
    func configure (_ cell: EmojiCell, with emoji: Emoji) {
        cell.symbolLabel.text = emoji.symbol
        cell.nameLabel.text = emoji.name
        cell.descriptionLabel.text = emoji.description
    }
    
}

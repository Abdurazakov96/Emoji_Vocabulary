//
//  EmojiTableViewController.swift
//  Emoji_Vocabulary
//
//  Created by Магомед Абдуразаков on 07/08/2019.
//  Copyright © 2019 Магомед Абдуразаков. All rights reserved.
//

import UIKit

class EmojiTableViewController: UITableViewController {
    
    
    var cellManager = CellManager()
    var emojis = Emoji.all
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "EditSegue" else {return}
        guard let selectedPath = tableView.indexPathForSelectedRow else {return}
        
        let emoji = emojis[selectedPath.row]
        guard let destination = segue.destination as? AddEditTableViewController else {return}
        destination.emoji = emoji
     
        
    }
}

extension EmojiTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emojis.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let emoji = emojis[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "emojiCell")! as! EmojiCell
        cellManager.configure(cell, with: emoji)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedEmoji = emojis.remove(at: sourceIndexPath.row)
        emojis.insert(movedEmoji, at: destinationIndexPath.row)
        tableView.reloadData()
    }
    
    
    
    
    
}


extension EmojiTableViewController {
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        switch editingStyle {
        case .delete:
            emojis.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        case .insert:
            break
        case .none:
            break
        default:
            break
        }
    }
    
    
    
}

extension EmojiTableViewController {
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        
        guard segue.identifier == "saveSegue" else {return }
        
        let source = segue.source as! AddEditTableViewController
        
        
        
        guard source.symbolTextField.text != "" else {return}

        guard source.symbolTextField.text!.count <= 1 else {return}
        guard source.nameTextField.text != "" else {return}
        guard source.descriptionTextField.text != "" else {return}
        guard source.usageTextField.text != "" else {return}
        
        let emoji = source.emoji
        
        if let selectedPath = tableView.indexPathForSelectedRow {
            emojis[selectedPath.row] = emoji
            tableView.reloadRows(at: [selectedPath], with: .automatic)
            
        }
            else {
            let indexpath = IndexPath(row: emojis.count, section: 0)
                 emojis.append(emoji)
            tableView.insertRows(at: [indexpath], with: .automatic)
            }
        
    }
}

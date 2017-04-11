//
//  ViewController.swift
//  partyRock
//
//  Created by Humberto Sanchez Lara on 11/24/16.
//  Copyright © 2016 Humberto Sanchez. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var partyRocks = [PartyRock]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        let p1 = PartyRock(imageURL: "https://i.ytimg.com/vi/2hss9sXANv4/hqdefault.jpg?custom=true&w=336&h=188&stc=true&jpg444=true&jpgq=90&sp=68&sigh=nlolot5oJ7L7eYuIYXDrS_ZRN5Y", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/tqzQcnS2Tjw\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Video 1")
        
        let p2 = PartyRock(imageURL: "https://i.ytimg.com/vi/2hss9sXANv4/hqdefault.jpg?custom=true&w=336&h=188&stc=true&jpg444=true&jpgq=90&sp=68&sigh=nlolot5oJ7L7eYuIYXDrS_ZRN5Y", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/tqzQcnS2Tjw\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Video 2")
        
        let p3 = PartyRock(imageURL: "https://i.ytimg.com/vi/2hss9sXANv4/hqdefault.jpg?custom=true&w=336&h=188&stc=true&jpg444=true&jpgq=90&sp=68&sigh=nlolot5oJ7L7eYuIYXDrS_ZRN5Y", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/tqzQcnS2Tjw\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Video 3")
        
        let p4 = PartyRock(imageURL: "https://i.ytimg.com/vi/2hss9sXANv4/hqdefault.jpg?custom=true&w=336&h=188&stc=true&jpg444=true&jpgq=90&sp=68&sigh=nlolot5oJ7L7eYuIYXDrS_ZRN5Y", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/tqzQcnS2Tjw\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Video 4")
        
        let p5 = PartyRock(imageURL: "https://i.ytimg.com/vi/2hss9sXANv4/hqdefault.jpg?custom=true&w=336&h=188&stc=true&jpg444=true&jpgq=90&sp=68&sigh=nlolot5oJ7L7eYuIYXDrS_ZRN5Y", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/tqzQcnS2Tjw\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Video 5")
        
        partyRocks.append(p1)
        partyRocks.append(p2)
        partyRocks.append(p3)
        partyRocks.append(p4)
        partyRocks.append(p5)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PartyCell", for: indexPath) as? PartyCell {
            
            let partyRock = partyRocks[indexPath.row]
            cell.updateUI(partyRock: partyRock)
            return cell
            
        } else {
        return UITableViewCell()
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partyRocks.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let partyRock = partyRocks[indexPath.row]
        performSegue(withIdentifier: "VideoVC", sender: partyRock)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? VideoVC {
            
            if let party = sender as? PartyRock {
                destination.partyRock = party
            }
        }
    }


}


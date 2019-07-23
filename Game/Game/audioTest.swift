//
//  audioTestViewController.swift
//  Game
//
//  Created by Chloe unflat on 7/22/19.
//  Copyright © 2019 Rij Dorfman. All rights reserved.
//

import UIKit
import AVFoundation


class audioTestViewController: UIViewController{

    
    
    
    
    
    
    
    
    
}



/*{

    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
        do
        {
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "sample1", ofType: "mp3")!))
            audioPlayer.prepareToPlay()
        }
        catch
        {
            print(error)
        }
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    @IBAction func Play(_ sender: Any)
    {
        audioPlayer.play()
        print("Play")
    }
    
    
    @IBAction func Pause(_ sender: Any)
    {
        print("Pause")
        
        if audioPlayer.isPlaying
        {
            audioPlayer.pause()
        }
        else
        {
            
        }
    }
    
    @IBAction func Restart(_ sender: Any)
    {
        print("Restart")
        
        if audioPlayer.isPlaying
        {
            audioPlayer.currentTime = 0
            audioPlayer.play()
        }
        
        else
        {
            audioPlayer.play()
        }
    }
    

} */

//
//  UserAcc2ViewController.swift
//  demo1
//
//  Created by BETTY KWOK on 21/05/2017.
//  Copyright © 2017 JUNCHENG WANG. All rights reserved.
//

import UIKit
import AVFoundation
import Foundation

class UserAcc2ViewController: UIViewController, AVAudioPlayerDelegate {
   
    //Variables
    
    
    var soundPlayer: AVAudioPlayer?
    var index = 0
    var elapsedTime: TimeInterval = 0
    
    // Array of 6 songs
    var songs = ["Drenched", "Don't Leave", "Scared To Be Lonely", "Feel Good", "One More Weekend", "The One"]
    
    
    // Outlets
    @IBOutlet weak var accountlbl: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        playMusic()
    }
    
    //The order looping function
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool)
    {
        player.delegate = nil
        
        if flag {
            index += 1
            print("\(index)")
        }
        if (index == songs.count) {
            index = 0
            print("\(index)")
        }
        playMusic()
    }
    
    //Prepare to play songs
    func playMusic(){
        
        // URL of the file
        let path = Bundle.main.path(forResource: songs[index], ofType: "mp3")
        let url = URL(fileURLWithPath: path!)
        do
        {
            //set up and prepare the player by loading the sound file
            try soundPlayer = AVAudioPlayer(contentsOf: url)
            soundPlayer?.delegate = self
            soundPlayer?.prepareToPlay()
        }
            //catch the error if playback fails
        catch {print("file not available")}
        if soundPlayer != nil{
            soundPlayer!.play()
            
        }
        
    }
    
    
    // Controls the music play
    //- Parameter sender:
    
    @IBAction func musicswitch(_ sender: UISwitch) {
        if soundPlayer != nil{
            if sender.isOn == true
            {
                soundPlayer!.currentTime = elapsedTime
                soundPlayer!.play()
            }
                
            else{
                soundPlayer!.stop()
                elapsedTime = 0
            }
        }
        
    }
    
    //Stop Music when the music botton pressed
    
    @IBAction func musicstop(_ sender: UIButton) {
        soundPlayer!.stop()
        elapsedTime = 0
    }
    @IBAction func backstop(_ sender: UIButton) {
        soundPlayer!.stop()
        elapsedTime = 0
    }
    
// Display an achieve account data from UserAcc1ViewController
    override func viewDidAppear(_ animated: Bool)
    {  accountlbl.text = account
      }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
// Connected to the Parents ViewController: UserAcc1ViewController
    @IBAction func backUserAccClickAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

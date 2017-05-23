//
//  UserAcc1ViewController.swift
//  demo1
//
//  Created by BETTY KWOK on 21/05/2017.
//  Copyright © 2017 JUNCHENG WANG. All rights reserved.
//

import UIKit
import AVFoundation
import Foundation

//Global Variables

var account = ""
var password = ""

class UserAcc1ViewController: UIViewController, AVAudioPlayerDelegate {

    
    //Variables
    
    
    var soundPlayer: AVAudioPlayer?
    var index = 0
    var elapsedTime: TimeInterval = 0
    
    // Array of 6 songs
    var songs = ["Drenched", "Don't Leave", "Scared To Be Lonely", "Feel Good", "One More Weekend", "The One"]
    
    
    @IBOutlet weak var outlet: UITextField!
    
    @IBOutlet weak var outlet2: UITextField!
    
    // Operated a Successdfully Alert: 2 outlets get any string
    
    @IBAction func action(_ sender: AnyObject)
    {
       if (outlet.text != "" && outlet2.text != "")
       {
        account = outlet.text!
        password = outlet2.text!
        
        
        let alertController = UIAlertController(title: "Logged in successfully!", message: "You are now logged in",
                                                preferredStyle: .alert)
        
        // Prepare the segue before passing data and by clicking "Ok"
        let yesAction = UIAlertAction(title: "Ok", style: .default) {(action) -> Void in
            self.performSegue(withIdentifier: "segue1", sender: self)
        }
        
        alertController.addAction(yesAction)
        self.present(alertController, animated: true, completion: nil)

       }

    
        // Operated a Warning Alert: First outlet is empty
        
       if (outlet.text == "")
       {
        
        let alertController = UIAlertController(title: "Account number", message: "This cannot be empty",
                                                preferredStyle: .alert)
        
        let yesAction = UIAlertAction(title: "Ok", style: .default) {(action) -> Void in print ("ACCOUNT NUMBER CANNOT BE EMPTY")}
        
        alertController.addAction(yesAction)
        self.present(alertController, animated: true, completion: nil)
        }
        
         // Else Operated a Warning Alert: Second outlet is empty
        
       else if (outlet2.text == "")
       {
        
        let alertController = UIAlertController(title: "Password", message: "This cannot be empty",
                                                preferredStyle: .alert)
        
        let yesAction = UIAlertAction(title: "Ok", style: .default) {(action) -> Void in print ("PASSWORD CANNOT BE EMPTY")}
        
        alertController.addAction(yesAction)
        self.present(alertController, animated: true, completion: nil)
        }
        
        
    }
    
    
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

        // Do any additional setup after loading the view.

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

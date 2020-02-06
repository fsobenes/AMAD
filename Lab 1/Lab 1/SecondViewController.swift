//
//  SecondViewController.swift
//  Lab 1
//
//  Created by Fiorella Sobenes on 2/4/20.
//  Copyright © 2020 Fiorella Sobenes. All rights reserved.
//

import UIKit
import AVFoundation

class SecondViewController: UIViewController, AVAudioPlayerDelegate, AVAudioRecorderDelegate {
   
    let audioSession = AVAudioSession.sharedInstance()
       var audioPlayer: AVAudioPlayer?
       var audioRecorder: AVAudioRecorder?
       
       let filename = "audio.m4a"
    
    
    @IBOutlet weak var recordAudio: UIButton!
   
    @IBOutlet weak var stopAudio: UIButton!
    
    @IBOutlet weak var playAudio: UIButton!
    

    override func viewDidLoad() {
         super.viewDidLoad()

        playAudio.isEnabled = false
        stopAudio.isEnabled = false
         
         let dirPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
         let docDir = dirPath[0]
         let audioFileURL = docDir.appendingPathComponent(filename)
         print(audioFileURL)
         
         
         
         do {
             try audioSession.setCategory(AVAudioSession.Category.playAndRecord, mode: .default, options: .init(rawValue: 1))
         } catch {
             print("audio session error: \(error.localizedDescription)")
         }
         
         let settings = [
             AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
             AVSampleRateKey: 1200,
             AVNumberOfChannelsKey: 1,
             AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
         ]
         
         do  {
             audioRecorder = try AVAudioRecorder(url: audioFileURL, settings: settings)
             audioRecorder?.prepareToRecord()
             print("Audio recorder ready!")
         } catch {
             print("Audio recorder error: \(error.localizedDescription)")
         }
     }
    
    
    
    @IBAction func recordAudio(_ sender: Any) {
            if let recorder = audioRecorder{
                if recorder.isRecording == false{
                    playAudio.isEnabled = false
                    stopAudio.isEnabled = true
                    recorder.delegate = self
                    recorder.record()
                }
            }else{
                print("no recorder")
            }
        }
        
    
    @IBAction func stopAudio(_ sender: Any) {
        stopAudio.isEnabled = false
            playAudio.isEnabled = true
            recordAudio.isEnabled = true
            
            if audioRecorder?.isRecording == true{
                audioRecorder?.stop()
            }else{
                audioPlayer?.stop()
                //reset session mode
                do{
                    try audioSession.setCategory(AVAudioSession.Category.playAndRecord)
                }catch{
                    print(error)
                }
            }
            
        }
        
        
    
    
    @IBAction func playAudio(_ sender: Any) {
            if audioRecorder?.isRecording == false{
                
                stopAudio.isEnabled = true
                recordAudio.isEnabled = false
                
                do{
                    try audioPlayer = AVAudioPlayer(contentsOf: (audioRecorder?.url)!)
                    try audioSession.setCategory(AVAudioSession.Category.playback)
                   
                    audioPlayer!.delegate = self
                    audioPlayer!.prepareToPlay()
                    audioPlayer!.play()

                }catch{
                    print("Could not play audio")
                }
            }
            
        }
        
        func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
            recordAudio.isEnabled = true
            stopAudio.isEnabled = false
            
            do{
                try audioSession.setCategory(AVAudioSession.Category.playAndRecord)
            }catch{
                print(error)
            }
        }
        
    
    
}


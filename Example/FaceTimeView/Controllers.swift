//
//  Controllers.swift
//  FaceTimeView
//
//  Created by erbittuu on 06/02/2017.
//  Copyright © 2017 utsav.patel. All rights reserved.
//

import UIKit
import FaceTimeView

class TableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.black]
        navigationController?.navigationBar.tintColor = UIColor.black
        navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        self.title = "FaceTime View Demo"
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let view = segue.destination as? ViewController {
            view.type = Int(segue.identifier!)!
        }
    }
}

class ViewController: UIViewController {

    var type = 0
    
    @IBOutlet weak var blurView1: UIVisualEffectView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        blurView1.layer.cornerRadius = 20.0
        blurView1.layer.masksToBounds = true
        
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white]
        navigationController?.navigationBar.topItem?.title = ""
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        
        if type == 1 {
            self.title = "Front Camera"
            
            startLiveFor(type: .frontCamera, blurStyle: .light)
        }else if type == 2 {
            self.title = "Back Camera"
            
            startLiveFor(type: .backCamera)
        }else if type == 3 {
            self.title = "Gif"
            
            let path = Bundle.main.path(forResource: "giphy", ofType: "gif")
            let gifURL = URL(fileURLWithPath: path!)
            
            startLiveFor(type: .gif(gifURL))
        }else if type == 4 {
            self.title = "Videos"
            let path1 = Bundle.main.path(forResource: "v1", ofType: "mp4")
            let videoURL1 = URL(fileURLWithPath: path1!)
            
            let path2 = Bundle.main.path(forResource: "v2", ofType: "mp4")
            let videoURL2 = URL(fileURLWithPath: path2!)
            
            let path3 = Bundle.main.path(forResource: "v3", ofType: "mp4")
            let videoURL3 = URL(fileURLWithPath: path3!)
            
            startLiveFor(type: .video([videoURL1,videoURL2,videoURL3]))
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


//
//  ViewController.swift
//  World Traking
//
//  Created by Vladimir Saldivar on 4/3/18.
//  Copyright © 2018 spartdark. All rights reserved.
//

import UIKit
import ARKit
class ViewController: UIViewController {
    @IBOutlet weak var sceneView: ARSCNView!
    
    @IBAction func addBtn(_ sender: Any) {
        let node = SCNNode()
        node.geometry = SCNBox(width: 0.1, height: 0.1,length: 0.1,chamferRadius: 0)
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
        node.position = SCNVector3(-0.3,-0.2,-0.3)
        self.sceneView.scene.rootNode.addChildNode(node)
    }
    
    let configuration = ARWorldTrackingConfiguration()
    override func viewDidLoad() {
        super.viewDidLoad()
        //Configuracion
        self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints,ARSCNDebugOptions.showWorldOrigin]
        self.sceneView.session.run(configuration)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


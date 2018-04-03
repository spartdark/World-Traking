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
    @IBAction func resetBtn(_ sender: Any) {
        
    }
    
    @IBAction func addBtn(_ sender: Any) {
        let node = SCNNode()
        node.geometry = SCNBox(width: 0.1, height: 0.1,length: 0.1,chamferRadius: 0.3)
        node.geometry?.firstMaterial?.specular.contents = UIColor.white
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
        let x = randomNumbers(firstnum: -0.3, secondNumb: 0.3)
        let y = randomNumbers(firstnum: -0.3, secondNumb: 0.3)
        let z = randomNumbers(firstnum: -0.3, secondNumb: 0.3)
        node.position = SCNVector3(x,y,z)
        self.sceneView.scene.rootNode.addChildNode(node)
    }
    
    let configuration = ARWorldTrackingConfiguration()
    override func viewDidLoad() {
        super.viewDidLoad()
        //Configuracion
        self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints,ARSCNDebugOptions.showWorldOrigin]
        self.sceneView.session.run(configuration)
        self.sceneView.autoenablesDefaultLighting = true
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func randomNumbers(firstnum: CGFloat, secondNumb: CGFloat)-> CGFloat{
        return CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs(firstnum - secondNumb) + min(firstnum, secondNumb)
    }
}


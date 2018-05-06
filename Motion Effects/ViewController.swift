//
//  ViewController.swift
//  Motion Effects
//
//  Created by Girijah Nagarajah on 4/20/18.
//  Copyright © 2018 Core Sparker. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollisionBehaviorDelegate {
    
    private var animator: UIDynamicAnimator!
    private var gravity: UIGravityBehavior!
    
    private var collision: UICollisionBehavior!
    
    private var firstContact = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rect = CGRect(x: 100, y: 100, width: 100, height: 100)
        let square = UIView(frame: rect)
        square.backgroundColor = UIColor.green
        view.addSubview(square)
        
        
        animator = UIDynamicAnimator(referenceView: view)
        gravity = UIGravityBehavior(items: [square])
        animator.addBehavior(gravity)
        
        let fr = CGRect(x: 0, y: 300, width: 130, height: 20)
        let barrier = UIView(frame: fr)
        barrier.backgroundColor = UIColor.red
        view.addSubview(barrier)
        
        collision = UICollisionBehavior(items: [square])
//        collision = UICollisionBehavior(items: [square, barrier])
        collision.collisionDelegate = self
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)
        
        let rightEdge = CGPoint(x: barrier.frame.origin.x + barrier.frame.size.width,y:
            barrier.frame.origin.y)
        collision.addBoundary(withIdentifier: "barrier" as NSCopying, from:
            barrier.frame.origin, to: rightEdge)
        
        let itemBehaviour = UIDynamicItemBehavior(items: [square])
        itemBehaviour.elasticity = 0.6
        animator.addBehavior(itemBehaviour)
        
    }
    
    func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor
        item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, at p:
        CGPoint) {
        if let unwrapedIdentifier = identifier {
            print("Boundary contact occurred - \(unwrapedIdentifier)")
        } else {
            print("Boundary contact occurred - (unidentified)")
        }
        
        let view = item as! UIView
        view.backgroundColor = UIColor.yellow
        UIView.animate(withDuration: 0.3) {
            view.backgroundColor = UIColor.green
        }
        
        if !firstContact {
            firstContact = true
            let squareRect = CGRect(x: 30, y: 0, width: 100, height: 100)
            let square = UIView(frame: squareRect)
            square.backgroundColor = UIColor.blue
            self.view.addSubview(square)
            collision.addItem(square)
            gravity.addItem(square)
            let attach = UIAttachmentBehavior(item: square, attachedTo: square)
            animator.addBehavior(attach)
        }
        
    }

}


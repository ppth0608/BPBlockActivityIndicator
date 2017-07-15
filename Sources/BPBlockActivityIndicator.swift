//
//  BPBlockActivityIndicator.swift
//  BPBlockActivityIndicator
//
//  Created by taehyun.park on {TODAY}.
//  Copyright © 2017 BPBlockActivityIndicator. All rights reserved.
//

import UIKit

@IBDesignable
open class BPBlockActivityIndicator: UIView {
    
    fileprivate typealias Block = BPBlockLayer
    fileprivate typealias Cube = BPCubeSpace
    
    @IBInspectable
    var movementSpeed: Double = 0.1
    
    @IBInspectable
    var blockColor: UIColor = .blue
    
    @IBInspectable
    var blockMargin: Double = 1
    
    fileprivate var cube: Cube?
    fileprivate var blocks = [Block?]()
    fileprivate var timer: Timer?
    
    fileprivate func setupBlockLayer() {
        cube = Cube(size: frame.size, margin: blockMargin)
        
        if let cube = cube {
            (0..<cube.blockCount)
                .forEach {
                    if $0 == cube.firstEmptyIndex {
                        self.blocks.append(nil)
                    } else {
                        let block = Block(frame: cube[$0], color: blockColor)
                        self.blocks.append(block)
                        layer.addSublayer(block)
                    }
            }
        }
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupBlockLayer()
    }
    
    public init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        setupBlockLayer()
    }
}

// MARK: start / stop Animation
extension BPBlockActivityIndicator {
    
    public func animate() {
        guard timer == nil else {
            return
        }
        startBlockAnimation()
        timer = Timer.scheduledTimer(withTimeInterval: Double(cube?.blockCount ?? 0) * movementSpeed, repeats: true) { _ in
            self.startBlockAnimation()
        }
        if let timer = timer {
            RunLoop.current.add(timer, forMode: .commonModes)
        }
    }
    
    public func stop() {
        guard timer != nil else {
            return
        }
        
        timer?.invalidate()
        timer = nil
        
        blocks.forEach { $0?.stop() }
    }
}

// MARK: Property Setting
extension BPBlockActivityIndicator {
    
    public func movementSpeed(_ speed: Double) -> Self {
        movementSpeed = speed
        return self
    }
    
    public func blockColor(_ color: UIColor) -> Self {
        blockColor = color
        return self
    }
    
    public func blockMargin(_ margin: Double) -> Self {
        blockMargin = margin
        return self
    }
}

// MARK: Animation Logic
fileprivate extension BPBlockActivityIndicator {
    
    func startBlockAnimation() {
        guard  let cube = cube else {
            return
        }
        cube.animationOrder.enumerated().forEach { offset, blockIndex in
            let beginTime = Double(offset) * movementSpeed
            let destinationIndex = cube.destinationIndex(index: blockIndex) ?? 0
            
            let rect = cube[destinationIndex]
            let position = CGPoint(x: rect.origin.x + (rect.width / 2), y: rect.origin.y + (rect.height / 2))
            
            blocks[blockIndex]?.animate(duration: movementSpeed, position: position, beginTime: beginTime)
            blocks[destinationIndex] = blocks[blockIndex]
        }
    }
}

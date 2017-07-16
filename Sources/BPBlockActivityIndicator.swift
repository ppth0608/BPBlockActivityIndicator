//
//  BPBlockActivityIndicator.swift
//  BPBlockActivityIndicator
//
//  Created by taehyun.park on {TODAY}.
//  Copyright © 2017 BPBlockActivityIndicator. All rights reserved.
//

import UIKit

@IBDesignable
public class BPBlockActivityIndicator: UIView {
    
    fileprivate typealias Block = BPBlockLayer
    fileprivate typealias Cube = BPCubeSpace
    
    @IBInspectable
    public var animationSpeed: Double = 0.1 {
        didSet {
            movementSpeed = animationSpeed
        }
    }
    
    @IBInspectable
    public var color: UIColor = .blue {
        didSet {
            blockColor = color
            self.blocks.forEach {
                $0?.backgroundColor = blockColor.cgColor
            }
        }
    }
    
    fileprivate var movementSpeed: Double = 0.1
    fileprivate var blockColor: UIColor = .blue
    fileprivate var blockMargin: Double = 1
    
    fileprivate var cube: Cube?
    fileprivate var blocks = [Block?]()
    fileprivate var timer: Timer?
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupCube()
        setupBlockLayer()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCube()
        setupBlockLayer()
    }
    
    override public func awakeFromNib() {
        super.awakeFromNib()
    }
}

// MARK: setup View
fileprivate extension BPBlockActivityIndicator {
    
    func setupCube() {
        cube = Cube(size: frame.size, margin: blockMargin)
    }
    
    func setupBlockLayer() {
        guard let cube = cube else {
            return
        }
        removeAllSublayers()
        removeAllBlocks()
        addBlocksToSublayer(with: cube)
    }
    
    func removeAllSublayers() {
        layer.sublayers?.forEach {
            $0.removeFromSuperlayer()
        }
    }
    
    func removeAllBlocks() {
        blocks.removeAll()
    }
    
    func addBlocksToSublayer(with cube: Cube) {
        (0..<cube.blockCount).forEach {
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

// MARK: start / stop Animation
public extension BPBlockActivityIndicator {
    
    func animate() {
        guard timer == nil else {
            return
        }
        setupBlockLayer()
        startBlockAnimation()
        timer = Timer.scheduledTimer(timeInterval: Double(cube?.blockCount ?? 0) * movementSpeed, target: self, selector: #selector(self.startBlockAnimation), userInfo: nil, repeats: true)
        if let timer = timer {
            RunLoop.current.add(timer, forMode: .commonModes)
        }
    }
    
    func stop() {
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
}

// MARK: Animation Logic
fileprivate extension BPBlockActivityIndicator {
    
    @objc func startBlockAnimation() {
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

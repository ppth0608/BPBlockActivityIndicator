//
//  BPCubeGenerator.swift
//  BPBlockActivityIndicator
//
//  Created by Naver on 2017. 7. 9..
//  Copyright © 2017년 BPBlockActivityIndicator. All rights reserved.
//

import UIKit

internal struct BPCubeSpace {
    
    fileprivate enum Direction {
        case up
        case down
        case right
        case left
    }
    
    fileprivate let cubeSize: (width: Double, height: Double)
    fileprivate let margin: Double
    fileprivate let rowCount = 3
    fileprivate let columnCount = 3
    
    var blockCount: Int {
        return rowCount * columnCount
    }
    
    var firstEmptyIndex: Int {
        return 2
    }
    
    var animationOrder = [1, 0, 3, 6, 7, 8, 5, 2]
    
    init(size: CGSize, margin: Double) {
        let squareCubeSize = size.width <= size.height ? CGSize(width: size.width, height: size.width) : CGSize(width: size.height, height: size.height)
        self.cubeSize = (Double(squareCubeSize.width), Double(squareCubeSize.height))
        self.margin = margin
    }
    
    fileprivate var blockSize: CGSize {
        let width = (cubeSize.width - margin * Double((rowCount - 1))) / Double(rowCount)
        let height = (cubeSize.height - margin * Double((columnCount - 1))) / Double(columnCount)
        return CGSize(width: width, height: height)
    }
    
}

extension BPCubeSpace {
    
    subscript(index: Int) -> CGRect {
        var frame = CGRect()
        frame.origin = blockPoint(index: index)
        frame.size = blockSize
        return frame
    }
    
    func destinationIndex(index: Int) -> Int? {
        guard let direction = blockDirection(index: index) else {
            return nil
        }
        var destinationIndex = 0
        switch direction {
        case .right: destinationIndex = index + 1
        case .up: destinationIndex = index - rowCount
        case .left: destinationIndex = index - 1
        case .down: destinationIndex = index + rowCount
        }
        return destinationIndex
    }
}

fileprivate extension BPCubeSpace {
    
    func blockPoint(index: Int) -> CGPoint {
        let blockRow = Int(index / columnCount)
        let blockColumn = Int(index % rowCount)
        let x = (Double(blockColumn) * Double(blockSize.width)) + (Double(blockColumn) * margin)
        let y = (Double(blockRow) * Double(blockSize.height)) + (Double(blockRow) * margin)
        return CGPoint(x: x, y: y)
    }
    
    func blockDirection(index: Int) -> Direction? {
        let blockRow = Int(index / columnCount)
        let blockColumn = Int(index % rowCount)
        
        if blockRow == 0 && blockColumn != (columnCount - 1) {
            return .right
        } else if blockColumn == 0 && blockRow != 0 {
            return .up
        } else if blockRow == (rowCount - 1) && blockColumn != 0 {
            return .left
        } else if blockColumn == (columnCount - 1) && blockRow != (rowCount - 1) {
            return .down
        }
        
        return nil
    }
}

//
//  ButtonBlock.swift
//  Rover
//
//  Created by Sean Rucker on 2018-04-24.
//  Copyright © 2018 Rover Labs Inc. All rights reserved.
//

public struct ButtonBlock: Block {
    public var background: Background
    public var border: Border
    public var id: String
    public var name: String
    public var insets: Insets
    public var opacity: Double
    public var position: Position
    public var tapBehavior: BlockTapBehavior
    public var text: Text
    public var keys: [String: String]
    public var tags: [String]
    public var conversion: Conversion?

    
    public init(background: Background, border: Border, id: String, name: String, insets: Insets, opacity: Double, position: Position, tapBehavior: BlockTapBehavior, text: Text, keys: [String: String], tags: [String], conversion: Conversion?) {
        self.background = background
        self.border = border
        self.id = id
        self.name = name
        self.insets = insets
        self.opacity = opacity
        self.position = position
        self.tapBehavior = tapBehavior
        self.text = text
        self.keys = keys
        self.tags = tags
        self.conversion = conversion
    }
}

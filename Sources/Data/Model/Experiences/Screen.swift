//
//  Screen.swift
//  RoverData
//
//  Created by Sean Rucker on 2017-10-19.
//  Copyright © 2017 Rover Labs Inc. All rights reserved.
//

public struct Screen: Codable {
    public struct StatusBar: Codable {
        public enum Style: String, Codable {
            case dark = "DARK"
            case light = "LIGHT"
        }

        public var style: Style
        public var color: Color
        
        public init(style: Style, color: Color) {
            self.style = style
            self.color = color
        }
        
        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(self.color, forKey: .color)
            try container.encode(self.style.rawValue, forKey: .style)
        }
        
        enum CodingKeys: String, CodingKey {
            case style
            case color
        }
    }
    
    public struct TitleBar: Codable {
        public enum Buttons: String, Codable {
            case close = "CLOSE"
            case back = "BACK"
            case both = "BOTH"
        }
        
        public var backgroundColor: Color
        public var buttons: Buttons
        public var buttonColor: Color
        public var text: String
        public var textColor: Color
        public var useDefaultStyle: Bool
        
        public init(backgroundColor: Color, buttons: Buttons, buttonColor: Color, text: String, textColor: Color, useDefaultStyle: Bool) {
            self.backgroundColor = backgroundColor
            self.buttons = buttons
            self.buttonColor = buttonColor
            self.text = text
            self.textColor = textColor
            self.useDefaultStyle = useDefaultStyle
        }
    }
    
    public var background: Background
    public var id: String
    public var name: String
    public var isStretchyHeaderEnabled: Bool
    public var rows: [Row]
    public var statusBar: StatusBar
    public var titleBar: TitleBar
    public var keys: [String: String]
    public var tags: [String]
    
    public init(background: Background, id: String, name: String, isStretchyHeaderEnabled: Bool, rows: [Row], statusBar: StatusBar, titleBar: TitleBar, keys: [String: String], tags: [String]) {
        self.background = background
        self.id = id
        self.name = name
        self.isStretchyHeaderEnabled = isStretchyHeaderEnabled
        self.rows = rows
        self.statusBar = statusBar
        self.titleBar = titleBar
        self.keys = keys
        self.tags = tags
    }
}

// MARK: Attributes

extension Screen {
    public var attributes: Attributes {
        return [
            "id": id,
            "name": name,
            "keys": keys,
            "tags": tags
        ]
    }
}

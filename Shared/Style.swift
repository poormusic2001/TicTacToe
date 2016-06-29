//
//  Style.swift
//  TicTacToad
//
//  Created by Andrew Shepard on 6/28/16.
//  Copyright © 2016 Andrew Shepard. All rights reserved.
//

#if os(iOS)
    import UIKit
#elseif os(OSX)
    import AppKit
#endif

struct Style {
    struct Colors {
        static let background = Color.hexColor("#323845")
        static let button = Color.hexColor("#E3F09B")
        static let text = Color.hexColor("#323845")
    }
}
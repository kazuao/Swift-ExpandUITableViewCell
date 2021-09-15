//
//  Section.swift
//  ExpandUITableViewCell
//
//  Created by k-aoki on 2021/09/15.
//

import Foundation

class Section {
    let title: String
    let options: [String]
    var isOpened: Bool = false

    init(title: String, options: [String], isOpened: Bool = false) {
        self.title = title
        self.options = options
        self.isOpened = isOpened
    }
}

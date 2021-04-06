//
//  Array+only.swift
//  phonecall
//
//  Created by Tom Lou on 4/5/21.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}

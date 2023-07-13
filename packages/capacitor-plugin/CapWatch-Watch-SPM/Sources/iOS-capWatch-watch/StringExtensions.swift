//
//  StringExtensions.swift
//  
//
//  Created by Dan Giralté on 2/24/23.
//

extension StringProtocol {
    var lines: [SubSequence] { split(whereSeparator: \.isNewline) }
}

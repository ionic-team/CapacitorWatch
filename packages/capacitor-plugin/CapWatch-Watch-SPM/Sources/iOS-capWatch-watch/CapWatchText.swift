//
//  CapWatchText.swift
//  
//
//  Created by Dan Giralté on 2/24/23.
//

import SwiftUI
import RegexBuilder

struct CapWatchText: View {
    var text: String
    
    init(_ txt: String, _ vm: [String: String]? = nil) {
        text = txt
        
        text = replaceVars(txt, vm)
    }
    
    var body: some View {
        Text(text)
    }
    
    func replaceVars(_ text: String, _ vm: [String: String]? = nil) -> String {
        if let vm {
            let varSearch = Regex {
                Anchor.wordBoundary
                "$"
                ZeroOrMore {
                    CharacterClass(
                        ("a"..."z"),
                        ("A"..."Z"),
                        ("0"..."9")
                    )
                }
            }

            let ranges = text.ranges(of: varSearch)

            var finalText = text

            for range in ranges {
                let ph = text[range]
                
                // this seems dumb?
                var varName = ph
                varName.removeFirst()
                
                let varVal = vm[String(varName)] ?? String(varName)
                
                finalText = finalText.replacing(ph, with: varVal)
            }
            
            return finalText
        } else {
            return text
        }
    }
}

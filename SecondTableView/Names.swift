//
//  Names.swift
//  SecondTableView
//
//  Created by Qiankang Zhou on 8/21/17.
//  Copyright © 2017 Qiankang Zhou. All rights reserved.
//

import Foundation

class Names {
    var names: [String]
    
    init?() {
        guard let nameFileURL = Bundle.main.url(forResource: "propernames", withExtension: "txt") else {
            print("Init failed to read URL")
            return nil
        }
        
        guard let namestr = try? String(contentsOf: nameFileURL, encoding: .utf8) else {
            print("Init failed to load string")
            return nil
        }
        names = namestr.components(separatedBy: "\n")
        names.sort()
    }
    
    
}

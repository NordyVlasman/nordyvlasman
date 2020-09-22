//
//  File.swift
//  
//
//  Created by Nordy Vlasman on 16/09/2020.
//

import Foundation

extension DateFormatter {
    static var blog: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
}

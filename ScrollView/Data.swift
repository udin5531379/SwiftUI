//
//  Data.swift
//  ScrollView
//
//  Created by Udin Rajkarnikar on 20/8/21.
//  Copyright © 2020 np.com.udinrajkarnikar. All rights reserved.
//

import SwiftUI
import UIKit

let quoteData: [Quotes] = load("quotes.json")

func load<T: Decodable>(_ filename: String, as type: T.Type = T.self) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else { fatalError("Couldnt load the file") }
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldnt load the file")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("error while decoding file")
    }
 }



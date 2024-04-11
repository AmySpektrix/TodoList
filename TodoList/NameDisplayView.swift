//
//  NameDisplayView.swift
//  TodoList
//
//  Created by Amy Brown on 10/04/2024.
//

import Foundation
import SwiftUI

    struct NameDisplayView: View {
        var petName: String

        var body: some View {
            Text("Your pet's name is \(petName)")
                .navigationTitle("Pet Name")
        }
    }


//
//  ContentView.swift
//  AnnoyingBadge
//
//  Created by Ioan Adrian Hancu on 2023-11-09.
//

import SwiftUI

struct ContentView: View {
    @State var count = UserDefaults.standard.integer(forKey: "count")
    let defaults = UserDefaults.standard
    
    var body: some View {
        VStack(spacing: 20) {
            Text(count.formatted())
                .font(.largeTitle)
            
            Button {
                count += 1
                defaults.set(count, forKey: "count")
                UNUserNotificationCenter.current().requestAuthorization(options: .badge) { (granted, error) in
                    if error == nil {
                        UNUserNotificationCenter.current().setBadgeCount(count)
                    }
                }
            } label: {
                Text("Increment badge!")
                    .padding()
            }
            .buttonStyle(.borderedProminent)

        }
        .padding()
    }
}

#Preview {
    ContentView()
}

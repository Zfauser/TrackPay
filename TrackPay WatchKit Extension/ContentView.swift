//
//  ContentView.swift
//  TrackPay WatchKit Extension
//
//  Created by Zach Fauser on 2022-07-24.
//

// The Plan For This App:
// get the time when users work starts (7am)
// get the time when users work ends (3pm)
// get per hour wage users making ($15.50)
// convert to per minute wage ($0.258333333333333)
// get the current date + time (EX. 12:30)
// check if the user is currently working (if the current time is between 7am and 3pm and not sat or sun)
// if time is before start set money made so far to 0
// elif time is after end set money made to the total amount of hours worked times hourly wage
// elif time is during the workday, find how many minutes it has been since start (EX. YES, 330 minutes)
// if the user is currently working do per minute wage times amount of minutes worked (EX. 330 x $0.258333333333333 = $85.24999999999989)
// round to nearest cent (EX. $85.25)
// display how much money made so far today and how many hours and minutes the use has worked (EX. "You Have Worked 5 hours and 30 minutes" /n "You have made $85.25 so far)
// LATER
// check if sat or sunday
// notification when work is done
// GOAL
// Have a watch complication saying how much the user has made so far that day

import SwiftUI

struct ContentView: View {
    @State private var currentTime = Date()

    var body: some View {
        VStack {
            Text("Current Time")
                .font(.headline)
                .padding()
            Text(currentTime, style: .time)
                .font(.largeTitle)
                .fontWeight(.bold)
        }
        .onAppear {
            // Update the time every second
            let timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                currentTime = Date()
            }
            // Invalidate the timer when this view disappears
            RunLoop.current.add(timer, forMode: .common)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

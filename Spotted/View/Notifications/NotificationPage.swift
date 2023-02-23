//
//  NotificationPage.swift
//  Spotted
//
//  Created by Meher Khurana on 12/30/22.
//

import SwiftUI

struct NotificationPage: View {
    @State var selectedDate = Date()
    let notify = NotificationHandler()
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            Button("Send notification in 5 seconds") {
                notify.sendNotification(
                    date: Date(),
                    type: "time",
                    timeInterval: 5,
                    title: "5 second notification",
                    body: "You can write more in here!")
            }
            DatePicker("Pick a date:", selection: $selectedDate, in: Date()...)
            Button("Schedule notification") {
                notify.sendNotification(
                    date:selectedDate,
                    type: "date",
                    title: "Date based notification",
                    body: "This notification is a reminder that you added a date. Tap on the notification to see more.")
            }.tint(.orange)
            Spacer()
            Text("Not working?")
                .foregroundColor(.gray)
                .italic()
            Button("Request permissions") {
                notify.askPermission()
            }
        }
        .padding()
    }
}


struct NotificationPage_Previews: PreviewProvider {
    static var previews: some View {
        NotificationPage()
    }
}

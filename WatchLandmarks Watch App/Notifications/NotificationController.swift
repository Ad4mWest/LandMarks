//  NotificationController.swift
//  WatchLandmarks Watch App
//  Created by Adam West on 25.12.2023.

import WatchKit
import SwiftUI
import UserNotifications


class NotificationController: WKUserNotificationHostingController<NotificationView> {
    // MARK: Public Properties
    var landmark: Landmark?
    var title: String?
    var message: String?
    
    let landmarkIndexKey = "landmarkIndex"
    
    // MARK: Lifecycle
    override var body: NotificationView {
            NotificationView(
                title: title,
                message: message,
                landmark: landmark
            )
        }
    
    // MARK: Public methods
    override func didReceive(_ notification: UNNotification) {
           let modelData = ModelData()

           let notificationData =
               notification.request.content.userInfo as? [String: Any]

           let aps = notificationData?["aps"] as? [String: Any]
           let alert = aps?["alert"] as? [String: Any]

           title = alert?["title"] as? String
           message = alert?["body"] as? String

           if let index = notificationData?[landmarkIndexKey] as? Int {
               landmark = modelData.landmarks[index]
           }
       }
}

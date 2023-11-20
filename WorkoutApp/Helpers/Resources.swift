//
//  Resources.swift
//  WorkoutApp
//
//  Created by Razumov Pavel on 30.10.2023.
//

import UIKit

enum Resources {
    enum Colors {
        static let active = UIColor(hexString: "#437BFE")
        static let inActive = UIColor(hexString: "#929DA5")
        static let separator = UIColor(hexString: "#E8ECEF")
        static let titleGray = UIColor(hexString: "#545C77")
        static let background = UIColor(hexString: "#F8F9F9")
        static let secondary = UIColor(hexString: "#F0F3FF")
    }
    
    enum Strings {
        enum TabBar {
            static func title(for tab: Tabs) -> String {
                switch tab {
                case .overview: return "Overview"
                case .session: return "Session"
                case .progress: return "Progress"
                case .settings: return "Settings"
                }
            }
        }
        
        enum NavBar {
            static let session = "High Intensity Cardio"
            static let progress = "Workout progress"
            static let settings = "Settings"
            static let overview = "Today"
        }
        
        enum Session {
            static let navBarStart = "Start   "
            static let navBarPause = "Pause"
            static let navBarFinish = "Finish"
            
            static let elapsedTime = "Elapsed Time"
            static let remainingTime = "Remaining Time"
            
            static let workoutStats = "Workout stats"
            static let averagePace = "Average pace"
            static let heartRate = "Heart rate"
            static let totalDistance = "Total distance"
            static let totalSteps = "Total steps"
            
            static let stepsCounter = "Steps counter"
        }
        
        enum Progress {
            static let navBarLeft = "Export"
            static let navBarRight = "Details"
        }
        
        enum Overview {
            static let allWorkoutsButton = "All Workouts"
        }
    }
    
    enum Images {
        enum TabBar {
            static func icon(for tab: Tabs) -> UIImage? {
                switch tab {
                case .overview: return UIImage(named: "Overview")
                case .session: return UIImage(named: "Session")
                case .progress: return UIImage(named: "Progress")
                case .settings: return UIImage(named: "Settings")
                }
            }
        }
        
        enum Common {
            static let downArrow = UIImage(named: "DownArrow")
            static let addButton = UIImage(named: "addButton")
        }
        
        enum Session {
            static let heartBeat = UIImage(named: "heart_beat")
            static let speed = UIImage(named: "speed")
            static let steps = UIImage(named: "steps")
            static let map = UIImage(named: "map")

        }
    }
    
    enum Fonts {
        static func helveticalRegular(with size: CGFloat) -> UIFont {
            UIFont(name: "Helvetica", size: size) ?? UIFont()
        }
    }
}

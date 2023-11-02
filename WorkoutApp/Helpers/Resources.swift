//
//  Resources.swift
//  WorkoutApp
//
//  Created by Razumov Pavel on 30.10.2023.
//

import UIKit

enum Resources {
    enum Colors {
        static var active = UIColor(hexString: "#437BFE")
        static var inActive = UIColor(hexString: "#929DA5")
        static var separator = UIColor(hexString: "#E8ECEF")
        static var titleGray = UIColor(hexString: "#545C77")
        static var background = UIColor(hexString: "#F8F9F9")
        static var secondary = UIColor(hexString: "#F0F3FF")
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
            static var session = "High Intensity Cardio"
            static var progress = "Workout progress"
            static var settings = "Settings"
            static var overview = "Today"
        }
        
        enum Session {
            static var navBarLeft = "Pause"
            static var navBarRight = "Finish"
        }
        
        enum Progress {
            static var navBarLeft = "Export"
            static var navBarRight = "Details"
        }
        
        enum Overview {
            static var allWorkoutsButton = "All Workouts"
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
            static var downArrow = UIImage(named: "DownArrow")
            static var addButton = UIImage(named: "addButton")
        }
    }
    
    enum Fonts {
        static func helveticalRegular(with size: CGFloat) -> UIFont {
            UIFont(name: "Helvetica", size: size) ?? UIFont()
        }
    }
}

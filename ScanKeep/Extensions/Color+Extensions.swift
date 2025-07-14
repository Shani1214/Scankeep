//
//  Color+Extensions.swift
//  Starafa
//
//  Created by macmini on 04/09/2024.
//

import Foundation
import SwiftUI


extension Color {
    static var theme = AppTheme()
    
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

//struct AppTheme {
//    let lightblue = Color("LightBlue")
//    let darkblue = Color("DarkBlue")
//    let lightskyblue = Color("LightSkyBlue")
//    let apporange1 = Color("AppOrange")
//    let apporange = Color("AppOrange1")
//    let diseasedescription = Color("diseasedescription_bg")
//    let goodfoodoverlay = Color("GoodFoodoverlay")
//    let dieseaseoverlay = Color("DiseaseDetailsoverlay")
//    let linkslightcolor = Color("LinksLightColor")
//    let precatuionslightcolor = Color("precautionlightcolor")
//    let appred = Color("Appred")
//    let resultlight = Color ("resultlightColor")
//    let resultcolor = Color("ResultColor")
//    let badfoodBackground = Color("badfoodbackground")
//    let badfoodcolor = Color("badfoodColor")
//    let bluecolor = Color("likesBlue")
//    let linksdarkgreen = Color("linksDarkGreen")
//    let tasklightgreen = Color("Tasklightgreen")
//    let taskcolor = Color("TaskColorGreen")
//    let darkpurple = Color("DarkPurple")
//    let appgreen1 = Color("AppGreen 1")
//    let appblue = Color("AppBLue")
//    let lightgreen = Color("Lightgreen")
//    let orange = Color("AppOrange")
//    let skyblue = Color("Skyblue")
// //   let appred = Color("appRed")
//    let purplecolor = Color("purplecolor")
//   // let skyblue = Color("SkyBlue")
//    let appPrimary = Color("AppPrimary")
//    let LightYellow = Color("LightYellow")
//    let appBlack = Color("Black")
//    let apptextfield = Color("TextFieldColor")
//    let appGray = Color("AppGray")
//    let appWhite =  Color("White")
//    let Categories = Color("Categories")
//    let appGreen  = Color("AppGreen")
//    let ChatColor = Color("ChatColor")
//    
//}
struct AppTheme {
    let appprimary = Color("AppPrimary")
    let appred = Color("AppRed")
}

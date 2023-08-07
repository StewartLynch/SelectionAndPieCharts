//
// Created for SelectionAndPieCharts
// by  Stewart Lynch on 2023-08-05
//
// Follow me on Mastodon: @StewartLynch@iosdev.space
// Follow me on Threads: @StewartLynch (https://www.threads.net)
// Follow me on X: https://x.com/StewartLynch
// Subscribe on YouTube: https://youTube.com/@StewartLynch
// Buy me a ko-fi:  https://ko-fi.com/StewartLynch


import Foundation
import SwiftUI

struct WineType: Identifiable {
    let name: String
    let inStock: Int
    let color: Color
    let text: String
    var id: String {
        name
    }
    
    static var all: [WineType] {
        [
            .init(name: "Fortified", inStock: 7, color: .fortifiedWine, text: "a wine to which a distilled spirit, usually brandy, has been added."),
            .init(name: "Red", inStock: 40, color: .redWine, text: "a type of wine made from dark-colored grape varieties. The color of the wine can range from intense violet, typical of young wines, through to brick red for mature wines and brown for older red wines."),
            .init(name: "Sparkling", inStock: 8, color: .sparklingWine, text: "wine with significant levels of carbon dioxide in it, making it fizzy."),
            .init(name: "Rosé", inStock: 5, color: .roseWine, text: "a type of wine that incorporates some of the color from the grape skins, but not enough to qualify it as a red wine."),
            .init(name: "White", inStock: 82, color: .whiteWine, text: "a wine that is fermented without skin contact. The colour can be straw-yellow, yellow-green, or yellow-gold.")
            
        ]
    }
}

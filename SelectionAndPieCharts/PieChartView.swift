//
// Created for SelectionAndPieCharts
// by  Stewart Lynch on 2023-08-05
//
// Follow me on Mastodon: @StewartLynch@iosdev.space
// Follow me on Threads: @StewartLynch (https://www.threads.net)
// Follow me on X: https://x.com/StewartLynch
// Subscribe on YouTube: https://youTube.com/@StewartLynch
// Buy me a ko-fi:  https://ko-fi.com/StewartLynch


import Charts
import SwiftUI


struct PieChartView: View {
    var wineTypes = WineType.all
    var body: some View {
        NavigationStack {
            VStack {
                Chart(wineTypes) { wineType in
                    SectorMark(
                        angle: .value("In Stock", wineType.inStock),
                        angularInset: 1
                    )
                    .annotation(position: .overlay) {
                        Text("\(wineType.inStock)")
                            .foregroundStyle(.white)
                    }
                        .foregroundStyle(wineType.color)
                }
                VStack(alignment: .leading) {
                    ForEach(wineTypes) { wineType in
                        Label(wineType.name, systemImage: "square.fill")
                            .foregroundStyle(wineType.color)
                    }
                }
                Spacer()
            }
            .padding()
            .navigationTitle("Pie Chart")
        }
    }
}

#Preview {
    PieChartView()
}

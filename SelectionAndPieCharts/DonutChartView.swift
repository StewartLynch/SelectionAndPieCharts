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

struct DonutChartView: View {
    var wineTypes = WineType.all
    @State private var selectedCount: Int?
    @State private var selectedWineType: WineType?
    var body: some View {
        NavigationStack {
            VStack {
                Chart(wineTypes) { wineType in
                    SectorMark(
                        angle: .value("In Stock", wineType.inStock),
                        innerRadius: .ratio(0.65),
                        outerRadius: selectedWineType?.name == wineType.name ? 175 : 150,
                        angularInset: 1
                    )
                    .foregroundStyle(wineType.color)
                    .cornerRadius(10)
                }
                .chartAngleSelection(value: $selectedCount)
                .chartBackground { _ in
                    if let selectedWineType {
                        VStack {
                            Image(systemName: "wineglass.fill")
                                .font(.largeTitle)
                                .foregroundStyle(Color(selectedWineType.color))
                            Text(selectedWineType.name)
                                .font(.largeTitle)
                            Text("In Stock: \(selectedWineType.inStock)")
                        }
                    } else {
                        VStack {
                            Image(systemName: "wineglass.fill")
                                .font(.largeTitle)
                                .foregroundColor(.red)
                            Text("Select a segment")
                        }
                    }
                }
                .frame(height: 350)
                if let selectedWineType {
                    Text(selectedWineType.text)
                }
                Spacer()
            }
            .onChange(of: selectedCount) { oldValue, newValue in
                if let newValue {
                    withAnimation {
                        getSelectedWineType(value: newValue)
                    }
                }
            }
            .padding()
            .navigationTitle("Donut Chart")
        }
    }
    private func getSelectedWineType(value: Int) {
        var cumulativeTotal = 0
        let wineType = wineTypes.first { wineType in
            cumulativeTotal += wineType.inStock
            if value <= cumulativeTotal {
                selectedWineType = wineType
                return true
            }
            return false
        }
    }
}

#Preview {
    DonutChartView()
}

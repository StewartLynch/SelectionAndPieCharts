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

struct BarChartView: View {
    var wineTypes = WineType.all
    @State private var selectedWineType: WineType?
    @State private var selectedName: String?
    var body: some View {
        NavigationStack {
            VStack {
                Chart(wineTypes) { wineType in
                    BarMark(
                        x: .value(
                            "Type",
                            wineType.name
                        ),
                        y: .value(
                            "In Stock",
                            wineType.inStock
                        )
                    )
                    .foregroundStyle(selectedWineType?.name == wineType.name ? Color.gray.gradient : wineType.color.gradient)
                    .annotation {
                        Text("\(wineType.inStock)")
                    }
                }
                .frame(height: 400)
                .chartXSelection(value: $selectedName)
                .onChange(of: selectedName) { oldValue, newValue in
                    if let newValue {
                        getSelectedWineType(name: newValue)
                    }
                }
                if let selectedWineType {
                    VStack {
                        Text(selectedWineType.name)
                            .font(.title)
                        Text(selectedWineType.text)
                    }
                }
                Spacer()
            }
            .padding()
            .navigationTitle("Bar Chart")
        }
    }
    private func getSelectedWineType(name: String) {
        selectedWineType = wineTypes.first {$0.name == name }
    }
}

#Preview {
    BarChartView()
}

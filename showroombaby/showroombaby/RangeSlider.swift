import SwiftUI

struct RangeSlider: View {
    @Binding var range: ClosedRange<Double>
    var rangeLimits: ClosedRange<Double>
    var step: Double
    
    var body: some View {
        VStack {
            HStack {
                Slider(value: Binding(
                    get: { range.lowerBound },
                    set: { range = $0...range.upperBound }
                ), in: rangeLimits, step: step)
                
                Slider(value: Binding(
                    get: { range.upperBound },
                    set: { range = range.lowerBound...$0 }
                ), in: rangeLimits, step: step)
            }
        }
    }
}

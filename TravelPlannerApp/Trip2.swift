import SwiftUI

struct TrailStop: Identifiable {
    let id = UUID()
    var position: CGPoint
    var label: String
}

struct DottedTrailView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var tripName = "Trip Name"
    @State private var stops: [TrailStop] = [
        TrailStop(position: CGPoint(x: 120, y: 100), label: "Stop 1"),
        TrailStop(position: CGPoint(x: 250, y: 210), label: "Stop 2"),
        TrailStop(position: CGPoint(x: 120, y: 320), label: "Stop 3")
    ]
    // Positioning constants
    private let leftX: CGFloat = 120
    private let rightX: CGFloat = 250
    private let startY: CGFloat = 100
    private let verticalSpacing: CGFloat = 110

    var body: some View {
        ZStack {
            Color(hex: "#EFFFFD").ignoresSafeArea()
            // Dotted trail line
            TrailPath(points: stops.map { $0.position })
                .stroke(style: StrokeStyle(lineWidth: 2, dash: [5, 5]))
                .foregroundColor(Color(hex: "#437995"))
            // Stop icons + editable boxes
            ForEach(Array(stops.enumerated()), id: \.1.id) { index, stop in
                VStack(spacing: 4) {
                    Image(systemName: "mappin.circle.fill")
                        .font(.title)
                        .foregroundColor(Color(hex: "#DA4453"))
                    HStack {
                        TextField("Edit stop", text: $stops[index].label)
                            .padding(5)
                        Button(action: {
                            stops.remove(at: index)
                        }) {
                            Image(systemName: "trash")
                                .foregroundColor(.red)
                        }
                    }
                    .frame(width: 140, height: 50)
                    .background(Color.white)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(hex: "#437995")))
                    .cornerRadius(10)
                }
                .position(stop.position)
            }
            // Editable trip name & back button
            VStack {
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(Color(hex: "#DA4453"))
                    }
                    TextField("Trip Name", text: $tripName)
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(Color(hex: "#103254"))
                    Spacer()
                }
                .padding()
                Spacer()
                // Add Stop Button at the bottom
                Button(action: {
                    let nextIndex = stops.count
                    let x = (nextIndex % 2 == 0) ? leftX : rightX
                    let y = startY + CGFloat(nextIndex) * verticalSpacing
                    let newStop = TrailStop(position: CGPoint(x: x, y: y), label: "Stop \(nextIndex + 1)")
                    stops.append(newStop)
                }) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                        Text("Add Stop")
                            .fontWeight(.semibold)
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(Color(hex: "#437995"))
                    .cornerRadius(12)
                }
                .padding(.bottom, 30)
            }
        }
    }
}

struct TrailPath: Shape {
    var points: [CGPoint]
    func path(in rect: CGRect) -> Path {
        var path = Path()
        guard points.count >= 2 else { return path }
        path.move(to: points[0])
        for i in 1..<points.count {
            let mid = CGPoint(
                x: (points[i].x + points[i - 1].x) / 2,
                y: (points[i].y + points[i - 1].y) / 2
            )
            path.addQuadCurve(to: mid, control: points[i - 1])
            path.addQuadCurve(to: points[i], control: mid)
        }
        return path
    }
}

// Helper to convert hex color to SwiftUI Color
extension Color {
    init(hex: String) {
        let hex = hex.replacingOccurrences(of: "#", with: "")
        var rgb: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&rgb)
        let r = Double((rgb >> 16) & 0xFF) / 255
        let g = Double((rgb >> 8) & 0xFF) / 255
        let b = Double(rgb & 0xFF) / 255
        self.init(red: r, green: g, blue: b)
    }
}

#Preview {
    DottedTrailView()
}

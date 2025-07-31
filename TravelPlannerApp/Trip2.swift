import SwiftUI

struct TrailStop {
    let position: CGPoint
    let label: String
}

struct DottedTrailView: View {
    let stops: [TrailStop] = [
        TrailStop(position: CGPoint(x: 50, y: 100), label: "Stop 1"),
        TrailStop(position: CGPoint(x: 250, y: 180), label: "Stop 2"),
        TrailStop(position: CGPoint(x: 120, y: 320), label: "Stop 3")
    ]

    var body: some View {
        ZStack {
            Color(hex: "#EFFFFD").ignoresSafeArea()

            // Dotted line trail
            TrailPath(points: stops.map { $0.position })
                .stroke(style: StrokeStyle(lineWidth: 2, dash: [5, 5]))
                .foregroundColor(Color(hex: "#437995"))

            // Stop points + boxes
            ForEach(0..<stops.count, id: \.self) { i in
                let stop = stops[i]
                VStack(alignment: .leading, spacing: 6) {
                    Image(systemName: "mappin.circle.fill")
                        .font(.title)
                        .foregroundColor(Color(hex: "#DA4453"))
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(hex: "#437995"), lineWidth: 1)
                        .background(Color.white)
                        .frame(width: 120, height: 50)
                        .cornerRadius(10)
                }
                .position(stop.position)
            }

            // Trip Name & Back
            VStack {
                HStack {
                    Image(systemName: "chevron.left")
                        .foregroundColor(Color(hex: "#DA4453"))
                    Text("My Trip")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(Color(hex: "#103254"))
                    Spacer()
                }
                .padding()
                Spacer()
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

// Hex to Color helper
extension Color {
    init(hex: String) {
        let hex = hex.replacingOccurrences(of: "#", with: "")
        let scanner = Scanner(string: hex)
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        let r = Double((rgb >> 16) & 0xFF) / 255
        let g = Double((rgb >> 8) & 0xFF) / 255
        let b = Double(rgb & 0xFF) / 255
        self.init(red: r, green: g, blue: b)
    }
}

#Preview {
    DottedTrailView()
}

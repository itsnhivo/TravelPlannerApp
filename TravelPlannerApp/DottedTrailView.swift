//
//  Trip2.swift
//  TravelPlannerApp
//
//  Created by Joyce Yang on 7/30/25.
//

import SwiftUI

struct DottedTrailView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var trip: Trip
    @State private var currentScrollIndex: Int = 0

    private let leftX: CGFloat = 120
    private let rightX: CGFloat = 250
    private let startY: CGFloat = 100
    private let verticalSpacing: CGFloat = 110

    var body: some View {
        ZStack {
            Color.appLightBlue.ignoresSafeArea()
            
            ScrollViewReader { proxy in
                ScrollView(.vertical, showsIndicators: false) {
                    ZStack {
                        TrailPath(points: trip.stops.map { $0.position })
                            .stroke(style: StrokeStyle(lineWidth: 2, dash: [5, 5]))
                            .foregroundColor(.appBlue)
                        
                        ForEach(Array(trip.stops.enumerated()), id: \.0) { index, stop in
                            VStack(spacing: 4) {
                                Image(systemName: "mappin.circle.fill")
                                    .font(.title)
                                    .foregroundColor(.appRed)
                                HStack {
                                    TextField("Edit stop", text: $trip.stops[index].label)
                                        .padding(5)
                                    Button(action: {
                                        withAnimation {
                                            trip.stops.remove(at: index)
                                        }
                                        if currentScrollIndex >= trip.stops.count {
                                            currentScrollIndex = max(0, trip.stops.count - 1)
                                        }
                                    }) {
                                        Image(systemName: "trash.circle.fill")
                                            .foregroundColor(.appRed)
                                    }
                                }
                                .padding()
                                .frame(width: 180, height: 50)
                                .background(Color.appCream)
                                .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.appBlue))
                                .cornerRadius(12)
                                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 3)
                            }
                            .position(stop.position)
                            .id(index)
                        }
                    }
                    .frame(height: (startY + CGFloat(trip.stops.count) * verticalSpacing + 400))
                    .padding(.top, 200)
                    .padding(.bottom, 200)
                }
                .overlay(
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            VStack(spacing: 16) {
                                Button(action: {
                                    let newIndex = max(currentScrollIndex - 1, 0)
                                    if trip.stops.indices.contains(newIndex) {
                                        withAnimation {
                                            proxy.scrollTo(newIndex, anchor: .center)
                                        }
                                        currentScrollIndex = newIndex
                                    }
                                }) {
                                    Image(systemName: "arrow.up.circle.fill")
                                        .resizable()
                                        .frame(width: 44, height: 44)
                                        .foregroundColor(.appBlue)
                                        .shadow(radius: 4)
                                }
                                Button(action: {
                                    let newIndex = min(currentScrollIndex + 1, trip.stops.count - 1)
                                    if trip.stops.indices.contains(newIndex) {
                                        withAnimation {
                                            proxy.scrollTo(newIndex, anchor: .center)
                                        }
                                        currentScrollIndex = newIndex
                                    }
                                }) {
                                    Image(systemName: "arrow.down.circle.fill")
                                        .resizable()
                                        .frame(width: 44, height: 44)
                                        .foregroundColor(.appBlue)
                                        .shadow(radius: 4)
                                }
                            }
                            .padding(.trailing, 16)
                            .padding(.bottom, 80)
                        }
                    }
                )
                .onChange(of: trip.stops.count) {
                    if let lastIndex = trip.stops.indices.last {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            withAnimation {
                                proxy.scrollTo(lastIndex, anchor: .center)
                            }
                            currentScrollIndex = lastIndex
                        }
                    }
                }
            }
            
            VStack {
                HStack {
                    Button(action: { dismiss() }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.appRed)
                            .font(.title)
                    }
                    
                    TextField("Trip Name", text: $trip.name)
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.appDarkBlue)
                        .padding(.horizontal)

                    Spacer()
                }
                .padding()
                .background(Color.appLightBlue.opacity(0.8))
                
                Spacer()
                
                Button(action: {
                    let nextIndex = trip.stops.count
                    let x = (nextIndex % 2 == 0) ? leftX : rightX
                    let y = startY + CGFloat(nextIndex) * verticalSpacing
                    let newStop = TrailStop(position: CGPoint(x: x, y: y), label: "Stop \(nextIndex + 1)")
                    withAnimation {
                        trip.stops.append(newStop)
                    }
                }) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                        Text("Add Stop")
                            .fontWeight(.semibold)
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.appBlue)
                    .cornerRadius(12)
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 3)
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

#Preview {
    let sampleTrip = Binding.constant(Trip(name: "Sample Trip"))
    return DottedTrailView(trip: sampleTrip)
}

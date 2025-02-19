//
//  SwiftUIView.swift
//  Orca Shuttle
//
//  Created by Harshit Garg on 14/02/25.
//

import SwiftUI

public struct SwiftUIView: View {
    public init() {}
    public var body: some View {
        ListingView()
//        ZStack{
//            HStack{
//                Color(cgColor: Color.theme.cgColor)
//                    }
//            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//        }
        
    }
}

#Preview {
        SwiftUIView()
  
}


import SwiftUI

struct ListingView: View {
    var body: some View {
        ZStack (alignment: .top){
            VStack(alignment: .leading){
                NavigationView()
                CalenderView()
                Divider().foregroundColor(Color.border).padding(.top, -15)
                FilterView()
                RouteView()
                Spacer()
                
                
            }
            .background(.white)
        }
    }
}

#Preview {
    ListingView()
}

struct NavigationView : View{
    var body: some View {
        HStack{
            Button(action: {
                print("back")
            }) {
                Image(.icBack)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
            }.padding(.leading)
            Text("Cooper Square -> Broom St")
                .font(.system(size: 18))
                .foregroundColor(.white)
                .padding(.leading)
                .font(.custom(Font.PoppinsSemiBold, size: 26))
            Spacer()
            
            Button(action: {
                print("edit")
            }) {
                Image(.icEdit)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 37, height: 37)
            }
            .padding(.trailing)
        }.frame(height: 60)
            .background(Color.theme)
    }
}

struct CalenderView : View{
    @State private var selectedDate: Date = Date()
    
    // Generate dates for the next 30 days dynamically
    private var dates: [Date] {
        let calendar = Calendar.current
        return (0..<6).compactMap { calendar.date(byAdding: .day, value: $0, to: Date()) }
    }
    
    var body: some View {
        HStack{
            Button(action: {
                print("Calender")
            }) {
                Image(.icCalender)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
            }.padding(.leading)
            Divider().background(Color.border).frame(width: 1, height: 25)
            //List  {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 10) {
                    ForEach(dates, id: \.self) { date in
                        ClenderCellView(date: date, isSlected:isSelected(date))
                            .onTapGesture {
                                selectedDate = date
                            }
                    }
                }
            }
            .padding(.trailing)
            //}
            .background(.white)
        }.frame(height: 100)
        
        
        
    }
    
    private func isSelected(_ date: Date) -> Bool {
        Calendar.current.isDate(date, inSameDayAs: selectedDate)
    }
    
}

struct ClenderCellView :View {
    var date = Date()
    var isSlected : Bool
    // var day = ""
    var body: some View {
        let calendar = Calendar.current
        let day = calendar.component(.day, from: date)
        let weekday = calendar.shortWeekdaySymbols[calendar.component(.weekday, from: date) - 1]
        VStack{
            Text("\(day)")
                .foregroundColor( isSlected ? Color.theme : .darkGray)
                .font(.custom(Font.PoppinsMedium, size: 16))
            Text(weekday)
                .foregroundColor( isSlected ? Color.theme : .darkGray)
                .font(.custom(Font.PoppinsRegular, size: 12))
        }
        .frame(width: 50, height: 50)
        .background(Color.backgroundGray)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(isSlected ? Color.theme : .clear, lineWidth: isSlected ? 1 : 0)
        )
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .padding(.vertical, 5)
        
    }
}


struct FilterView: View {
    var body: some View {
        HStack{
            Button(action: {
                print("Calender")
            }) {
                Image(.icFilterUnselected)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
            }.padding(.leading)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(0..<10, id: \.self) { _ in
                        FilterCellView(isSelected: nil)
                    }
                }
            }
            
            
        }
    }
}

struct FilterCellView : View {
    var isSelected:Int? = nil
    var body: some View {
        HStack{
            Image(.icMorning)
                .resizable()
                .frame(width: 16, height: 16)
            Text("06:00 am - 12:00 pm")
                .foregroundColor(Color.darkGray)
                .font(.custom(Font.PoppinsMedium, size: 14))
            if isSelected != nil {
                Button(action: {
                    print("Cross")
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .foregroundColor(Color.theme)
                        .scaledToFit()
                    
                        .frame(width: 16, height: 16)
                }
            }
        }.padding(10)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.border, lineWidth: 1)
                // Border follows shape perfectly
            )
            .clipShape(RoundedRectangle(cornerRadius: 8))
        //            .border(.border,width: 1)
        //            .cornerRadius(8)
        
    }
}

struct RouteView :View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            ForEach(0..<1, id: \.self) { date in
                RouteViewCell()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding(16)
                    .shadow(color: Color.border.opacity(0.7), radius: 8, x: 0, y: 0)
            }
        }
        .background(Color.backgroundBlue)
    }
}

struct RouteViewCell : View {
    @State private var ispickupImageStops: Bool = false
    @State private var isdropImageStops: Bool = false
    var body: some View {
        VStack(spacing: 0) {
            //MARK: Bus name view
            HStack(alignment: .center){
                Image(.icBus)
                    .resizable()
                    .frame(width: 32, height: 32)
                    .padding(.leading,10)
                
                
                Text("MI 0123")
                    .foregroundColor(Color.theme)
                    .font(.custom(Font.PoppinsMedium, size: 18))
                Spacer()
                HStack {
                    Image(.icClock)
                        .resizable()
                        .foregroundColor(Color.theme)
                        .scaledToFit()
                        .frame(width: 16, height: 16)
                        .padding(.leading, 8)
                    Text("08:30 AM")
                        .foregroundColor(.white)
                        .padding(.trailing, 8)
                        .font(.custom(Font.PoppinsMedium, size: 14))
                }
                .frame(height: 35)
                
                .background(.black)
                .cornerRadius(8)
                .padding(.trailing, 16)
                
                
            }
            .frame(height : 60)
            .background(Color.backgroundGray)
            
            Divider().background(Color.border)
            //MARK: Seat view
            HStack {
                Text("Fastest")
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .foregroundColor(.white)
                    .background(.red)
                    .cornerRadius(8)
                    .font(.custom(Font.PoppinsMedium, size: 14))
                
                Text("AC")
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .foregroundColor(.black)
                    .background(Color.backgroundGray)
                    .font(.custom(Font.PoppinsMedium, size: 14))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.border, lineWidth: 1) // Border follows shape perfectly
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                //                    .border(.border, width: 1)
                //                    .cornerRadius(8)
                
                Spacer()
                //
                HStack {
                    Image(.icSeat)
                        .resizable()
                        .foregroundColor(Color.theme)
                        .scaledToFit()
                        .frame(width: 18, height: 18)
                        .padding(.leading, 8)
                        .padding(.vertical, 8)
                    Text("80")
                        .foregroundColor(.white)
                        .padding(.trailing, 8)
                        .padding(.leading, -7)
                        .font(.custom(Font.PoppinsMedium, size: 14))
                }
                .background(Color.theme)
                .cornerRadius(8)
                .padding(.trailing, 16)
                
                
                
            }
            .frame(height: 50)
            .padding(8)
            //MARK: Dotted View
            DottedDivider()
                .padding(.horizontal, 8)
            //MARK: Pickup and drop view
            ZStack{
                VStack(alignment: .leading){
                    //MARK: Pickup view
                    HStack(alignment: .top){
                        VStack(alignment: .center){
                            Text("08:30 AM")
                                .padding(.top)
                                .font(.custom(Font.PoppinsMedium, size: 14))
                            
                            Image(.icPickup)
                                .resizable()
                                .frame(width: 20, height: 20)
                                .padding(.top,8)
                            Rectangle() // Instead of Divider() for better vertical control
                                .frame(width: 1)
                                .foregroundColor(.border)
                                .frame(maxHeight: .infinity)
                                .padding(0)
                                .padding(.top, -10)
                            //Divider().foregroundColor(.border).frame(width: 7, height: .infinity)
                        }
                        .padding(.trailing,16)
                        VStack(alignment: .leading){
                            Text("715 Broadway, New York")
                                .foregroundColor(.black)
                                .multilineTextAlignment(.leading)
                                .padding(.top)
                                .font(.custom(Font.PoppinsMedium, size: 16))
                            HStack(alignment: .bottom,spacing: 8){
                                Image(.icManWalking)
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .padding(.top, 10)
                                
                                Text("500 meter walk for pickup")
                                    .foregroundColor(.darkGray)
                                    .multilineTextAlignment(.leading)
                                    .padding(.top)
                                    .lineLimit(1)
                                    .font(.custom(Font.PoppinsMedium, size: 14))
                                
                                
                                
                                Button(action: {
                                    withAnimation { // Smooth transition effect
                                        ispickupImageStops.toggle()
                                    }
                                    print("edit")
                                }) {
                                    Image( ispickupImageStops ? .icArrowUp : .icArrowDown)
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .padding(.top, 10)
                                }
                            }
                            .padding(.bottom, 8)
                            if ispickupImageStops {
                                
                                ScrollView(.horizontal, showsIndicators: false) {
                                    LazyHStack(spacing: 10) {
                                        ForEach(0..<10, id: \.self) { date in
                                            RouteImageCell()
                                        }
                                    }
                                }
                                .padding(.bottom, 8)
                                .cornerRadius(10)
                                
                                
                            }
                            HStack{
                                HStack {
                                    Image(.icStops)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 16, height: 16)
                                    Text("5 Stop")
                                        .font(.custom(Font.PoppinsMedium, size: 14))
                                        .foregroundColor(.darkGray)
                                }
                                //.padding(.top, 10)
                                .padding(.vertical, 8)
                                .padding(.horizontal,8)
                                .background(Color.backgroundGray)
                                .cornerRadius(8)
                                
                                HStack {
                                    Image(.icTime)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 16, height: 16)
                                    Text("1h 10m")
                                        .font(.custom(Font.PoppinsMedium, size: 14))
                                        .foregroundColor(.darkGray)
                                }
                                //.padding(.top, 10)
                                .padding(.vertical, 8)
                                .padding(.horizontal,8)
                                .background(Color.backgroundGray)
                                .cornerRadius(8)
                            }
                            
                        }
                        
                    }
                    //
                    
                    
                    //MARK: Drop view
                    HStack(alignment: .top){
                        VStack(alignment: .center){
                            Rectangle() // Instead of Divider() for better vertical control
                                .frame(width: 1)
                                .foregroundColor(.border)
                                .frame(maxHeight: .infinity)
                                .padding(.bottom, -20)
                                .padding(.top, -20)
                            
                            Image(.icDrop)
                                .resizable()
                                .frame(width: 20, height: 20)
                                .padding(.bottom,8)
                            
                            Text("08:30 AM")
                                .padding(.bottom)
                                .font(.custom(Font.PoppinsMedium, size: 14))
                            
                            
                            
                            //Divider().foregroundColor(.border).frame(width: 7, height: .infinity)
                        }
                        .padding(.trailing,16)
                        
                        VStack(alignment: .leading){
                            Text("715 Broadway, New York")
                                .foregroundColor(.black)
                                .multilineTextAlignment(.leading)
                                .padding(.top)
                                .font(.custom(Font.PoppinsMedium, size: 16))
                            HStack(alignment: .bottom,spacing: 8){
                                Image(.icManWalking)
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .padding(.top, 10)
                                
                                Text("500 meter walk for pickup")
                                    .foregroundColor(.darkGray)
                                    .multilineTextAlignment(.leading)
                                    .padding(.top)
                                    .lineLimit(1)
                                    .font(.custom(Font.PoppinsMedium, size: 14))
                                
                                
                                
                                Button(action: {
                                    withAnimation { // Smooth transition effect
                                        isdropImageStops.toggle()
                                    }
                                    print("edit")
                                }) {
                                    Image( isdropImageStops ? .icArrowUp : .icArrowDown)
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .padding(.top, 10)
                                }
                            }
                            if isdropImageStops {
                                
                                ScrollView(.horizontal, showsIndicators: false) {
                                    LazyHStack(spacing: 10) {
                                        ForEach(0..<10, id: \.self) { date in
                                            RouteImageCell()
                                        }
                                    }
                                }
                                .padding(.top, 8)
                                .cornerRadius(10)
                                
                            }
                            
                            
                        }
                        
                    }
                }
            }
            .padding(.leading, 16)
            .padding(.trailing, 16)
            .padding(.bottom, 10)
            
            VStack{
                HStack{
                    //MARK: Fare view
                    VStack(alignment: .leading){
                        Text("$25")
                            .font(.custom(Font.PoppinsSemiBold, size: 25))
                            .foregroundColor(Color.theme)
                        Text("Fare starting from")
                            .font(.custom(Font.PoppinsMediumItalic, size: 12))
                            .foregroundColor(.darkGray)
                    }
                    Spacer()
                    //MARK: Book now Button
                    Button("Book Now") {
                        print("ent")
                    }
                    .frame(width: 150, height: 50)
                    .font(.custom(Font.PoppinsMedium, size: 18))
                    //                    .padding(.vertical, 10)
                    //                    .padding(.horizontal, 20)
                    .background(Color.theme)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.trailing, 16)
                    
                    
                }
                HStack{
                    Button(action: {
                        print("ent")
                    }) {
                        HStack {
                            Text("Get Direction")
                                .font(.custom(Font.PoppinsMedium, size: 14))
                            
                            Image(.icGoogleMap)
                                .resizable() // Allows resizing
                                .scaledToFit() // Maintains aspect ratio
                                .frame(width: 20, height: 20) // Set desired size
                            
                            
                        }
                        .frame(width: 150, height: 50)
                        //                        .padding(.vertical, 10)
                        //                        .padding(.horizontal, 20)
                        .background(.white)
                        .foregroundColor(.darkGray)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.border, lineWidth: 1)
                            // Border follows shape perfectly
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    Spacer()
                    Button(action: {
                        print("ent")
                    }) {
                        HStack {
                            Image(.icRoute)
                                .resizable() // Allows resizing
                                .scaledToFit() // Maintains aspect ratio
                                .frame(width: 20, height: 20) // Set desired size
                            
                            Text("View Full Route")
                                .font(.custom(Font.PoppinsMedium, size: 14))
                        } .frame(width: 150, height: 50)
                        //                        .padding(.vertical, 10)
                        //                        .padding(.horizontal, 10)
                            .background(.white)
                            .foregroundColor(Color.theme)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.theme, lineWidth: 1) // Border follows shape perfectly
                            )
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                        //.border(.Color.theme, width: 1)
                        //  .cornerRadius(10)
                        
                    }
                    .padding(.trailing, 16)
                }.padding(.top, 12)
            }
            
            .padding(.leading, 16)
            .padding(.top, 10)
            .padding(.bottom, 12)
            .background(Color.backgroundGray)
            
            
        }
        .background(.white)
        
    }
}

struct RouteImageCell :View {
    var body: some View {
        ZStack{
            Image(.imgStops)
                .resizable()
                .frame(maxWidth: 150, maxHeight: 100)
                .cornerRadius(10)
        }
    }
}

struct DottedDivider: View {
    var body: some View {
        Rectangle()
            .fill(Color.clear)
            .frame(height: 1) // Height of the divider
            .overlay(
                Rectangle()
                    .stroke(style: StrokeStyle(lineWidth: 1, dash: [3.2])) // Dotted style
                    .foregroundColor(Color.border)
            )
    }
}

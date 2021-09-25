//
//  BookingView.swift
//  MovieTicketDribble
//
//  Created by Satya Prakash Sahu on 25/09/21.
//

import SwiftUI

struct BookingView: View {
    
    @State var bookedSeats : [Int] = [1,10,25,45,59,60]
    @State var selectedSeats : [Int] = []
    
    
    @State var date : Date = Date()
    
    @State var selectedTiem = "11:30"
    
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            HStack  {
                
                Button(action: {
                    
                    NavigationLink(
                        destination: Home(),
                        label: {
                            Text("")
                        })
                    
                    
                }, label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.white)
                        .font(.title2)
                })
                
                Spacer()
            }
            .overlay(
                Text("Select Seats")
                    .fontWeight(.semibold)
                    .font(.title2)
                    .foregroundColor(.white)
            )
            .padding()
            
            // Curve for the scren
            
            GeometryReader   {   bounds in
                
                let width = bounds.frame(in: .global).width
                
                Path  { path in
                    
                    //Creating a simple curve
                    path.move(to: CGPoint(x: 0, y: 50 ))
                    path.addCurve(to: CGPoint(x: width, y: 50), control1: CGPoint(x : width/2,y:0), control2: CGPoint(x: width, y: 50))
                    
                }
                .stroke(Color.gray,lineWidth: 1.5)
                
                
            }
            .frame(maxHeight : 50)
            .padding(.top,20)
            .padding(.horizontal,35)
            
           
            // Grid Layout for seats
            
            // Total seats = 60 4 fake seats to adjust space..
            
            let totalSeats = 60 + 4
            
            let leftSide = 0..<totalSeats/2
            let rightSide = totalSeats/2..<totalSeats
            
            HStack(spacing: 30.0){
                
                let columns = Array(repeating: GridItem(.flexible(),spacing: 10), count: 4)
                
                LazyVGrid(columns: columns, spacing: 10, content: {
                    
                    ForEach(leftSide, id:\.self)    {   item in
                        
                        let seat = item >= 29 ? item - 1 : item
                        
                        SeatView(item: item, seat: seat, selectedSeats: $selectedSeats, bookedSeats: $bookedSeats)
                            .contentShape(Rectangle())
                            .onTapGesture {
                                print(seat)
                                
                                // Check and add the seats
                                if selectedSeats.contains(seat) {
                                    selectedSeats.removeAll{  removeSeat -> Bool in
                                        
                                        return removeSeat == seat
                                    }
                                    return
                                }
                                
                                // adding
                                
                                selectedSeats.append(seat)
                                
                            }
                            // Dissabled if the seat is booked
                            .disabled(bookedSeats.contains(seat))
                    }
                    
                    
                })
                
                LazyVGrid(columns: columns, spacing: 10, content: {
                    
                    ForEach(rightSide, id:\.self)    {   item in
                        
                        let seat = item >= 35 ? item - 2 : item - 1
                        
                        SeatView(item: item, seat: seat, selectedSeats: $selectedSeats, bookedSeats: $bookedSeats)
                            .contentShape(Rectangle())
                            .onTapGesture {
                                print(seat)
                                
                                // Check and add the seats
                                if selectedSeats.contains(seat) {
                                    selectedSeats.removeAll{  removeSeat -> Bool in
                                        return removeSeat == seat
                                    }
                                    return
                                }
                                
                                // adding
                                
                                selectedSeats.append(seat)
                            }
                            // Dissabled if the seat is booked
                            .disabled(bookedSeats.contains(seat))
                    }
                    
                })
                
            }
            .padding()
            .padding(.top, 70.0)
            
            
            HStack(spacing: 12.0){
                
                // Box and Text 1
                RoundedRectangle(cornerRadius: 4, style: .continuous)
                    .stroke(Color.gray)
                    .frame(width: 20.0, height: 20.0)
                    .overlay(
                        Image(systemName: "xmark")
                            .font(.caption)
                            .foregroundColor(.gray)
                    )
                
                Text("Booked")
                    .font(.footnote)
                    .foregroundColor(.gray)
                
                
                
                
                // Available
                RoundedRectangle(cornerRadius: 4, style: .continuous)
                    .stroke(Color.gray,lineWidth: 1.5)
                    .frame(width: 20.0, height: 20.0)
                
                
                Text("Available")
                    .foregroundColor(.gray)
                    .font(.footnote)
                
                
                
                // Booked
                RoundedRectangle(cornerRadius: 4, style: .continuous)
                    .fill(Color(#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)))
                    .frame(width: 20.0, height: 20.0)
                
                
                Text("Selected")
                    .foregroundColor(.gray)
                    .font(.footnote)
                
                
            }
            .padding(.top,25)
            
            HStack {
                
                
                Text("Date : ")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Spacer()
                
                DatePicker("", selection: $date, displayedComponents : .date)
                    .labelsHidden()
                
            }
            .padding()
            .padding(.top)
            
            ScrollView(.horizontal, showsIndicators: false, content: {
                HStack(spacing: 15.0){
                    ForEach(time,id : \.self) { item in
                        
                        Text(item)
                            .fontWeight(.bold)
                            .foregroundColor(selectedTiem == item ? .black : .white )
                            .padding(.vertical)
                            .padding(.horizontal, 30.0)
                            .background(Color(#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)).opacity(selectedTiem == item ? 1 : 0.2))
                            .cornerRadius(15)
                            
                            .onTapGesture {
                                
                                withAnimation(.easeInOut){
                                    selectedTiem = item
                                }
                            }
                        
                        
                    }
                }.padding()
            })
            
            HStack(spacing: 15.0) {
                
                VStack(alignment: .leading, spacing: 10.0){
                    Text("\(selectedSeats.count) Seats")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text("$\(selectedSeats.count * 70)")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.yellow)
                    
                    
                    
                }
                .frame(width: 100.0)
                
                
                Button(action: {}, label: {
                    Text("Buy Tickets")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding(.horizontal)
                        .padding(.vertical)
                        .frame(maxWidth : .infinity)
                        .background(Color(#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)))
                        .cornerRadius(15)
                    
                    
                })
                
                
            }
            .padding()
            
        })
        .background(Color(#colorLiteral(red: 0.1921568662, green: 0.007843137719, blue: 0.09019608051, alpha: 1)).ignoresSafeArea())
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}


struct SeatView : View {
    var item : Int
    var seat : Int
    
    @Binding var selectedSeats : [Int]
    @Binding var bookedSeats : [Int]
    
    var body: some View {
        
        ZStack  {
            RoundedRectangle(cornerRadius: 6)
                .stroke(bookedSeats.contains(seat) ? Color.gray: Color(#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)),lineWidth: 1.5)
                .frame(height: 30.0)
                
                .background(
                    
                    selectedSeats.contains(seat) ? Color(#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)) : Color.clear
                    
                )
              
                
                // Hide the 4 fake seats
                
                .opacity(item == 0 || item == 28 || item == 35 || item == 63 ? 0 : 1)
            
            if bookedSeats.contains(seat)   {
                Image(systemName: "xmark")
                    .foregroundColor(.gray)
                
            }
            
            
        }
        
        
    }
}



struct BookingView_Previews: PreviewProvider {
    static var previews: some View {
        BookingView()
    }
}

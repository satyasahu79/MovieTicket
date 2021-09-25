//
//  Home.swift
//  MovieTicketDribble
//
//  Created by Satya Prakash Sahu on 25/09/21.
//

import SwiftUI

struct Home: View {
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false, content: {
            
            LazyVStack(
                spacing: 15,
                pinnedViews: [.sectionFooters],
                content: {
                    
                    Section(footer: FooterView()) {
                        HStack{
                            Button(action: {}, label: {
                                Image(systemName: "chevron.left")
                                    .font(.title2)
                                
                            })
                            
                            Spacer()
                            
                            Button(action: {}, label: {
                                Image(systemName: "bookmark")
                                    .font(.title2)
                                
                            })
                            
                            
                            
                        }
                        
                        
                        .overlay(
                            
                            Text("Trending")
                                .font(.title2)
                                .fontWeight(.semibold)
                        )
                        .padding()
                        .foregroundColor(.white)
                        
                        //                    Movie Poster
                        
                        ZStack  {
                            
                            // Bottom Shadow
                            
                            RoundedRectangle(cornerRadius: 15, style: .continuous)
                                .fill(
                                    Color.white
                                        .opacity(0.15)
                                )
                                .padding(.horizontal)
                                .offset(x: 0, y: 15)
                                .blur(radius: 25)
                            
                            
                            Image("pic 1")
                                .resizable()
                                .scaledToFill()
                                .clipped()
                                .cornerRadius(15)
                            
                            
                        }
                        .frame(width: getRect().width/1.5, height: getRect().height/2, alignment: .center)
                        .padding(.top,20)
                        
                        
                        VStack(alignment: .leading, spacing: 15, content: {
                            Text("Bueaty and the Beast")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            
                            
                            Text("Director : Bill Condon | 4.2")
                                .foregroundColor(.white)
                                .overlay(
                                    Image(systemName: "star.fill")
                                        .foregroundColor(.yellow)
                                        .offset(x: 35)
                                    
                                    ,alignment: .trailing)
                            
                            
                            // Generes...
                            
                            LazyVGrid(columns: [GridItem(.adaptive(minimum: 75))],alignment:.leading ,content: {
                                ForEach(genre,id : \.self){ item in
                                    
                                    Text(item)
                                        .font(.caption)
                                        
                                        .padding(.vertical,10)
                                        .foregroundColor(.white)
                                        .frame(maxWidth : .infinity)
                                        .background(Color.white.opacity(0.08))
                                        .clipShape(Capsule())
                                    
                                }
                                
                                
                                
                            })
                            .padding(.top,10)
                            //                    .padding(.leading,26)
                            
                            
                            Text("Synopsis")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
    //                            .padding(.vertical)
                            
                            Text(intro)
                                
                                .foregroundColor(.white)
                                .padding(.bottom, 30.0)
                       
                        })  // VStack Ends
                        .padding(.top,30.0)
                        .padding(.horizontal)
                        .padding(.leading, 10.0)
                        .frame(maxWidth: .infinity,alignment: .leading)
                    }
                    
                    
                })
         
        })  // Scroll View Ends
        
        .background(Color(#colorLiteral(red: 0.168627451, green: 0.2431372549, blue: 0.2862745098, alpha: 1)).ignoresSafeArea())
        
        
        
        
        
        
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

//Extending the view to get rect

extension View{
    func getRect() -> CGRect    {
        return UIScreen.main.bounds
    }
}



// Footer Button

struct FooterView : View {
    var body: some View {
        NavigationLink(
            destination: BookingView(),
            label: {
                Text("Buy Ticket")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.vertical)
                    .frame(width: getRect().width / 2)
                    .background(Color(#colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)))
                    .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                    .shadow(color: .white.opacity(0.2), radius: 10, x: 5, y: 5 )
                    .shadow(color: .white.opacity(0.2), radius: 10, x: -5, y: -5 )
                
            })
    }
}

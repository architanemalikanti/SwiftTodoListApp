//
//  ContentView.swift
//  TodoListApp
//
//  Created by Archita Nemalikanti on 6/2/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false //UI will react to this variable.
    //set up UI: what happens if isNight is true, false?
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight);
            VStack(spacing: 8){
                CityTextView(cityName: "Cupertino, CA")
                MainWeatherStatusView(imageName: isNight ? "moon": "cloud.sun.fill",
                                      temp: 76)
                
                
                
                HStack (spacing: 16){
                    WeatherDayView(dayOfWeek: "TUES", imageName: "wind.snow", temperature: 78)
                    WeatherDayView(dayOfWeek: "WED", imageName: "snow", temperature: 88)
                    WeatherDayView(dayOfWeek: "THURS", imageName: "cloud.sun.fill", temperature: 99)
                    WeatherDayView(dayOfWeek: "FRI", imageName: "sunset.fill", temperature: 45)
                    WeatherDayView(dayOfWeek: "SAT", imageName: "cloud.sun.fill", temperature: 66)
                    WeatherDayView(dayOfWeek: "SUN", imageName: "tornado", temperature: 78)
                    
                }
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change day time",
                           textColor: .blue,
                           backgroundColor: .white)
                }
            }
                
        }
            
    }
        
}


#Preview {
    ContentView()
}

struct WeatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    var body: some View { //has a var called body, returns a View.
        VStack{
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
            
            
            
            
        }
    }
}

struct BackgroundView: View {
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient (gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue") ]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
    
}

struct CityTextView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    var imageName: String
    var temp: Int
    
    var body: some View {
        Image(systemName: imageName)
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 180, height: 180)
        
        Text("\(temp)°")
            .font(.system(size: 70, weight: .medium))
            .foregroundColor(.white)
        
    }
}



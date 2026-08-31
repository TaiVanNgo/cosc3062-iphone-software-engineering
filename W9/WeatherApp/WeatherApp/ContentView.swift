//
//  ContentView.swift
//  WeatherApp
//
//  Created by Van Tai on 28/8/26.
//

import SwiftUI

struct ContentView: View {
    @State var weatherVM = WeatherViewmodel()
    @State var city = ""
    
    var body: some View {
        ZStack{
            LinearGradient(
                colors: [.blue.opacity(0.8), .white] ,
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack(spacing: 20) {
                
                TextField("Enter the city name", text: $city)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(.white)
                    )
                
                Button {
                    Task {
                        await weatherVM.loadWeather(city: city)
                    }
                } label: {
                    Text("Get Weather")
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 60)
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .fill(.blue)
                        )
                }
                
                if(weatherVM.isLoading){
                    ProgressView("Loading weather...")

                } else if let weather = weatherVM.weather {
                    VStack(alignment: .leading) {
                        HStack(spacing: 15) {
                            Image(systemName: "location.fill")
                                .font(.system(size: 30))
                                .foregroundStyle(.red)
                                
                            
                            VStack(alignment: .leading){
                                Text(weather.name)
                                    .font(.title)
                                    .fontWeight(.black)
                                
                                Text(weather.country)
                                    .foregroundStyle(.gray)
                                    .font(.subheadline)
                            }
                           
                            Spacer()
                        }
                        
                        VStack(alignment: .leading, spacing: 20){
                            RowItem(name: "Temperature", systemName: "thermometer.sun", value: "\(weather.temp) C", color: .orange)
                            
                            RowItem(name: "Humidity", systemName: "humidity.fill", value: String(weather.humidity), color: .blue)

                            RowItem(name: "Wind Speed", systemName: "wind", value: String(weather.windspeed), color: .gray)
                            
                            RowItem(name: "Sunrise", systemName: "sunrise", value: formatTime(weather.sunrise), color: .yellow)
                            
                            RowItem(name: "Sunset", systemName: "sunset", value: formatTime(weather.sunset), color: .orange)
                        }
                        .padding()
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 30)
                            .fill(.white)
                            .shadow(radius: 3, x: 4, y: 0)
                    )
                }
                else if let errorMessage = weatherVM.errorMessage {
                    Text(errorMessage)
                        .foregroundStyle(.red)
                }
            }
            .padding()
        }
    }
    
    func RowItem(
        name: String,
        systemName: String,
        value: String,
        color: Color
    ) -> some View {
        HStack{
            Image(systemName: systemName)
                .font(.system(size: 30))
                .foregroundStyle(color)
            
            VStack(alignment: .leading){
                Text(name)
                    .font(.headline)
                    .foregroundStyle(.gray)
                    .fontWeight(.semibold)
                
                Text(value)
                    .font(.subheadline)
                    .fontWeight(.heavy)
            }
            
            Spacer()
        }
        .padding(.horizontal, 5)
        .padding(.vertical, 5)
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(.white)
                .shadow(
                     color: .black.opacity(0.08),
                     radius: 5,
                     y: 2
                 )
        )
    }
    
    func formatTime(_ timestamp: Int) -> String{
        let date = Date(
            timeIntervalSince1970: TimeInterval(timestamp)
        )
        
        return date.formatted(
            date: .omitted,
            time: .shortened
        )
    }
}

#Preview {
    ContentView()
}

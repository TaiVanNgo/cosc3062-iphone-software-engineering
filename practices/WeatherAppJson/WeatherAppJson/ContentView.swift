//
//  ContentView.swift
//  WeatherAppJson
//
//  Created by Van Tai on 17/9/26.
//

import SwiftUI

enum City: String, CaseIterable, Identifiable, Codable {
    case hcm
    case hn
    case syd
    case mel
    case tok
    
    var id: String { rawValue }
}


struct ContentView: View {
    var weatherData: [Weather]
    
    @State var selectedCityId = "hcm"
    
    var cityWeather: Weather? {
        weatherData.first{ $0.id == selectedCityId}
    }
    
    var body: some View {
        ZStack{
            LinearGradient(
                gradient: Gradient(
                    colors: [.blue.opacity(0.6), .white]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack(alignment: .leading){
                HStack{
                    Text("Choose your city")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Picker("", selection: $selectedCityId) {
                        Text("Choosing City")
                        ForEach(City.allCases) { c in
                            Text(c.rawValue)
                                .tag(c as City?)
                        }
                    }
                    .pickerStyle(.menu)
                }
                
                
                if let cityWeather {
                    HStack{
                        Image(systemName: "location.fill")
                            .foregroundStyle(.red)
                            .font(.title)
                        
                        VStack(alignment: .leading){
                            Text(cityWeather.cityName)
                                .font(.title)
                                .fontWeight(.black)
                            
                            Text(cityWeather.countryCode)
                                .font(.title3)
                                .foregroundStyle(.gray)
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 20){
                        rowItem(text: "Temperature", icon: "thermometer.transmission", value: String(cityWeather.temperature), color: .orange)
                        
                        rowItem(text: "Humidity", icon: "humidity.fill", value: String(cityWeather.humidity), color: .blue)
                        
                        rowItem(text: "Wind Speed", icon: "wind", value: String(cityWeather.windSpeed), color: .gray)
                        
                        rowItem(text: "Sunrise", icon: "sunrise.fill", value: String(cityWeather.sunrise), color: .yellow)
                        
                        rowItem(text: "Sunset", icon: "sunset.fill", value: String(cityWeather.sunset), color: .orange)
                    }
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(.white)
                    .shadow(color: .gray.opacity(0.4), radius: 4 )
                
            )
            .padding()
        }
    }
    
    private func rowItem(text: String, icon: String, value: String, color: Color) -> some View {
        HStack {
            Image(systemName: icon)
                .font(.title2)
                .foregroundStyle(color)
            
            VStack(alignment: .leading) {
                Text(text)
                    .font(.headline)
                    .foregroundStyle(.gray)
                
                Text(value)
                    .font(.title2)
                    .fontWeight(.bold)
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .padding(10)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.white)
                .shadow(radius: 2)
        )
        .padding(.horizontal)
    }
}

#Preview {
    ContentView(weatherData: weatherData)
}

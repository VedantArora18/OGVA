//
//  SettingsView.swift
//  Offline Games
//
//  Created by Vedant Arora on 18/02/24.
//

import SwiftUI

struct SettingsView: View {
    @State private var showingYourScore = false
    @State private var showingHelp = false
    @State private var showingAboutUs = false
    @State private var showingLoginScreen = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                Button(action: {
                    showingYourScore = true
                }) {
                    Text("Your Score")
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .foregroundColor(.black)
                }
                .sheet(isPresented: $showingYourScore) {
                    YourScoreView()
                }
                
                Button(action: {
                    showingHelp = true
                }) {
                    Text("Help")
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .foregroundColor(.black)
                }
                .sheet(isPresented: $showingHelp) {
                    HelpView()
                }
                
                Button(action: {
                    showingAboutUs = true
                }) {
                    Text("About Us")
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .foregroundColor(.black)
                }
                .sheet(isPresented: $showingAboutUs) {
                    AboutUsView()
                }
                
                VStack {
                    
                    Button("Logout") {
                        showingLoginScreen = true
                    }
                    .foregroundColor(.white)
                    .frame(width: 100, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding()
                    NavigationLink(destination: LoginView(), isActive: $showingLoginScreen) {
                        
                        EmptyView()
                    }
                    
                    
                    
                    Spacer()
                }
                .padding()
                .navigationBarTitle("Settings", displayMode: .inline)
                .font(.system(size: 20, weight: .bold, design: .rounded))
            }
        }
    }
    
    struct YourScoreView: View {
        var body: some View {
            Text("Your Score Page")
        }
    }
    
    struct HelpView: View {
        var body: some View {
            Text("Help Page")
        }
    }
    
    struct AboutUsView: View {
        var body: some View {
            Text("About Us Page")
        }
    }
    
    struct SettingsView_Previews: PreviewProvider {
        static var previews: some View {
            SettingsView()
        }
    }

    
}

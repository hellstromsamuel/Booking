//
//  UserProfileView.swift
//  Booking
//
//  Created by Samuel Hellstrøm on 13/05/2025.
//


import SwiftUI

struct UserProfileView: View {
    @ObservedObject var viewModel = UserProfileViewModel()

    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("User Info")) {
                    HStack {
                        Text("Name")
                        Spacer()
                        Text(viewModel.name)
                            .foregroundColor(.gray)
                    }

                    HStack {
                        Text("Email")
                        Spacer()
                        if let email = viewModel.email {
                            Text(email)
                                .foregroundColor(.gray)
                        }
                    }
                }

                Section(header: Text("Preferences")) {
                    Toggle("Enable Notifications", isOn: $viewModel.notificationsEnabled)
                    Toggle("Dark Mode", isOn: $viewModel.isDarkMode)

                }
            }
            .navigationTitle("Profile")
        }
        .onAppear {
            viewModel.loadProfileData()
        }
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}

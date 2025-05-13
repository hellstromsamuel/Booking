import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                if let user = viewModel.user {
                    List {
                        Section(header: Text("Stadiums")) {
                            ForEach(viewModel.stadiums, id: \.id) { stadium in
                                NavigationLink(destination: StadiumDetailsView(stadium: stadium)) {
                                    Text(stadium.name)
                                }
                            }
                        }
                        
                        
                        Section(header: Text("Other Information")) {
                            NavigationLink(destination: BookingsHistoryView()) {
                                Text("Bookings")
                            }
                        }
                    }
                    .navigationTitle("Hi, \(user.firstName)")
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button(action: {
                                // Add action here
                            }) {
                                Image(systemName: "person.circle")
                            }
                        }
                    }
                } else {
                    VStack {
                        Text("Loading user data...")
                        ProgressView()
                    }
                }
            }
            .onAppear {
                viewModel.loadUserData()
            }
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

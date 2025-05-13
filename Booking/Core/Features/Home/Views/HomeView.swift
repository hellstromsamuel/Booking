import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                if let user = viewModel.user {
                    List {
                        Section(header: Text("Stadiums")) {
                           ForEach(viewModel.stadiums, id: \.id) { stadium in
                               NavigationLink(value: stadium) {
                                   Text(stadium.name)
                               }
                           }
                       }
                    }
                    .navigationTitle("Hi, \(user.firstName)")
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
            .navigationDestination(for: Stadium.self) { stadium in
                    StadiumDetailsView(stadium: stadium)
                }
           
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

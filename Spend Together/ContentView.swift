
struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: MainView()) {
                    Text("Enter the app")
                        .fontWeight(.bold)
                        .padding()
                        .background(Color.white)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

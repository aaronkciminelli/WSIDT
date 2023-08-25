import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
                ZStack {
                    BackgroundView ()
                    VStack(spacing: 20) {
                        Spacer()
                        
                        NavigationLink(destination: FusionGeneratorView()) {
                            Text("Fusion Generator")
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        
                        NavigationLink(destination: GeneratorView()) {
                            Text("Generator")
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                }
            }
        }
    }

    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }


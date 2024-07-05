import SwiftUI

struct ContentView: View {
    @AppStorage("isShown") private var isShown = true
    @State private var pageNumber = 1
    
    var body: some View {
        ZStack {
            Color("MainColor").ignoresSafeArea()
            
            if isShown{
                
           
            } else {
                homepageView
            }
        }
        
    }
}

extension ContentView {
    var homepageView : some View{
        VStack(spacing:50){
            Image("InMind")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .cornerRadius(10)
            
            Text("Finally reached the end of Onboarding journey.If you did get all the points of my application, go on and enjoy it.If you have still doubts about the app's capabilities,get back to Onboarding journey!")
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(Color("MainColor"))
                .lineSpacing(4)
                .kerning(0.5)
                .multilineTextAlignment(.center)
            
            Button{
                withAnimation(.easeOut){
                    isShown = false
                    pageNumber = 1
                }
            } label: {
                Text("Back to Journey!")
            }
            .padding()
            .font(.headline)
            .foregroundStyle(Color("SecondaryColor"))
            .background(Color("MainColor"), in:RoundedRectangle(cornerRadius: 10))
            .shadow(color:Color("MainColor"), radius: 2)
        }
        .padding()
        .frame(width:UIScreen.main.bounds.size.width - 20, height:400)
        .background{
            RoundedRectangle(cornerRadius: 10)
                .fill(Color("SecondaryColor"))
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

import SwiftUI

struct ContentView: View {
    @AppStorage("isShown") private var isShown = true
    @State private var pageNumber = 1
    
    var body: some View {
        ZStack(alignment:.bottom) {
            Color("MainColor").ignoresSafeArea()
            
            if !isShown{
                switch pageNumber {
                case 1:
                    OnboardingView(pageNumber:$pageNumber,isShown: $isShown, message:"We use passwords on everyday on every corner of our lives.Not to forget passwords,some takes notes,some memorizes.In order to save you from this hard business, I offer you a remedy, InMind.")
                case 2:
                    OnboardingView(pageNumber:$pageNumber,isShown: $isShown, message:"You can store passwords of social media accounts, credit cards and so on.Then you can reach them whenever you need easily without memorizing.")
                case 3:
                    OnboardingView(pageNumber:$pageNumber,isShown: $isShown, message:"You can list all your passwords and find one that you search for with ease.You can hide your passwords or copy them directly into other applications")
                case 4:
                    OnboardingView(pageNumber:$pageNumber,isShown: $isShown, message:"Please feed us with feedbacks.Don't hide them from us.They are not supposed to be as secret as your passwords.")

                default:
                    Text("")
                }

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

struct OnboardingView:View {
    @Binding fileprivate var pageNumber:Int
    @Binding fileprivate var isShown:Bool
    fileprivate var message:String
    
    var body:some View {
        VStack(spacing:20) {
            Image("InMind")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .cornerRadius(10)
           
            Text(message)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(Color("MainColor"))
                .lineSpacing(4)
                .kerning(0.5)
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.8)
            Spacer()
            HStack(spacing:30){
                Group{
                    if pageNumber != 1 { Button("Back"){ pageNumber-=1 } }
                    if pageNumber != 4 {
                        Button("Next"){pageNumber+=1}
                    } else {
                        Button("Finish") { isShown = true }
                        
                    }
                    
                }
                .padding(.horizontal, 50)
                .padding(.vertical)
                .font(.headline)
                .foregroundStyle(Color("SecondaryColor"))
                .background(Color("MainColor"), in:RoundedRectangle(cornerRadius: 10))
                .shadow(color:Color("MainColor"), radius: 2)
            }
            
            Spacer()
            
            HStack {
                ForEach(1..<5){number in
                    Rectangle()
                        .fill(Color("MainColor"))
                        .frame(width: pageNumber==number ? 15 : 10, height:10)
                        .cornerRadius(5)
                        .opacity(pageNumber==number ? 1.0 : 0.3)
                }.animation(.easeOut, value: pageNumber)
            }
            
            
            
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

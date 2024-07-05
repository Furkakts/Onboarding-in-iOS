import SwiftUI

struct ContentView: View {
    @AppStorage("isShown") private var onBoardingIsShown = false
    @State private var pageNumberInOnboardingView = 1
    
    private let mockTitle:[String] = MockDataModel.mockTitleData
    private var titleForEachOnboardingPage:String {
        mockTitle[pageNumberInOnboardingView-1]
    }
    
    private let mockData:[String] = MockDataModel.mockTextData
    private var messageForEachOnboardingPage:String{
        mockData[pageNumberInOnboardingView-1]
    }
    var body: some View {
        ZStack(alignment:.bottom) {
            Color("MainColor").ignoresSafeArea()
            
            if !onBoardingIsShown{
                switch pageNumberInOnboardingView {  // Visit over pages of onboarding
                   case 1:
                    OnboardingView(pageNumber: $pageNumberInOnboardingView, isShown: $onBoardingIsShown,
                                   title: titleForEachOnboardingPage, message: messageForEachOnboardingPage, numberOfPages: mockData.count)
                   case 2:
                    OnboardingView(pageNumber: $pageNumberInOnboardingView, isShown: $onBoardingIsShown,
                                   title: titleForEachOnboardingPage, message: messageForEachOnboardingPage, numberOfPages: mockData.count)
                   case 3:
                    OnboardingView(pageNumber: $pageNumberInOnboardingView, isShown: $onBoardingIsShown,
                                   title: titleForEachOnboardingPage, message: messageForEachOnboardingPage, numberOfPages: mockData.count)
                   case 4:
                    OnboardingView(pageNumber: $pageNumberInOnboardingView, isShown: $onBoardingIsShown,
                                   title: titleForEachOnboardingPage, message: messageForEachOnboardingPage, numberOfPages: mockData.count)
                   default:
                      Text("Empty View")
                }
            } else {
                homepageView }
        }  // End ZStack
    }
}

struct OnboardingView:View {
    @Binding fileprivate var pageNumber:Int
    @Binding fileprivate var isShown:Bool
    fileprivate var title:String
    fileprivate var message:String
    fileprivate let numberOfPages:Int
    private let appName = "InMind"
    
    var body:some View {
        VStack(spacing:10) {
            Image(appName)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .cornerRadius(10)
            Text(appName)
                .font(.title2)
                .bold()
                .foregroundStyle(Color("MainColor"))
            Spacer()
            Text(title)
                .font(.title3)
                .bold()
                .foregroundStyle(Color("MainColor"))
            Spacer()
            Text(message)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(Color("MainColor"))
                .lineSpacing(3)
                .kerning(0.5)
                .multilineTextAlignment(.center)
            Spacer()
            HStack(spacing:30){
                Group{
                    if pageNumber != 1 {
                        Button("Back"){ withAnimation{pageNumber-=1}}
                    }
                    if pageNumber != 4 {
                        Button("Next"){ withAnimation{pageNumber+=1}}
                    } else {
                        Button("Finish") { isShown = true }
                    }
                }
                .padding(.horizontal, 50)
                .padding(.vertical, 10)
                .font(.headline)
                .foregroundStyle(Color("SecondaryColor"))
                .background(Color("MainColor"), in:RoundedRectangle(cornerRadius: 10))
                .shadow(color:Color("MainColor"), radius: 1)
            }
            Spacer()
            HStack {
                ForEach(1..<numberOfPages+1){number in
                    Rectangle()
                        .fill(Color("MainColor"))
                        .frame(width: pageNumber==number ? 15 : 10, height:10)
                        .cornerRadius(5)
                        .opacity(pageNumber==number ? 1.0 : 0.3)
                    }
            }
        }
        .padding()
        .frame(width:UIScreen.main.bounds.size.width - 20, height:500)
        .background{
            RoundedRectangle(cornerRadius: 15)
                .fill(Color("SecondaryColor"))
        }
        .shadow(color:Color("SecondaryColor"),radius: 3)
        .transition(.move(edge: .trailing))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension ContentView {
    var homepageView : some View{
        VStack(spacing:10){
            Image("InMind")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .cornerRadius(10)
            Text("InMind")
                .font(.title2)
                .bold()
                .foregroundStyle(Color("MainColor"))
            Spacer()
            Text("Finally reached the end of Onboarding journey.If you did get all the points of my application, go on and enjoy it.If you have still doubts about the app's capabilities,get back to Onboarding journey!")
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(Color("MainColor"))
                .lineSpacing(4)
                .kerning(0.5)
                .multilineTextAlignment(.center)
            Spacer()
            Button("Back to Journey"){
               withAnimation{
                   onBoardingIsShown = false
                   pageNumberInOnboardingView = 1
               }
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 12)
            .font(.headline)
            .foregroundStyle(Color("SecondaryColor"))
            .background(Color("MainColor"), in:RoundedRectangle(cornerRadius: 10))
        }
        .padding()
        .frame(width:UIScreen.main.bounds.size.width - 20, height:500)
        .background{
            RoundedRectangle(cornerRadius: 15)
                .fill(Color("SecondaryColor"))
        }
        .shadow(color:Color("SecondaryColor"),radius: 3)
    }
}

//
//  ExampleTabView.swift
//  SwiftArmyKnife
//
//  Created by Michael Borgmann on 05/06/2022.
//

import SwiftUI

struct SheetView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        Button("Press to dismiss") {
            dismiss()
        }
        .font(.title)
        .padding()
        .background(.black)
    }
}

struct TabViewDemoView: View {
    
    let component: ComponentModel
    @State private var showingSheet = false
    @State private var isCodeSheetShown = false
    @State private var isPaging = false
    @State private var indexDisplayMode = 0
    @State private var backgroundDisplayMode = 0
    @State private var isTextShown = true
    @State private var isImageShown = true
    @State private var numberOfPages = 3
    @State private var numberOfBadges = 10
    
    var source: String {
        
        if isPaging {
            return ExampleTabView.Sources.example2
        } else {
            return ExampleTabView.Sources.example1
        }
    }
    
    var body: some View {
        
        VStack {
            
            ScrollView {
                Stepper(value: $numberOfPages, in: 1...100) {
                    Text("Number of Pages: \(numberOfPages)")
                }.padding()
                
                Toggle(isOn: $isPaging) {
                    Text("View Style: Paging")
                }
                .padding()
                
                VStack(alignment: .leading, spacing: 6) {
                    Text("PageTabViewStyle.IndexDisplayMode").padding([.leading, .trailing])
                    Picker("PageTabViewStyle.IndexDisplayMode", selection: $indexDisplayMode) {
                        Text("always").tag(0)
                        Text("automatic").tag(1)
                        Text("never").tag(2)
                    }
                    .pickerStyle(.segmented)
                    .padding([.leading, .trailing])
                }.padding([.bottom])
                
                VStack(alignment: .leading, spacing: 6) {
                    Text("PageTabViewStyle.IndexDisplayMode").padding([.leading, .trailing])
                    Picker("PageTabViewStyle.IndexDisplayMode", selection: $backgroundDisplayMode) {
                        
                        Text("always").tag(0)
                        Text("automatic").tag(1)
                        Text("interactive").tag(2)
                        Text("never").tag(3)
                    }
                    .pickerStyle(.segmented)
                    .padding([.leading, .trailing])
                }
                
                Toggle(isOn: $isTextShown) {
                    Text("Tab Item: Show Text")
                }
                .padding()
                
                Toggle(isOn: $isImageShown) {
                    Text("Tab Item: Show Image")
                }
                .padding()
                
                Stepper(value: $numberOfBadges, in: 0...1000) {
                    Text("Number of Badges: \(numberOfBadges)")
                }.padding()
            }
            .background(Color.white
                .shadow(color: .black, radius: 2, x: 0, y:5).opacity(0.1)
            )
            //.background(Color.white.shadow(color: .pink, radius: 3, x: 0, y: 2)
            
            Spacer()
            
            ExampleTabView(isPaging: $isPaging, indexDisplayMode: $indexDisplayMode, backgroundDisplayMode: $backgroundDisplayMode, isTextShown: $isTextShown, isImageShown: $isImageShown, numberOfPages: $numberOfPages, numberOfBadges: $numberOfBadges)
                .frame(height: 150)
            
        }.toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {

                Button(action: { isCodeSheetShown.toggle() }) {
                    Image(systemName: "curlybraces")
                }.sheet(isPresented: $isCodeSheetShown) {
                    SourceCodeView(source: source)
                }
            }

            ToolbarItem(placement: .navigationBarTrailing) {

                Button(action: { showingSheet.toggle() }) {
                    Image(systemName: "gearshape")
                }.sheet(isPresented: $showingSheet) {
                    SheetView()
                }
            }
        }
    }
}

struct TabViewDemoView_Previews: PreviewProvider {
    static var previews: some View {
        let component = ComponentModel(name: "Tab Bar")
        TabViewDemoView(component: component)
    }
}

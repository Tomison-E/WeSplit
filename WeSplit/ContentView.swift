//
//  ContentView.swift
//  WeSplit
//
//  Created by Lanre ESAN on 19/03/2020.
//  Copyright © 2020 tomisinesan.com. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople=2
    @State private var tipPercentage = 2
    let tipPercentages = [10,15,20,25,0]
    var totalPayment: Double{
        let orderAmount = Double(checkAmount) ?? 0
        let tipSelection = Double(tipPercentages[tipPercentage])
        let tipValue = orderAmount/100 * tipSelection
        
        return orderAmount + tipValue
    }
    var totalPerPerson:Double {
        //calc
        let peopleCount = Double(numberOfPeople+2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount/100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
     
    }
    
    var body: some View {
        NavigationView{
        Form {
            Section {
                TextField("Amount", text: $checkAmount).keyboardType(.numberPad)
               /* Picker("Number of people", selection: $numberOfPeople){
                    ForEach (2 ..< 100){
                        Text("\($0) people")
                    }
                }*/
                TextField("Number of people", value: $numberOfPeople,formatter: NumberFormatter()).keyboardType(.numberPad)
            }
            
            Section(header:Text("How much percentage do you want?")){
                Picker("Tip Percentage",selection: $tipPercentage){
                    ForEach(0 ..< tipPercentages.count){
                        Text("\(self.tipPercentages[$0])%")
                    }
                }.pickerStyle(SegmentedPickerStyle())
                
            }
            Section(header:Text("Amount per person")){
                Text("\(totalPerPerson, specifier: "%.2f")")
            }
            
            Section{
                Text("The totel money to be paid is \(totalPayment,specifier: "%.2f")").foregroundColor(tipPercentage == 0 ? .blue : .red)
            }
        }
        .navigationBarTitle("WeSplit")
        }
}
}
    


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


/*
 struct ContentView: View {
     var body: some View {
         NavigationView{
         Form {
             Section{
                  Text("Hello, World!")
                  Text("Hello, World!")
                  Text("Hello, World!")
                  Text("Hello, World!")
                  Text("Hello, World!")
             }
             Section{
                 Text("Hello, World")
                 Text("Hello, World!")
                     .foregroundColor(Color.red)
                     .multilineTextAlignment(.trailing)
                     .padding(10.0)
                 Text("Hello, World!")
             }
            
         }.navigationBarTitle(Text("Swift UI"),displayMode: .inline)
     }
     }
 }
 */

/*
 struct ContentView: View {
     @State var tapCount:Int = 0
     var body: some View {
         NavigationView{
         Form {
             Section{
                 Text("Hello, World!")
             .foregroundColor(Color.red)
                     .multilineTextAlignment(.trailing)
                     .padding(10.0)
                 Button("Tap count \(tapCount)"){
                     self.tapCount+=1
                 }
                 
             }
            
         }.navigationBarTitle(Text("Swift UI"),displayMode: .inline)
     }
     }
 }
 */

/*
 struct ContentView: View {
 @State var tapCount:Int = 0
 @State private var name = ""
 var body: some View {
     NavigationView{
     Form {
         Section{
             Text("Hello, World!")
         .foregroundColor(Color.red)
                 .multilineTextAlignment(.trailing)
                 .padding(10.0)
            TextField("Enter Your name",text: $name)
             }
             
         }
        
     }.navigationBarTitle(Text("Swift UI"),displayMode: .inline)
 }
 }
 */
/*
 struct ContentView: View {
     let Students = ["Harry","Jenny","money"]
     @State private var selectedStudents = "Harry"
     
     var body: some View {
         Picker("Select your student", selection: $selectedStudents){
             ForEach(0 ..< Students.count){
                 number in
                 Text(self.Students[number])
             }
         }
            
     }
     
 }
 */

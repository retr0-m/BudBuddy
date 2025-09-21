//
//  ExtrasView.swift
//  BudBuddy
//
//  Created by Matteo Cola on 06.09.2025.
//

import SwiftUI


struct ExtrasView: View {

    @Binding var selectedTab: Int
    let tabCount: Int
    @ObservedObject var authVM: AuthViewModel  
    var body: some View {
        NavigationView(content: {
            ZStack{
                ReactiveBackgroundView(weedType: .hybrid, mood: nil)
                FloatingMoodBackground(weedType: .hybrid, mood: nil)
                ScrollView{
                    VStack{
                        
                        VStack(alignment: .center) {
                            Image(systemName: "frying.pan")
                                .font(.system(size: 100))
                                .frame(alignment: .center)
                                .padding()
                            Text("Cook-n-Bake")
                                .font(.title)
                            Text("Cannabis infused recipees")
                                .font(.subheadline)
                                .foregroundStyle(Color.secondary)
                            NavigationLink(destination: DiningView()) {
                                Text("See more...")
                                    .foregroundStyle(Color.white)
                                    .padding(.bottom, 10)
                            }
                            
                            
                        }
                        .frame(width: 350, height: 250, alignment: .center)
                        .padding()
                        .background(Color.red.opacity(0.75))
                        .cornerRadius(12)
                        
                        
                        
                        
                        Text("Learn")
                            .font(.title)
                        HStack{
                            NavigationLink(destination: LearnSpecificView(topic: "Learn about hash")) {
                                VStack(alignment: .center) {
                                    Image(systemName: "book.pages")
                                        .font(.largeTitle)
                                        .frame(alignment: .center)
                                    Text("Learn about hash")
                                        .font(.title3)
                                    Text("Learn how different types of hash are made")
                                        .font(.subheadline)
                                        .foregroundStyle(Color.secondary)
                                }
                                .frame(width: 160, height: 160, alignment: .center)
                                .padding()
                                .background(Color.orange.opacity(0.5))
                                .cornerRadius(12)
                            }
                            .buttonStyle(PlainButtonStyle())
                            
                            NavigationLink(destination: LearnSpecificView(topic: "Learn about weed")) {
                                VStack(alignment: .center) {
                                    Image(systemName: "magazine")
                                        .font(.largeTitle)
                                        .frame(alignment: .center)
                                    Text("Learn about weed")
                                        .font(.title3)
                                    Text("Learn how weed is planted and distributed")
                                        .font(.subheadline)
                                        .foregroundStyle(Color.secondary)
                                }
                                .frame(width: 160, height: 160, alignment: .center)
                                .padding()
                                .background(Color.yellow.opacity(0.5))
                                .cornerRadius(12)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                        HStack{
                            NavigationLink(destination: LearnSpecificView(topic: "What's THC?")) {
                                VStack(alignment: .center) {
                                    Image(systemName: "brain.head.profile")
                                        .font(.largeTitle)
                                        .frame(alignment: .center)
                                    Text("What's THC?")
                                        .font(.title3)
                                    Text("What actually happens when you consume THC?")
                                        .font(.subheadline)
                                        .foregroundStyle(Color.secondary)
                                }
                                .frame(width: 160, height: 160, alignment: .center)
                                .padding()
                                .background(Color.green.opacity(0.5))
                                .cornerRadius(12)
                            }
                            .buttonStyle(PlainButtonStyle())
                            
                            NavigationLink(destination: LearnSpecificView(topic: "Plant your own")) {
                                VStack(alignment: .center) {
                                    Image(systemName: "tree")
                                        .font(.largeTitle)
                                        .frame(alignment: .center)
                                    Text("Plant your own")
                                        .font(.title3)
                                    Text("Learn how to grow your own bud")
                                        .font(.subheadline)
                                        .foregroundStyle(Color.secondary)
                                }
                                .frame(width: 160, height: 160, alignment: .center)
                                .padding()
                                .background(Color.mint.opacity(0.5))
                                .cornerRadius(12)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                        HStack{
                            NavigationLink(destination: LearnSpecificView(topic: "Bad Trips")) {
                                VStack(alignment: .center) {
                                    Image(systemName: "exclamationmark.shield")
                                        .font(.largeTitle)
                                        .frame(alignment: .center)
                                    Text("Bad Trips")
                                        .font(.title3)
                                    Text("Learn about bad trips and how to avoid or win them.")
                                        .font(.subheadline)
                                        .foregroundStyle(Color.secondary)
                                }
                                .frame(width: 160, height: 160, alignment: .center)
                                .padding()
                                .background(Color.purple.opacity(0.5))
                                .cornerRadius(12)
                            }
                            .buttonStyle(PlainButtonStyle())
                            
                            NavigationLink(destination: LearnSpecificView(topic: "Weed vs Alcohol")) {
                                VStack(alignment: .center) {
                                    Image(systemName: "magazine")
                                        .font(.largeTitle)
                                        .frame(alignment: .center)
                                    Text("Weed vs Alchool")
                                        .font(.title3)
                                    Text("A guide to the differences between weed and alcohol.")
                                        .font(.subheadline)
                                        .foregroundStyle(Color.secondary)
                                }
                                .frame(width: 160, height: 160, alignment: .center)
                                .padding()
                                .background(Color.blue.opacity(0.5))
                                .cornerRadius(12)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                        
                        
                        
                        
                        Text("Other features")
                            .font(.title)
                        HStack{
                            NavigationLink(destination: WeedStrenghtCalculator()) {
                                
                                VStack(alignment: .center) {
                                    Image(systemName: "scalemass")
                                        .font(.largeTitle)
                                        .frame(alignment: .center)
                                        .foregroundColor(.primary)
                                    Text("Dosage calculator")
                                        .foregroundColor(.primary)
                                        .font(.title3)
                                    Text("Calculate the best dosage to assume for your needs.")
                                        
                                        .font(.subheadline)
                                        .foregroundStyle(Color.secondary)
                                }
                                .frame(width: 160, height: 160, alignment: .center)
                                .padding()
                                .background(Color.red.opacity(0.5))
                                .cornerRadius(12)
                            }
                            
                            VStack(alignment: .center) {
                                Image(systemName: "pencil.and.list.clipboard")
                                    .font(.largeTitle)
                                    .frame(alignment: .center)
                                Text("Suggest features")
                                    .font(.title3)
                                Text("Let us know what we should add to this app to make it even better!")
                                    .font(.subheadline)
                                    .foregroundStyle(Color.secondary)
                            }
                            .frame(width: 160, height: 160, alignment: .center)
                            .padding()
                            .background(Color.brown.opacity(0.5))
                            .cornerRadius(12)
                            
                        }
                    }
                }
                
                
               
            }
            
        })
    }
}

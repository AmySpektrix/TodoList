//
//  ToDoView.swift
//  TodoList
//
//  Created by Amy Brown on 10/04/2024.
//

import Foundation
import SwiftUI

struct ToDoView: View {
    @Binding var todo: ContentView.ToDo

    var body: some View {
        List {
            HStack{
            Text("Task:")
            TextField("Task", text: $todo.todo,  axis: .vertical)
                }
            HStack{
            Text("Description:")
            TextField("Description", text: $todo.moreInfo,  axis: .vertical)
            }
            HStack{
            DatePicker("Select Due Date:", selection: Binding<Date>(
                get: { self.todo.dueBy ?? Date() },
                set: { self.todo.dueBy = $0 }), displayedComponents: [.date])
                if todo.dueBy == nil {
                    Text("No date selected")
                        .padding()
                }
            }
            HStack{
            Text("Mark as Done:")
            Toggle("", isOn: $todo.doneToggle)
            }
        }
        .navigationTitle("\(todo.todo)")
        .padding(.all, 20.0)
        .background(Color.clear)
        .padding(/*@START_MENU_TOKEN@*/.top, 50.0/*@END_MENU_TOKEN@*/)
        .scrollContentBackground(.hidden)
        .foregroundColor(/*@START_MENU_TOKEN@*/Color(hue: 0.466, saturation: 0.294, brightness: 0.595)/*@END_MENU_TOKEN@*/)
        .navigationBarTitleDisplayMode(/*@START_MENU_TOKEN@*/.large/*@END_MENU_TOKEN@*/)
        .background(
            ZStack {
                VStack{
                    Spacer(minLength: 5)
                    Image("logo")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .padding(.top, 10.0)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .edgesIgnoringSafeArea(.top)}
            }
                )
    }
}


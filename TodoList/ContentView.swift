//
//  ContentView.swift
//  TodoList
//  This is the visible page we are displaying (the only page when initialised)
//  Created by Amy Brown on 09/04/2024.
//

import SwiftUI

struct ContentView: View {
    struct ToDo: Identifiable{
        let id = UUID()
        var todo: String
        var doneToggle: Bool
        var moreInfo: String
        var dueBy: Date?
    }
    @State private var newTodo = ""
    @State private var toDoList : [ToDo] = [ToDo(todo: "Todo 1", doneToggle: false, moreInfo: "more info"), ToDo(todo: "Todo 2", doneToggle: true, moreInfo: "moreinfo", dueBy: nil) ]
    
    private func sortTodosByDone() {
        toDoList.sort { $0.doneToggle && !$1.doneToggle}
    }
    
    private func sortTodosByDate() {
        toDoList.sort { todo1, todo2 in
            if let dueBy1 = todo1.dueBy, let dueBy2 = todo2.dueBy {
                return dueBy1 < dueBy2
            } else if todo1.dueBy != nil {
                return true
            } else {
                return false
            }
        }
    }
    var body: some View {
        let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            return formatter
        }()
        NavigationView {
            List{
                Text("The list of fun things - Toggle them on and off")
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                Section{
                    HStack{
                        TextField("Add your new task here", text: $newTodo,  axis: .vertical)
                        Button("Add to List") {
                            guard !newTodo.isEmpty else {return}
                            toDoList.append(ToDo(todo: newTodo, doneToggle:false, moreInfo: ""))
                            newTodo = ""
                        }
                    }
                }
                Section {
                    HStack{
                    Button(action: {
                        sortTodosByDate()
                    }) {
                        Text("Sort By Date")}
                        Spacer()
                    Button(action: {
                        sortTodosByDone()
                    }) {
                        Text("Sort By Done")}
                    }
                    ForEach(toDoList.indices, id:\.self) {index in
                        let toDoInstance = $toDoList[index]
                        NavigationLink(destination: ToDoView(todo: toDoInstance)){
                            HStack {
                                TextField("1", text: toDoInstance.todo,  axis: .vertical)
                                    .strikethrough(toDoList[index].doneToggle ? true : false)
                                if let dueBy = toDoList[index].dueBy {
                                    Text(dateFormatter.string(from: dueBy))}
                                Toggle("", isOn: toDoInstance.doneToggle)
                            }
                        }
                    }
                }}
                .padding(.all, 20.0)
                .background(Color.clear)
                .padding(/*@START_MENU_TOKEN@*/.top, 50.0/*@END_MENU_TOKEN@*/)
                .scrollContentBackground(.hidden)
                .foregroundColor(/*@START_MENU_TOKEN@*/Color(hue: 0.466, saturation: 0.294, brightness: 0.595)/*@END_MENU_TOKEN@*/)
                .navigationBarTitle("Task List")
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
                    })
            }
        }
    }
    
    #Preview {
        ContentView()
    }
    


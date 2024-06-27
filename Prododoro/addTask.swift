//
//  addTask.swift
//  Prododoro
//
//  Created by Scholar on 6/27/24.
//
import SwiftUI
import SwiftData

struct addTask: View {
    @Bindable var toDoItem : ToDoItem
    @Environment(\.modelContext) var modelContext
   // @State private var todoDueDate: Date = Date()
   // @State private var todoDateString: String = ""
    @Binding var showNewTask: Bool
    var body: some View {
        VStack(alignment: .center, spacing: 10.0) {
            Text("New Task")
            TextField("Type your new task here 😊", text: $toDoItem.title, axis: .vertical)
           
            
        
               
                
                
            //making task top priority
            Toggle(isOn: $toDoItem.isImportant) {
                Text("Top Priority")
                    .font(.body)
                    .fontWeight(.regular)
                    .multilineTextAlignment(.center)
                    
                    
                    
            }
            
            //enter task button
            Button("Enter") {
                addToDo()
                self.showNewTask = false
            }
                
        }
        .padding(.horizontal, 85.0)
        
    }
    func addToDo() {
        let toDo = ToDoItem(title: toDoItem.title, isImportant: toDoItem.isImportant)
        modelContext.insert(toDo)
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: ToDoItem.self, configurations: config)

    let toDo = ToDoItem(title: "", isImportant: false)
    return addTask(toDoItem: toDo, showNewTask: .constant(true))
        .modelContainer(container)
}

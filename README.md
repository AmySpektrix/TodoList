This is swift Todo list. There are two views:

On the main page:
- You can add a todo
- A it displays a list of the todos
- You can use the toggle to mark as complete
- It will display a due date if added
- You can sort by the duedate if dates added
- You can sort by it being done
- You can click through onto the individual task.

  On the task page:
  - You can see and edit all the task details. eg. task/description/due date/doneness
  - This will pass back to the main app when navigated off.
 
  I struggled a bit with holding the todos in a Array of Dictionaries so I moved to creating a struct
  as it meant each of the variables could have their own type and it felt like a neater data structure. It also meant you could pass the whole object through binding to the child view.

  

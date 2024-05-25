// Create an interface, enum, and generic typing to improve this file.

interface Todo {
    id: number,
    title: string,
    completedOn?: Date
    status: TodoStatus
}

enum TodoStatus {
    TODO = "todo",
    IN_PROGRESS = "in-progress",
    DONE = "done"
}

const todoItems: Todo[] = [
    { id: 1, title: "Learn HTML", status: TodoStatus.DONE, completedOn: new Date("2021-09-11") },
    { id: 2, title: "Learn TypeScript", status: TodoStatus.IN_PROGRESS },
    { id: 3, title: "Write the best app in the world", status: TodoStatus.TODO },
]

function addTodoItem(todo: string): Todo {
    const id = getNextId(todoItems)

    const newTodo: Todo = {
        id,
        title: todo,
        status: TodoStatus.TODO,
    }

    todoItems.push(newTodo)

    return newTodo
}

function getNextId<T extends { id: number }>(items: T[]): number {
    return items.reduce((max, x) => x.id > max ? x.id : max, 0) + 1
}

const newTodo = addTodoItem("Buy lots of stuff with all the money we make from the app")

console.log(JSON.stringify(newTodo))

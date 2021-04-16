const createNote = (title, action, columnName) => { 
    return {
        title, 
        action,
        columnName,
        createDateTime: new Date()
    }
 }

export { createNote }
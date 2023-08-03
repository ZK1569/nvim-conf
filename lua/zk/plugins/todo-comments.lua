local setup, todo = pcall(require, "todo-comments")
if not setup then
    print("ERROR todo-comments")
    return
end

todo.setup()


-- TODO: what to do 
-- PERF: Its perfect
-- HACK: This looks funky
-- NOTE: What else
-- FIX: Its in danger 
-- WARNING: ????

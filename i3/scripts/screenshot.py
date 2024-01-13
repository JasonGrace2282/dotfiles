import customtkinter as ctk
import os
r = ctk.CTk()
l = ctk.CTkEntry(r, placeholder_text="filename without .png")
l.focus()
l.pack()
def quit(*_):
    global l
    tmp = l.get()
    r.destroy()
    if tmp:
        os.system(f"maim -s ~/Pictures/Screenshots/{tmp}.png")
        print(f"Ran: maim -s ~/Pictures/Screenshots/{tmp}.png")
ctk.CTkButton(r, command=quit, text="Enter").pack()
r.bind("<Return>", quit)
r.title("Screenshot to File")
r.mainloop()


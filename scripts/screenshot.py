import customtkinter as ctk
import os, sys

ctk.set_appearance_mode("dark")
r = ctk.CTk()
r.attributes('-type', 'dialog')
l = ctk.CTkEntry(r, placeholder_text="filename without .png")
l.focus()
l.pack()
def quit(*_):
    global l
    tmp = l.get()
    r.destroy()
    if tmp:
        os.system(f"maim -s ~/Pictures/Screenshots/{tmp}.png")
        os.system(f"dunstify \"Took Screenshot\" \"Located at ~/Pictures/Screenshots/{tmp}.png\"")
ctk.CTkButton(r, command=quit, text="Enter").pack(pady=5)
r.bind("<Return>", quit)
r.title("Screenshot to File")
r.mainloop()


#!/bin/env python

import customtkinter as ctk
import os

ctk.set_appearance_mode("dark")

class ScreenshotPopup(ctk.CTk):
    def __init__(self):
        super().__init__()
        # make popup (floating) window
        self.attributes("-type", "dialog")
        self.bind("<Return>", self.quit)
        self.title("Screenshot to File")
        self.geometry("200x100")

        self.entry = ctk.CTkEntry(self, placeholder_text="filename without .png")
        self.entry.focus() # move cursor inside entry
        self.entry.pack()
 
        self.button = ctk.CTkButton(self, command=self.quit, text="Enter")
        self.button.pack(pady=10)

    def quit(self, *args) -> None:
        fpath = self.entry.get()
        self.destroy()
        if fpath:
            os.system(f"maim -s ~/Pictures/Screenshots/{fpath}.png")
            os.system(f"dunstify \"Took Screenshot\" \"Located at ~/Pictures/Screenshots/{fpath}.png\"")

if __name__ == "__main__":
    ScreenshotPopup().mainloop()


from tkinter import *
from tkinter.ttk import *

from time import strftime

main = Tk()

main.title('Reloj')


def reloj():
    tick = strftime('%H:%M:%S %p')

    etiqueta .config(text=tick)
    etiqueta .after(1000, reloj)


etiqueta = Label(main, font=('Dank Mono', 80),
                 background='white', foreground='black')

etiqueta.pack(anchor='center')

reloj()
mainloop()

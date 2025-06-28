import tkinter as tk
from tkinter import ttk, messagebox

from .logic import brutto_to_netto, netto_to_brutto, VAT_RATES

def calculate():
    try:
        price_text = entry_price.get().replace(',', '.')
        price = float(price_text)
    except ValueError:
        messagebox.showerror("B\u0142\u0105d", "Niepoprawna kwota")
        return

    rate = float(rate_var.get())

    if calc_type.get() == 'netto':
        gross, vat_amount = netto_to_brutto(price, rate)
        result_var.set(
            f"Kwota VAT: {vat_amount:.2f} z\u0142\nCena brutto: {gross:.2f} z\u0142"
        )
    else:
        net, vat_amount = brutto_to_netto(price, rate)
        result_var.set(
            f"Kwota VAT: {vat_amount:.2f} z\u0142\nCena netto: {net:.2f} z\u0142"
        )


def main():
    global root, entry_price, rate_var, calc_type, result_var

    root = tk.Tk()
    root.title("Kalkulator VAT")

    mainframe = ttk.Frame(root, padding="10")
    mainframe.grid(row=0, column=0, sticky=(tk.W, tk.E, tk.N, tk.S))

    # Price entry
    entry_price = ttk.Entry(mainframe, width=15)
    entry_price.grid(row=0, column=1, padx=5, pady=5)
    ttk.Label(mainframe, text="Kwota").grid(row=0, column=0, sticky=tk.W)

    # VAT rate dropdown
    rate_var = tk.StringVar(value=str(VAT_RATES[0]))
    rate_menu = ttk.OptionMenu(
        mainframe, rate_var, str(VAT_RATES[0]), *map(str, VAT_RATES)
    )
    rate_menu.grid(row=1, column=1, padx=5, pady=5)
    ttk.Label(mainframe, text="Stawka VAT (%)").grid(row=1, column=0, sticky=tk.W)

    # Calculation type radio buttons
    calc_type = tk.StringVar(value='netto')
    radio_netto = ttk.Radiobutton(
        mainframe, text='Netto \u2192 Brutto', variable=calc_type, value='netto'
    )
    radio_brutto = ttk.Radiobutton(
        mainframe, text='Brutto \u2192 Netto', variable=calc_type, value='brutto'
    )
    radio_netto.grid(row=2, column=0, sticky=tk.W)
    radio_brutto.grid(row=2, column=1, sticky=tk.W)

    # Calculate button
    calculate_btn = ttk.Button(mainframe, text="Oblicz", command=calculate)
    calculate_btn.grid(row=3, column=0, columnspan=2, pady=10)

    result_var = tk.StringVar()
    result_label = ttk.Label(mainframe, textvariable=result_var, justify='left')
    result_label.grid(row=4, column=0, columnspan=2)

    root.mainloop()


if __name__ == "__main__":
    main()

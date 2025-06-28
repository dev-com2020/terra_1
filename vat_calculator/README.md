# Kalkulator VAT dla macOS

Ten prosty kalkulator VAT został napisany w Pythonie przy użyciu biblioteki `tkinter`. 

## Uruchomienie
1. Upewnij się, że masz zainstalowanego Pythona 3 oraz tkinter (standardowo jest dostępny w instalacji systemowej Pythona na macOS).
2. W katalogu `vat_calculator` uruchom skrypt:
   ```bash
   python3 vat_calculator.py
   ```

## Funkcje
- Obsługa polskich stawek VAT: 23%, 8% i 5%.
- Możliwość przeliczania kwoty netto na brutto oraz brutto na netto.

Po uruchomieniu aplikacji wprowadź kwotę, wybierz stawkę VAT oraz tryb obliczeń, a następnie kliknij "Oblicz".

Możesz zbudować aplikację w formie pliku wykonywalnego na macOS za pomocą narzędzia `pyinstaller`:

```bash
pip install pyinstaller
pyinstaller --onefile vat_calculator.py
```

W katalogu `dist` pojawi się program, który można uruchomić jak typową aplikację w terminalu.

## Testy

Aby uruchomić testy jednostkowe napisane w `pytest`, wykonaj polecenie:

```bash
python3 -m pytest
```

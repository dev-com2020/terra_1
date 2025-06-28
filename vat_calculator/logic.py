VAT_RATES = [23, 8, 5]


def netto_to_brutto(netto: float, rate: float) -> tuple[float, float]:
    """Return (gross, vat_amount) for given netto and VAT rate."""
    vat_amount = netto * rate / 100
    return netto + vat_amount, vat_amount


def brutto_to_netto(gross: float, rate: float) -> tuple[float, float]:
    """Return (netto, vat_amount) for given gross and VAT rate."""
    netto = gross / (1 + rate / 100)
    vat_amount = gross - netto
    return netto, vat_amount

import pytest

from vat_calculator.logic import netto_to_brutto, brutto_to_netto


def test_netto_to_brutto():
    gross, vat = netto_to_brutto(100, 23)
    assert gross == pytest.approx(123)
    assert vat == pytest.approx(23)


def test_brutto_to_netto():
    net, vat = brutto_to_netto(123, 23)
    assert net == pytest.approx(100)
    assert vat == pytest.approx(23)


def test_round_trip():
    for rate in [23, 8, 5]:
        gross, vat1 = netto_to_brutto(200, rate)
        net, vat2 = brutto_to_netto(gross, rate)
        assert net == pytest.approx(200)
        assert vat1 == pytest.approx(vat2)

-- Dane testowe dla systemu zgłoszeń

-- Przykładowe zgłoszenia
INSERT INTO zgloszenia (numer_zgloszenia, nazwa_firmy, osoba_kontaktowa, telefon, email, opis_problemu, priorytet, status, data_zgloszenia) 
VALUES ('ZGL-2025-001', 'Pizzeria Bella Italia', 'Jan Kowalski', '123-456-789', 'jan@bellaitalia.pl', 'Nie działa system kasowy - nie przechodzą płatności kartą', 'Wysoki', 'W realizacji', '2025-11-01 10:30:00');

INSERT INTO zgloszenia (numer_zgloszenia, nazwa_firmy, osoba_kontaktowa, telefon, email, opis_problemu, priorytet, status, data_zgloszenia) 
VALUES ('ZGL-2025-002', 'Sklep Spożywczy ABC', 'Anna Nowak', '987-654-321', 'anna@sklepabc.pl', 'Drukarka paragonów drukuje blade wydruki', 'Średni', 'Nowe', '2025-11-02 14:15:00');

INSERT INTO zgloszenia (numer_zgloszenia, nazwa_firmy, osoba_kontaktowa, telefon, email, opis_problemu, priorytet, status, data_zgloszenia) 
VALUES ('ZGL-2025-003', 'Fryzjer Studio Piękna', 'Maria Wiśniewska', '555-123-456', 'maria@studiopiękna.pl', 'Nie uruchamia się program do zarządzania wizytami', 'Krytyczny', 'Nowe', '2025-11-03 09:00:00');

INSERT INTO zgloszenia (numer_zgloszenia, nazwa_firmy, osoba_kontaktowa, telefon, email, opis_problemu, priorytet, status, data_zgloszenia, uwagi) 
VALUES ('ZGL-2025-004', 'Warsztat Samochodowy AutoFix', 'Piotr Kowalczyk', '666-777-888', 'biuro@autofix.pl', 'Wolno działa program do wycen napraw', 'Niski', 'Oczekuje', '2025-10-28 16:45:00', 'Klient czeka na aktualizację systemu Windows');

INSERT INTO zgloszenia (numer_zgloszenia, nazwa_firmy, osoba_kontaktowa, telefon, email, opis_problemu, priorytet, status, data_zgloszenia) 
VALUES ('ZGL-2025-005', 'Apteka Zdrowie', 'Katarzyna Lewandowska', '111-222-333', 'k.lewandowska@apteka-zdrowie.pl', 'Problem z bazą danych - nie zapisują się recepty', 'Krytyczny', 'W realizacji', '2025-11-03 11:20:00');

-- Historia zmian
INSERT INTO historia (zgloszenie_id, data_zmiany, opis_zmiany, uzytkownik)
VALUES (1, '2025-11-01 10:30:00', 'Zgłoszenie utworzone', 'System');

INSERT INTO historia (zgloszenie_id, data_zmiany, opis_zmiany, uzytkownik)
VALUES (1, '2025-11-01 11:15:00', 'Status zmieniony: Nowe -> W realizacji', 'Admin');

INSERT INTO historia (zgloszenie_id, data_zmiany, opis_zmiany, uzytkownik)
VALUES (1, '2025-11-01 13:45:00', 'Technik Marek pojechał na miejsce', 'Admin');

INSERT INTO historia (zgloszenie_id, data_zmiany, opis_zmiany, uzytkownik)
VALUES (4, '2025-10-28 16:45:00', 'Zgłoszenie utworzone', 'System');

INSERT INTO historia (zgloszenie_id, data_zmiany, opis_zmiany, uzytkownik)
VALUES (4, '2025-10-29 10:00:00', 'Status zmieniony: Nowe -> Oczekuje. Powód: czekamy na aktualizację Windows u klienta', 'Admin');

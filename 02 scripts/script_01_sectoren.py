# sectorafbakeningen


bouw = 'F'
IT = 'K'
energie = 'D'
voeding   = list(map(str, (10,11,12)))
industrie = list(map(str, (24,25,28,29,30,31,32,33, 34)))
electrotechniek = ["26","27"] # en 4321 elektrische installatie (niet meenemen)
procestechniek_2 = list(map(str, range(13,23))) # en 71120 (act. van ingenieurs etc.) (niet meenemen)
procestechniek_1 = ["B", "E"]    # E is waterwinning en B defstoffen
medtech = '266'
vervoer = list(map(str, (49, 50, 51, 53)))
opslag  = "52"

# 10 - Vervaardiging van voedingsmiddelen
# 11 - Vervaardiging van dranken
# 12 - Vervaardiging van tabaksproducten
# 13 - Vervaardiging van textiel
# 14 - Vervaardiging van kleding
# 15 - Vervaardiging van leer, lederwaren en soortgelijke producten van andere materialen
# 16 - Houtindustrie en vervaardiging van artikelen van hout en kurk, met uitzondering van meubelen; vervaardiging van artikelen van riet en van vlechtwerk
# 17 - Vervaardiging van papier en papierwaren
# 18 - Activiteiten op het gebied van drukwerk en reproductie van opgenomen media
# 19 - Vervaardiging van cokes en van geraffineerde aardolieproducten
# 20 - Vervaardiging van chemicaliën en chemische producten
# 21 - Vervaardiging van farmaceutische grondstoffen en producten
# 22 - Vervaardiging van producten van rubber of kunststof
# 23 - Vervaardiging van overige niet-metaalhoudende minerale producten
# 24 - Vervaardiging van basismetalen
# 25 - Vervaardiging van producten van metaal, met uitzondering van machines en apparatuur
# 26 - Vervaardiging van computers en van elektronische en optische apparatuur
# 27 - Vervaardiging van elektrische apparatuur
# 28 - Vervaardiging van machines en apparaten, n.e.g.
# 29 - Vervaardiging van motorvoertuigen, aanhangwagens en opleggers
# 30 - Vervaardiging van overige vervoermiddelen
# 31 - Vervaardiging van meubelen
# 32 - Vervaardiging van overige goederen
# 33 - Reparatie, onderhoud en installatie van machines en apparaten

### maritiem:
# 301: Scheepsbouw
# 33150: Reparatie en onderhoud van schepen en drijvend materieel
# 71120: Activiteiten van ingenieurs en overig technisch ontwerp en advies
# 4291: Natte waterbouw (infrastructuur op en rond het water)
# 5222: Dienstverlening voor de vaart (zoals loodsen, slepen, bergen en havenactiviteiten)

### off-shore:
# 06 Winning van aardolie en aardgas
# 35112 Productie van elektriciteit door windenergie
# 42910 Natte waterbouw
# 50201 Zee- en kustvaart (vracht- en tankvaart)
# 50202 Zee- en kustsleepvaart
# 42220 Bouw van netwerken voor elektriciteit en telecommunicatie?
# 09100 Dienstverlening voor de winning van aardolie en aardgas


# H - VERVOER EN OPSLAG
# 49 - Vervoer over land en via pijpleidingen
# 491 - Personenvervoer per spoor
# 492 - Goederenvervoer per spoor
# 493 - Overig personenvervoer over land
# 494 - Goederenvervoer over de weg en verhuisbedrijven
# 495 - Transport via pijpleidingen

# 50 - Vervoer over water
# 501 - Personenvervoer over zee- en kustwateren
# 502 - Goederenvervoer over zee- en kustwateren
# 503 - Personenvervoer over binnenwateren
# 504 - Goederenvervoer over binnenwateren

# 51 - Luchtvaart
# 511 - Personenvervoer door de lucht
# 512 - Goederenvervoer door de lucht en ruimtevaart

# 52 - Opslag en dienstverlening voor vervoer
# 521 - Opslag
# 522 - Dienstverlening voor vervoer
# 523 - Bemiddelingsactiviteiten in verband met vervoer

# 53 - Post- en koeriersdiensten
# 531 - Postdiensten met universele dienstverplichting
# 532 - Overige postdiensten en koeriersdiensten
# 533 - Bemiddelingsactiviteiten in verband met post- en koeriersdiensten
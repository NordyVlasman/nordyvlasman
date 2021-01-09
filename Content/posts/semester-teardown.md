---
date: 2020-09-22 12:30
description: Wow, dat was best raar..

tags: Semester, Swift, AR
author: Nordy Vlasman
title: Semester Teardown
---
Van het thuiswerken tot het maken van een AR app. Het was een uitdagend semester. In deze post ga ik het hebben over de dingen die ik heb gedaan, geleerd en wat ik mee ga nemen naar de toekomst. Dat zijn nogal wat dingen, dus laat ik snel beginnen.

## Een blog maken
Misschien wel een van de eerste dingen die ik niet verwacht had ooit te doen. Het maken van een blog. Want waar moet ik het over hebben, waarom zou ik dit doen? En dan ook nog publiek maken, dat was toch wel eng voor mij. Maar hier sta ik, mn 6e post waarin ik een samenvatting maak over het afgelopen halve jaar. Het ontwikkelen van de blog was punt 1, ik ben nogal een freak als het gaat om frameworks. Dus ik kon maar lastig een keuze maken wat ik zou gebruiken voor mijn blog. Na eerst een snelle versie te maken in <a href="">NextJS</a>, heb ik in een later stadium mijn blog overgeschreven naar <a href="">Publish</a>. Het was een enorm leuke ervaring om hier mee bezig te zijn, een website maken in mijn favoriete programmeertaal Swift. Dat was toch wel een fijne bezigheid.

Toen mijn blog eenmaal stond, begon ik met het schrijven van posts. De eerste ging over het maken van mijn blog in NextJS. Daarin gaf ik mijn bevindingen en mijn mening over hoe het is om NextJS te gebruiken. Tijdens het schrijven van deze post kwam ik erachter dat je naar een heleboel interessante dingen gaat kijken. Naast de manier van schrijven, valt het ook op dat je toch dieper de techniek ingaat om je uitleg een beetje te kunnen onderbouwen. Dat was best wel een leuke openbaring waar ik veel van geleerd heb. En ik heb ook het gevoel dat ik bij het schrijven van elke nieuwe post weer wat betere kwaliteit leverde. Mijn grootste trots is mijn posts over het maken van een blog in publish. Hier kwam mijn passie van Swift in combinatie met het maken van een site bijeen. Wat resulteerde in een best leuke post.

## Een podcast opnemen
Ook nog zoiets wat ik echt nooit had gedaan zonder deze minor. Het opnemen van een podcast was echt iets buiten mijn comfortzone. Ik ben iemand die graag praat, maar om dat op te nemen... Nee dat is niet iets voor mij. Dacht ik in ieder geval, want toen Bram met het idee kwam om mee te doen hieraan werd ik wel een beetje enthousiast. En wat een goede keuze is dit geweest. Naast dat het erg leuk was om te praten over technologie, was het ook nog leerzaam. Ik ben erachter gekomen hoeveel werk het is om een podcast uit te brengen. En wat voor tijd het kost om van het voorbereiden tot het bewerken te komen. Het verbaasd mij dat het zoveel moeite kost om een nette podcast te maken die ook nog lekker doorluisterd.

Door de periode heen hebben we een aantal podcasts opgenomen en het begint steeds beter te klinken. Ik heb verschillende programma's gebruikt voor het bewerken van een podcast waardoor ik ondertussen de juiste flow heb gevonden. Zodra je in deze flow komt, kost alles natuurlijk minder tijd en moeite. Maar om zo ver te komen, moet je gemotiveerd zijn en het leuk vinden (Vind ik in ieder geval). Naast het bewerken had ik ook nog het publiceren. Waar we begonnen bij soundcloud. Is onze podcast ondertussen te vinden op Spotify, Apple Podcast en TuneIn. De 3 grootste partijen voor het uitbrengen van een podcast. En daar ben ik zelf best wel trots op ☺️.

> Voor het volgend semester willen Bram en ik verder gaan met het opnemen van de podcast. Dan wil ik mij ook verdiepen in het naar buiten brengen van een podcast. En natuurlijk een beter structuur in wanneer we iets opnemen is ook niet verkeerd.

## Een AR App maken.
Wow, dit was ook nog zo'n ding wat best wel uitdagend was. Het maken van een AR app is niet iets wat je binnen 2 weken op de juiste manier gedaan krijgt. Het kost veel tijd en moeite om de technologie te begrijpen. Voornamelijk omdat je in 3D werkt en daarin ook nog interacties moet toevoegen. Naast AR hadden we ook de uitdaging van Data opslag (met behulp van Core Data) en het maken van een fijne overzichtelijke interface. Dit alles bij elkaar heeft ervoor gezorgd dat ik flink wat programmeer uurtjes heb moeten maken, misschien wel meer dan ik had verwacht en ergens had gehoopt.

De grootste uitdaging binnen het maken van een AR app in SwiftUI was de communicatie tussen deze 2 technieken. SwiftUI heeft niet een native ARKit (Met SceneKit) ondersteuning. Hierdoor moest ik zelf een tussenlaag schrijven waarin SwiftUI een ViewController kon gebruiken. Maar daarmee heb ik niet de communicatie opgelost. Hiervoor moest ik een manager schrijven die met behulp van een protocol functies vanuit SwiftUI in AR kon uitvoeren.

> Als ik terugkijk naar deze oplossing had ik het anders gedaan. Ik zou gebruik maken van UIKit omdat de memory management hierin een stuk beter geregeld is. Daarnaast zou ik ook mijn basis beter hebben ingericht als ik wist hoeveel werk het uiteindelijk kostte om dit allemaal te refactoren. Raymond noemde dit Technical Depth, en als ik erzo naar kijk ben ik het met 'm eens.

Het maken van een AR app was erg leuk, vooral tijdens het ontwikkelen van de kleine interactie prototypes. Op dat moment had ik het gevoel dat ik toch wel iets kon maken. Dat maakte mij trots en gaf mij motivatie.

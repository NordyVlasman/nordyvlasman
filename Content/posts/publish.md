---
date: 2020-09-22 12:30
description: Ik ben toch maar voor publish gegaan, was wat leuker :)

tags: Publish, Swift, Development, TailwindCSS
author: Nordy Vlasman
title: Een blog maken in Publish en TailwindCSS
---
Jawel, ik kon het niet laten. Mijn vorige blog/ site (geschreven in NextJS) was er net 2 weken en ik wilde al iets nieuws. Daar ging ik weer, ik opende mn terminal en ik starte een nieuw project.
```shell
$ Publish new nordyvlasman
```
Huh maar dat is helemaal niet een bekend frontend framework, wat doe ik nou?!? Jawel, ik ging een poging wagen met <a href="https://github.com/johnsundell/publish" target="_blank">Publish</a>.

## Wat is Publish dan?
Leuk dat je dat vraagt! Publish is een statische website generator (Praise letterlijke vertaling.. Sorry 🤦‍♂️) gemaakt door John Sundell. De github pagina van Publish zegt het volgende erover.

> Welcome to Publish, a static site generator built specifically for Swift developers. It enables entire websites to be built using Swift, and supports themes, plugins and tons of other powerful customization options.

Klinkt heel fancy, en ja, dat is het ook. Het genot van werken met Swift in combinatie met TailwindCSS is niet te beschrijven. Je kan zeggen dat het overbodig veel werk is om een simpele site te maken. Maar, naast dat het technisch erg leuk is. Zit het ook nog eens heel goed in elkaar. Waarom zou je wel een Javascript framework gebruiken en niet zoiets?

## Je hebt je punt gemaakt Nordy, ga verder..
Oke oke, fijn. Dan kan ik nu lekker technisch gaan doen 🤗.

**Disclaimer:** *Alles wat hieronder staat is gebaseerd op wat ik zelf heb gemaakt en mijn ervaringen. Dit kan voor een ieder anders zijn!*

Mijn "vorige" blog was in NextJS en Tailwind gemaakt en zag er naar mijn mening niet verkeerd uit. Daarom was mijn doel om NextJS te vervangen voor Publish en tailwind met zijn stijlen te behouden in de nieuwe omgeving. Makje toch?

Ja nou niet zo snel, tijdens mijn zoektocht naar de juiste manier om tailwind toe te voegen aan mijn project. Ben ik tegen een aantal problemen aangelopen. TailwindCSS heeft namelijk 2 manieren om te gebruiken. Je kan de minified versie ophalen vanuit een CDN of je kan NPM/ Yarn gebruiken om de code binnen te krijgen. Dat laatste is de meest voorkomende variant, dit geeft je namelijk veel meer vrijheid bij het customizen van de Tailwind style. Maar hoe ga ik ooit een manier vinden om een npm package toe te voegen aan een swift project 🤔. 

Ik heb dit voor elkaar gekregen door in de main folder van het project een commando uit te voeren die ik al erg vaak heb uitgevoerd.
```shell
yarn add tailwindcss
```
Daar ging mijn terminal, zoekend naar de juiste packages om in het project te stoppen. Niets en niemand die hem tegen hield. En jawel, na enige tijd (want het blijft een variant van npm) had ik daar 3 nieuwe bestanden/ mappen. 
- Package.json
- Yarn.lock
- node_modules (Met daarin inmens veel mapjes met weet ik veel wat)
Tailwind was klaar om gebruikt te worden.


### Van tailwind naar css
Tailwind stond op mn computer maar werd nog niet gebruikt. Het was dus tijd om tailwind zijn werk te laten doen. Dit was het moment waar ik moest nadenken. Het is voor een tailwind project gebruikelijk dat je een config bestand aanmaakt in de root map. Maar dit is niet een gebruikelijk project. Na een diepe speurtocht op het internet kwam ik een artikel tegen die mij precies uitlegde hoe ik dit moest doen: <a href="https://paraside.in/design+code/publish+tailwindcss/"> Power your Publish (Swift) static site with Tailwind CSS</a>. Volgens dit artikel moest ik mijn configuratie bestand in mijn Thema stoppen. In deze map kwamen dan ook theme.css en styles.css. Is dit wel de juiste manier vroeg ik mij af.
<img src="https://media1.tenor.com/images/859b945f2ceaa00508d24a1340e2643d/tenor.gif?itemid=11946992"/>
Oke, dat is wel heel snel maar het is wel echt waar. Ik heb het geprobeerd maar het voelde niet goed, in het kader van automatiseren en goed voor het oog, heb ik besloten om mijn eigen oplossing te gebruiken.

### Wat voor oplossing is dat dan?
In 1 woord, Gulp. Ik heb in dit project gulp toegevoegd om mijn Tailwind configuratie om te zetten naar een minified css bestand die ik vervolgens in kan laden in mijn publish project. Dit ziet er dan zo uit:
```js
const gulp = require('gulp');

const tailwindConfig = "tailwind.config.js";
const mainCSS = "./Resources/MyTheme/theme.css";

gulp.task("css", function() {
    const atimport = require("postcss-import");
    const postcss = require("gulp-postcss");
    const tailwindcss = require("tailwindcss");
    const rename = require('gulp-rename');
    const cleanCSS = require('gulp-clean-css');

    return gulp
        .src(mainCSS)
        .pipe(postcss([atimport(), tailwindcss(tailwindConfig)]))
        .pipe(cleanCSS())
        .pipe(rename('styles.css'))
        .pipe(gulp.dest("./Resources/MyTheme/"));
});
```
*gulpfile.js*

Ik begin in dit bestand met het importeren van de nodige tools en bestanden. In dit geval gulp, mainCSS en tailwindConfig. Gulp wordt gebruikt voor het converteren van tailwindcss naar css. TailwindConfig voor de configuratie van tailwind (andere kleuren, typografie etc). en mainCSS is het bestand waarin ik tailwind importeer en aanpas daar waar nodig. 

In de CSS Task importeer ik vervolgens de nodige tools om het bestand te kunnen hernoemen, minifieen en verifiëren. 

De configuratie van gulp is klaar. Maar hoe gebruik ik dit? Simpel, met yarn, ik heb in mijn package.json een script toegevoegd die hiervoor zorgt.
```json
  "scripts": {
    "build": "gulp css --silent"
  }
```
Zoals je ziet, kan ik nu yarn build intypen in mijn terminal om vervolgens te zien hoe mijn tailwind omgezet wordt naar css.

## Hey leuk joh! Maar hoe zit dat met publish dan?
Ja, nou kijk. Nu kan ik in publish bij het defineren van mijn thema aangeven welk css bestand ik wil gebruiken. In dit geval is dat `MyThemes/Style.css` dit bestand wordt vervolgens gebruikt over de hele website. Hierdoor kan ik aan elk html element een class toevoegen die vervolgens een mooi resultaat geeft kijk maar eens hoe ik dat doe.
```swift
extension Node where Context == HTML.BodyContext {
    static func siteHeader<T: Website>(for context: PublishingContext<T>) -> Node {
        .header(
            .wrapper(
                .nav(
                    .class("site-name"),
                    .a(
                        .href("/"),
                        .text(context.site.name),
                        .class("font-bold text-blue-500 text-2xl hover:text-blue-700")
                    )
                )
            ),
            .wrapper(
                .a(
                    .href("https://github.com/NordyVlasman"),
                    .text("Github &rarr;"),
                    .class("font-medium text-gray-500 hover:text-gray-700")
                ),
                .class("text-base leading-5")
            ),
            .class("flex justify-between items-center py-10")
        )
    }
}
```
Wat je hier ziet is de header van deze website. Hierin staat een titel en een link naar mijn github pagina. Voor elk html element heb ik een class property toegevoegd waar ik vervolgens mijn stijl aan kan geven. Mooi he?

## Conclusie
De combinatie van Swift Publish met TailwindCSS is erg sterk. Je moet alleen wel de juiste manier vinden om dit netjes te doen. In mijn <a href="https://github.com/NordyVlasman/nordyvlasman" target="_blank">github repository</a> kan je verder kijken naar hoe ik mijn website in elkaar heb gesleuteld. Wellicht vindt je het interessant 😊.
---
date: 2020-10-09 13:30
description: Een week vol knutselen met onder andere Vue 3, Swift en Laravel 

tags: Swift, Vue 3, Laravel
author: Nordy Vlasman
title: Vue 3 en allemaal andere dingen
---
18 September was het dan zo ver. Vue 3 werd uitgebracht, met daarin als belangrijkste verandering de <a href="https://github.com/vuejs/composition-api">Composition Api</a>. Met deze verandering wordt het programmeren in Vue compleet veranderd, waar je voorheen de options api gebruikte met daarin de diverse functies. Maak je nu alles "zelf", je hebt dus geen data property meer maar Ref's. De werking van de composition api is redelijk te vergelijken met React.

**Voorbeeld Vue 3 Composition**
```vue
<template>
  <div>
    <h1>Counter</h1>
    <h3>Current count: {{ count }}</h3>
    <button @click="decrement">-</button> | <button @click="increment">+</button>
  </div>
</template>

<script>
import { ref } from 'vue'
export default {
  setup() {
    const count = ref(1)

    const increment = () => {
      count.value += 1
    }

    const decrement = () => {
      if (count.value == 0) { return }
      count.value -= 1
    }

    return {
      count,
      increment,
      decrement
    }
  }
}
</script>
```

**Voorbeeld Vue 2 Options API**
```
<template>
  <div>
    <h1>Counter</h1>
    <h3>Current count: {{ count }}</h3>
    <button @click="decrement">-</button> | <button @click="increment">+</button>
  </div>
</template>

<script>
export default {
  data() {
    return {
      count: 0
    }
  },

  methods: {
    decrement() {
      if (this.count == 0) { return }
      this.count -= 1
    },

    increment() {
      this.count += 1
    }
  }
}
</script>
```

Zoals je hierboven ziet, is er genoeg veranderd. Naar mijn mening is dit goed. Voornamelijk omdat je nu je component methods kan verdelen in extra bestanden. Hierdoor hou je specifieke functions gescheiden en blijft je bestand een stuk kleiner. Daarnaast is de composition api ook een verbetering voor Typescript, wat eerder nog een beetje hacky leek, is nu veranderd naar een veel logischere versie. 

> Voor meer informatie over Vue 3 kijk vooral even hier: <a href="https://www.youtube.com/watch?v=WLpLYhnGqPA" target="_blank">https://www.youtube.com/watch?v=WLpLYhnGqPA</a>

## Knutseltijd met Swift
Jawel, ik ben ondertussen al 2 vrijdagen bezig geweest met mijn Declarative UI package. Het doel hiervan is om mijn Backend data (JSON) over te zetten naar SwiftUI. Hiermee wil ik eigenlijk leren hoe ik een swift package moet maken met daarin de juiste structuur. Best wel een gedoe hoor
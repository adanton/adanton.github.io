---
title: "Eventos con Github"
author: Adanton
date: 2021-03-01T20:23:47+01:00
draft: false
tags: ["github"]
categories: []
toc: false
backtotop: true
disable_comments: true
---

Se trata de ejecutar comandos basados en eventos relacionados con el respositorio de Github que estoy trabahando.
<!--more-->

Puedo ejecutar comandos ante cualquier evento del repositorio:
- prepare-commit
- pre-commit
- update
- post-update
- etc.

Estos eventos se guardan en la carpeta `.git/hooks`, de hecho ahí se pueden encontrar algunos ejemplos.

Pero es conveniente crear un script en la carpeta en otra carpeta del proyecto que sea clonada en todos los equipos de desarrollo y poner solo un link en la carpeta hooks. Por ejemplo estando en la carpeta raiz:
```
ln -s pre-commit.sh .git/hook/pre-commit
```

